package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.common.Result;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysRole;
import com.renfeng.model.SysUser;

import java.util.List;
import java.util.Set;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:14
 */
public interface SysUserService {
    int deleteByPrimaryKey(String id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    Result doLogin(String loginName, String password);

    boolean saveOrUpdate(SysUser sysUser);

    boolean deleteRecord(String id);

    PageInfo<SysUser> selectPageByOrgIdAndNameAndLoginNameAndJobNo(int pageNumber, int pageSize, String orgId, String name, String loginName, String jobNo);

    SysUser selectByIdCard(String idCard);

    SysUser selectByLoginName(String loginName);

    List<SysUser> selectByOrgId(String orgId, String name);

    List<SysMenu> getUserMenu(String loginName);

    Set<String> getPermissions(SysUser user);

    void setRoleToUser(String id, Set<String> roleIds);


    List<SysRole> selectRolesByUserId(String id);
}
