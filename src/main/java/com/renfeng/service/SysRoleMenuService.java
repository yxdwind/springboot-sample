package com.renfeng.service;

import com.renfeng.model.SysRoleMenu;

import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:15
 */
public interface SysRoleMenuService {

    int deleteByPrimaryKey(String id);

    int insert(SysRoleMenu record);

    int insertSelective(SysRoleMenu record);

    SysRoleMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRoleMenu record);

    int updateByPrimaryKey(SysRoleMenu record);

    boolean saveOrUpdate(SysRoleMenu record);

    boolean deleteRecord(String id);

    List<SysRoleMenu> selectByRoleId(String roleId);
}
