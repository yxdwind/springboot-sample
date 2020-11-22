package com.renfeng.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class SysOrg implements Serializable {

    private static final long serialVersionUID = -3907357211646641178L;

    private String id;

    private String parentId;

    private String name;

    private String code;

    private Integer sort;

    private String delFlag;

    private Date createDate;

    private Date updateDate;

    private List<SysOrg> sonList;

    public SysOrg(String id, String parentId, String name, String code,Integer sort, String delFlag, Date createDate, Date updateDate) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.code = code;
        this.sort = sort;
        this.delFlag = delFlag;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public SysOrg(String id, String parentId, String name, String code,Integer sort, String delFlag, Date createDate, Date updateDate, List<SysOrg> sonList) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.code = code;
        this.sort = sort;
        this.delFlag = delFlag;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.sonList = sonList;
    }

    public SysOrg() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
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

    public List<SysOrg> getSonList() {
        return sonList;
    }

    public void setSonList(List<SysOrg> sonList) {
        this.sonList = sonList;
    }
}