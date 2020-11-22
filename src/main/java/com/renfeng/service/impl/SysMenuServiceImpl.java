package com.renfeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.SysMenuMapper;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysRoleMenu;
import com.renfeng.service.SysMenuService;
import com.renfeng.service.SysRoleMenuService;
import com.renfeng.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/25 17:22
 */
@Service
public class SysMenuServiceImpl implements SysMenuService {
    @Resource
    private SysMenuMapper sysMenuMapper;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;

    @Override
    public int deleteByPrimaryKey(String id) {
        return sysMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysMenu record) {
        return sysMenuMapper.insert(record);
    }

    @Override
    public int insertSelective(SysMenu record) {
        return sysMenuMapper.insertSelective(record);
    }

    @Override
    public SysMenu selectByPrimaryKey(String id) {
        return sysMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysMenu record) {
        return sysMenuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysMenu record) {
        return sysMenuMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean saveOrUpdate(SysMenu record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            record.setDelFlag("0");
            record.setCreateDate(new Date());
            return insertSelective(record) > 0;
        }
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysMenu record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public List<SysMenu> findSysMenuList() {
        //获取父级菜单
        List<SysMenu> sysMenuList = sysMenuMapper.selectParent();
        sysMenuList.stream().forEach(sysMenu -> {

            List<SysMenu> submenuList = sysMenuMapper.selectByParentId(sysMenu.getId());
            submenuList.stream().forEach(submenu -> {
                submenu.setSysMenuList(sysMenuMapper.selectByParentId(submenu.getId()));
            });
            sysMenu.setSysMenuList(submenuList);

        });
        return sysMenuList;
    }

    @Override
    public PageInfo<SysMenu> selectPage(int pageNumber, int pageSize) {
        return PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> sysMenuMapper.selectAll());
    }

    @Override
    public List<SysMenu> selectByParentId(String parentId) {
        return sysMenuMapper.selectByParentId(parentId);
    }

    @Override
    public List<SysMenu> findByRoles(Set<String> roleIds) {
        if (roleIds.isEmpty()) {
            return null;
        }
        List<SysMenu> list = new ArrayList<>(roleIds.size());
        roleIds.stream().forEach(roleId -> {
            List<SysRoleMenu> sysRoleMenus = sysRoleMenuService.selectByRoleId(roleId);
            sysRoleMenus.stream().forEach(roleMenu -> {
                SysMenu menu = sysMenuMapper.selectByPrimaryKey(roleMenu.getMenuId());
                if (menu != null) {
                    list.add(menu);
                }
            });
        });
        return list;
    }
}
