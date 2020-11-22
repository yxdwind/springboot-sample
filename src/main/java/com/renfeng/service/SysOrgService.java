package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.model.SysOrg;

import java.util.List;
import java.util.Map;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:10
 */
public interface SysOrgService {

    int deleteByPrimaryKey(String id);

    int insert(SysOrg record);

    int insertSelective(SysOrg record);

    SysOrg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysOrg record);

    int updateByPrimaryKey(SysOrg record);

    PageInfo<SysOrg> selectOrgPageByParentId(int pageNumber, int pageSize, String parentId);

    List<SysOrg> selectListByParentId(String parentId);

    boolean saveOrUpdate(SysOrg sysOrg);

    boolean deleteRecord(String id);

    Map<String,String>  selectAllParentById(String id);

    List<SysOrg> selectAll();

    List<SysOrg> selectTop();

    void packageTree(SysOrg sysOrg);
}
