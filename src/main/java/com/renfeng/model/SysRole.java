package com.renfeng.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SysRole {
    private String id;

    private String orgId;

    private String orgName;

    private String name;

    private Integer sort;

    private String delFlag;

    private Date createDate;

    private Date updateDate;

    List<String> sysMenuList=new ArrayList<String>();

    List<String> sysSaveMenuList=new ArrayList<String>();

    public List<String> getSysSaveMenuList() {
        return sysSaveMenuList;
    }

    public void setSysSaveMenuList(List<String> sysSaveMenuList) {
        this.sysSaveMenuList = sysSaveMenuList;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public List<String> getSysMenuList() {
        return sysMenuList;
    }

    public void setSysMenuList(List<String> sysMenuList) {
        this.sysMenuList = sysMenuList;
    }

    public SysRole(String id, String orgId, String name, Integer sort, String delFlag, Date createDate, Date updateDate) {
        this.id = id;
        this.orgId = orgId;
        this.name = name;
        this.sort = sort;
        this.delFlag = delFlag;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public SysRole() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}