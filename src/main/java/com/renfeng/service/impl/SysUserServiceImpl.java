package com.renfeng.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Constants;
import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.dao.mapper.SysUserMapper;
import com.renfeng.dao.mapper.SysUserRoleMapper;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysRole;
import com.renfeng.model.SysUser;
import com.renfeng.model.SysUserRole;
import com.renfeng.service.*;
import com.renfeng.util.ArrayUtils;
import com.renfeng.util.EncryptUtils;
import com.renfeng.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:40
 */
@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Override
    public int deleteByPrimaryKey(String id) {
        return sysUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysUser record) {
        return sysUserMapper.insert(record);
    }

    @Override
    public int insertSelective(SysUser record) {
        return sysUserMapper.insertSelective(record);
    }

    @Override
    public SysUser selectByPrimaryKey(String id) {
        return sysUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysUser record) {
        return sysUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysUser record) {
        return sysUserMapper.insert(record);
    }

    @Override
    public Result doLogin(String loginName, String password) {
        SysUser user = sysUserMapper.selectByLoginName(loginName);
        if (user == null) {
            return Result.bizError(ResultCodeEnum.UserNotFound);
        }
        if (!user.getPassword().equals(EncryptUtils.md5(password + user.getSalt()))) {
            return Result.bizError(ResultCodeEnum.LoginFail);
        }
        return Result.success(user);
    }

    @Override
    public boolean saveOrUpdate(SysUser record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setSalt(StringUtils.getSnowFlakeValue());
            record.setPassword(EncryptUtils.md5(record.getPassword() + record.getSalt()));
            record.setId(StringUtils.uuid());
            return insertSelective(record) > 0;
        }

        if (StringUtils.isNotBlank(record.getPassword())) {
            record.setSalt(StringUtils.getSnowFlakeValue());
            record.setPassword(EncryptUtils.md5(record.getPassword() + record.getSalt()));
        }

        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysUser record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public PageInfo<SysUser> selectPageByOrgIdAndNameAndLoginNameAndJobNo(int pageNumber, int pageSize, String orgId, String name, String loginName, String jobNo) {

        PageInfo<SysUser> userPageInfo = PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> sysUserMapper.selectByOrgIdAndNameAndLoginNameAndJobNo(orgId, name, loginName, jobNo));
        //获取用户角色信息
        if (userPageInfo.getList() != null && ArrayUtils.isNotEmpty(userPageInfo.getList())) {
            userPageInfo.getList().forEach(sysUser -> {
                List<SysUserRole> userRole = sysUserRoleService.selectByUserId(sysUser.getId());
                List<String> roldId = new ArrayList<>();
                if (ArrayUtils.isNotEmpty(userRole)) {
                    userRole.forEach(user -> {
                        roldId.add(user.getRoleId());
                    });
                    sysUser.setRoleIdList(roldId);
                }

            });

        }

        return userPageInfo;
    }

    @Override
    public SysUser selectByIdCard(String idCard) {
        return sysUserMapper.selectByIdCard(idCard);
    }

    @Override
    public SysUser selectByLoginName(String loginName) {
        return sysUserMapper.selectByLoginName(loginName);
    }

    @Override
    public List<SysUser> selectByOrgId(String orgId, String name) {
        return sysUserMapper.selectByOrgId(orgId, name);
    }

    @Override
    public List<SysMenu> getUserMenu(String loginName) {
        List<SysMenu> sysMenuList = new ArrayList<>();

        //  List<SysRole>   sysRoleList=sysRoleService.getUserRole(loginName);
        //获取用户角色
        List<SysRole> userRole = sysRoleService.getUserRole(loginName);
        if (ArrayUtils.isNotEmpty(userRole)) {
//            for (SysRole sysRole : userRole) {
//
//            }

            userRole.forEach(sysRole -> {
                //根据用户角色获取菜单列表
                List<SysMenu> menuList = sysRoleService.selectByRole(sysRole.getId());
                if (ArrayUtils.isNotEmpty(menuList)) {
                    sysMenuList.addAll(menuList);
                }


            });
        }

        return sysMenuList;
    }

    @Override
    public Set<String> getPermissions(SysUser user) {
        List<SysRole> roleList = sysRoleService.getUserRole(user.getLoginName());
        if (roleList == null || roleList.isEmpty()) {
            return null;
        }
        Set<String> set = new HashSet<>();
        roleList.stream().forEach(role -> {
            List<SysMenu> list = sysRoleService.selectByRole(role.getId());
            list.stream().forEach(menu -> set.add(menu.getName()));
        });
        return set;
    }

    @Override
    public void setRoleToUser(String id, Set<String> roleIds) {
        if (roleIds.size() == 0) {
            return;
        }
        Iterator iterator = roleIds.iterator();
        while (iterator.hasNext()) {
            String roleId = (String) iterator.next();
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(id);
            sysUserRole.setRoleId(roleId);
            sysUserRoleService.saveOrUpdate(sysUserRole);
        }
    }

    @Override
    public List<SysRole> selectRolesByUserId(String id) {
        List<SysUserRole> list = sysUserRoleService.selectByUserId(id);
        if (CollectionUtil.isEmpty(list)) {
            return null;
        }
        List<SysRole> roleList = new ArrayList<>(list.size());
        list.stream().forEach(userRole -> {
            SysRole role = sysRoleService.selectByPrimaryKey(userRole.getRoleId());
            if (role != null) {
                roleList.add(role);
            }
        });
        return roleList;
    }

}
