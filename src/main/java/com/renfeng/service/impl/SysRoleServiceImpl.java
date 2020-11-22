package com.renfeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.*;
import com.renfeng.model.*;
import com.renfeng.service.SysOrgService;
import com.renfeng.service.SysRoleService;
import com.renfeng.service.SysUserRoleService;
import com.renfeng.util.ArrayUtils;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/25 17:14
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Resource
    SysRoleMapper sysRoleMapper;

    @Resource
    SysRoleMenuMapper sysRoleMenuMapper;

    @Resource
    SysOrgMapper sysOrgMapper;
    @Resource
    SysMenuMapper sysMenuMapper;
    @Resource
    SysUserMapper sysUserMapper;
    @Resource
    SysUserRoleService sysUserRoleService;

    @Resource
    SysOrgService sysOrgService;

    @Override
    public int deleteByPrimaryKey(String id) {
        return sysRoleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysRole record) {
        return sysRoleMapper.insert(record);
    }

    @Override
    public int insertSelective(SysRole record) {
        return sysRoleMapper.insertSelective(record);
    }

    @Override
    public SysRole selectByPrimaryKey(String id) {
        return sysRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysRole record) {
        return sysRoleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysRole record) {
        return sysRoleMapper.insert(record);
    }

    @Override
    public boolean saveOrUpdate(SysRole record) {
        //判断角色id是否为空
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            record.setCreateDate(new Date());
            //存储菜单id
            record.getSysSaveMenuList().forEach(string -> {
                SysRoleMenu sysRoleMenu = new SysRoleMenu();
                sysRoleMenu.setId(StringUtils.uuid());
                sysRoleMenu.setMenuId(string);
                sysRoleMenu.setCreateDate(new Date());
                sysRoleMenu.setRoleId(record.getId());
                sysRoleMenu.setOrgId(record.getOrgId());
                sysRoleMenu.setDelFlag("0");
                sysRoleMenuMapper.insert(sysRoleMenu);
            });
            //插入新角色
            return insertSelective(record) > 0;
        }

        //删除角色菜单
        sysRoleMenuMapper.selectByRoleId(record.getId()).forEach(sysRoleMenu -> {
            sysRoleMenuMapper.deleteByPrimaryKey(sysRoleMenu.getId());

        });

        //存储菜单id
        record.getSysSaveMenuList().forEach(string -> {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setId(StringUtils.uuid());
            sysRoleMenu.setMenuId(string);
            sysRoleMenu.setCreateDate(new Date());
            sysRoleMenu.setRoleId(record.getId());
            sysRoleMenu.setOrgId(record.getOrgId());
            sysRoleMenu.setDelFlag("0");

            sysRoleMenuMapper.insert(sysRoleMenu);
        });


        record.setUpdateDate(new Date());
        //更新角色
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysRole record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public PageInfo<SysRole> selectPageByOrgIdAndName(int pageNumber, int pageSize, String orgId, String name) {
        return PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> {
            //获取角色列表
            List<SysRole> sysRoleList = sysRoleMapper.selectByOrgIdAndName(orgId, name);
            sysRoleList.forEach(sysRole -> {
                if (StringUtils.isNotBlank(sysRole.getOrgId())) {
                    sysRole.setOrgName(sysOrgMapper.selectByPrimaryKey(sysRole.getOrgId()).getName());
                }
                //查询角色菜单列表
                List<String> sysMenuList = new ArrayList<String>();
                sysRoleMenuMapper.selectByRoleId(sysRole.getId()).forEach(sysRoleMenu -> {
                    if (sysMenuMapper.selectByParentId(sysRoleMenu.getMenuId()).size() <= 0) {
                        sysMenuList.add(sysRoleMenu.getMenuId());
                    }

                });
                sysRole.setSysMenuList(sysMenuList);
            });
        });
    }

    /**
     * 根据机构id获取机构树可选角色
     *
     * @param orgId
     * @return
     */
    @Override
    public List<SysRole> getOrgTreeRole(String orgId) {
        List<SysRole> sysRoleList = new ArrayList<>();
        SysOrg sysOrg = new SysOrg();
        sysOrg.setId(orgId);
        //获取下级机构
        sysOrgService.packageTree(sysOrg);
        //获取机构同级角色
        sysRoleList.addAll(getOrgIdRole(orgId));

        //获取下级机构角色
        if (ArrayUtils.isNotEmpty(sysOrg.getSonList())) {
            queryLower(sysOrg, sysRoleList);
        }

        //返回角色列表
        return sysRoleList;
    }

    public void queryLower(SysOrg sysOrg, List<SysRole> sysRoleList) {
        //获取下级机构
        if (ArrayUtils.isNotEmpty(sysOrg.getSonList())) {
            for (SysOrg org : sysOrg.getSonList()) {
                queryLower(org, sysRoleList);
                sysRoleList.addAll(getOrgIdRole(org.getId()));
            }
        }

    }


    /**
     * 根据机构id获取机构同级角色
     *
     * @param orgId
     * @return
     */
    @Override
    public List<SysRole> getOrgIdRole(String orgId) {
        List<SysRole> sysRoleList = new ArrayList<>();
        //根据机构获取角色
        List<SysRole> judgeList = new ArrayList<>();
        judgeList = sysRoleMapper.selectByOrgIdAndName(orgId, "");
        if (ArrayUtils.isNotEmpty(judgeList)) {
            sysRoleList.addAll(judgeList);
        }
        return sysRoleList;
    }

    /**
     * 获取登录用户角色
     *
     * @param userLoginName
     * @return
     */
    @Override
    public List<SysRole> getUserRole(String userLoginName) {
        SysUser sysUser = sysUserMapper.selectByLoginName(userLoginName);
        if (sysUser == null) {
            return null;
        }
        //获取用户角色
        List<SysUserRole> sysUserRoleList = sysUserRoleService.selectByUserId(sysUser.getId());
        List<SysRole> sysRoleList = new ArrayList<>();
        if (ArrayUtils.isNotEmpty(sysUserRoleList)) {
            for (SysUserRole sysUserRole : sysUserRoleList) {
                SysRole sysRole = sysRoleMapper.selectByPrimaryKey(sysUserRole.getRoleId());
                if (sysRole != null) {
                    sysRoleList.add(sysRole);
                }
            }
        }
        //获取当前登录用户角色
        return sysRoleList;
    }


    //根据角色获取菜单
    @Override
    public List<SysMenu> selectByRole(String roleId) {
        List<SysMenu> sysMenuList = new ArrayList<>();

        sysRoleMenuMapper.selectByRoleId(roleId).forEach(sysRoleMenu -> {
            sysMenuList.add(sysMenuMapper.selectByPrimaryKey(sysRoleMenu.getMenuId()));
        });
        return sysMenuList;
    }

    @Override
    public List<SysRole> selectSysRoleList() {
        return sysRoleMapper.selectSysRoleList();
    }
}
