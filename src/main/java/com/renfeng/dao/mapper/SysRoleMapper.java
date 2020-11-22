package com.renfeng.dao.mapper;


import com.renfeng.model.SysRole;

import java.util.List;

public interface SysRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    List<SysRole> selectByOrgIdAndName(String orgId, String name);

    List<SysRole> selectSysRoleList();
}