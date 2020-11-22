package com.renfeng.dao.mapper;


import com.renfeng.model.SysOrg;

import java.util.List;

public interface SysOrgMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysOrg record);

    int insertSelective(SysOrg record);

    SysOrg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysOrg record);

    int updateByPrimaryKey(SysOrg record);

    List<SysOrg> selectByParentId(String parentId);

    List<SysOrg> selectAll();

    List<SysOrg> selectTop();
}