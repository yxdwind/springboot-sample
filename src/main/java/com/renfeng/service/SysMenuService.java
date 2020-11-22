package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.model.SysMenu;

import java.util.List;
import java.util.Set;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:14
 */
public interface SysMenuService {
    int deleteByPrimaryKey(String id);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);

    boolean saveOrUpdate(SysMenu record);

    boolean deleteRecord(String id);
    
    List<SysMenu> findSysMenuList();

    PageInfo<SysMenu> selectPage(int pageNumber, int pageSize);
    //根据用户名获取菜单列表
    List<SysMenu> selectByParentId(String parentId);

    List<SysMenu> findByRoles(Set<String> roleIds);
}
