package com.renfeng.model;

import java.util.Date;

public class LogOperation {
    private String id;

    private String userId;

    private String userInfo;

    private String menu;

    private String url;

    private String ip;

    private String delFlag;

    private Date createDate;

    private Date updateDate;

    public LogOperation(String id, String userId, String userInfo, String menu, String url, String ip, String delFlag, Date createDate, Date updateDate) {
        this.id = id;
        this.userId = userId;
        this.userInfo = userInfo;
        this.menu = menu;
        this.url = url;
        this.ip = ip;
        this.delFlag = delFlag;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public LogOperation() {
        super();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu == null ? null : menu.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
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

    public String getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(String userInfo) {
        this.userInfo = userInfo == null ? null : userInfo.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }
}