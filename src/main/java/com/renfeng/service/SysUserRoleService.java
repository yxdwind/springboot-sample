package com.renfeng.service;

import com.renfeng.model.SysUserRole;

import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/11/4 16:30
 */
public interface SysUserRoleService {

    int deleteByPrimaryKey(String id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    SysUserRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);

    boolean saveOrUpdate(SysUserRole sysUser);

    boolean deleteRecord(String id);

    boolean deleteByUserId(String userId);

    List<SysUserRole> selectByUserId(String userId);
}
