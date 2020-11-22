package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysRole;

import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:14
 */
public interface SysRoleService {

    int deleteByPrimaryKey(String id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

    boolean saveOrUpdate(SysRole sysRole);

    boolean deleteRecord(String id);

    PageInfo<SysRole> selectPageByOrgIdAndName(int pageNumber, int pageSize, String orgId, String name);

    /**
     * 获取登录用户角色
     * @param userLoginName
     * @return
     */
    List<SysRole> getUserRole(String userLoginName);
    /**
     * 根据机构id获取机构树可选角色
     * @param orgId
     * @return
     */
    List<SysRole> getOrgTreeRole(String orgId);

    /**
     * 根据机构id获取机构同级角色
     * @param orgId
     * @return
     */
    List<SysRole> getOrgIdRole(String orgId);


    List<SysMenu> selectByRole(String roleId);

    List<SysRole> selectSysRoleList();
}
