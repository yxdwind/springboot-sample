package com.renfeng.dao.mapper;


import com.renfeng.model.SysMenu;

import java.util.List;

public interface SysMenuMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysMenu record);

    int insertSelective(SysMenu record);

    SysMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysMenu record);

    int updateByPrimaryKey(SysMenu record);

    List<SysMenu> selectAll();

    List<SysMenu> selectParent();

    List<SysMenu> selectByParentId(String parentId);
}