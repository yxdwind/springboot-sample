package com.renfeng.dao.mapper;


import com.renfeng.model.SysUser;

import java.util.List;

public interface SysUserMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    SysUser selectByLoginName(String loginName);

    SysUser selectByIdCard(String idCard);

    List<SysUser> selectByOrgIdAndNameAndLoginNameAndJobNo(String orgId, String name, String loginName, String jobNo);

    List<SysUser> selectByOrgId(String orgId, String name);
}