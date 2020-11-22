package com.renfeng.model;

import java.util.Date;
import java.util.List;

public class SysDict {
    private String id;

    private String name;

    private String code;

    private String remark;

    private String enabled;

    private String delFlag;

    private Date createDate;

    private Date updateDate;

    private List<SysDictList> sysDictLists;

    public SysDict(String id, String name, String code, String remark, String enabled, String delFlag, Date createDate, Date updateDate) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.remark = remark;
        this.enabled = enabled;
        this.delFlag = delFlag;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }


    public List<SysDictList> getSysDictLists() {
        return sysDictLists;
    }

    public void setSysDictLists(List<SysDictList> sysDictLists) {
        this.sysDictLists = sysDictLists;
    }

    public SysDict() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled == null ? null : enabled.trim();
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
}