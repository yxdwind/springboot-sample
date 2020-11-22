package com.renfeng.common;

/**
 * 结果编码
 * @author yanxiaodong
 * @version 1.0
 * @date 2019-08-16
 */
public enum ResultCodeEnum {
    /**
     * sys 系统标识
     * module 模块标识
     * code 业务编码
     * msg 提示信息
     */
    SysError("SYS", "SYS", "ERROR", "系统未知错误"),
    Success("SYS", "HANDLER", "SUCCESS", "处理成功!"),
    UserNotFound("SYS", "LOGIN", "NOTFOUND", "用户不存在"),
    LoginFail("SYS", "LOGIN", "FAIL", "用户名或密码错误"),
    UnLogin("SYS", "LOGIN", "UNLISTED", "用户未登录"),
    NotFound("SYS", "RESC", "NOTFOUND", "404资源未找到"),
    ParamError("SYS", "SYS", "FAIL", "参数错误"),
    UserError("SYS", "SYS", "FAIL", "用户名已存在，请重新输入"),
    OperateError("SYS", "SYS", "FAIL", "网络异常，请稍候再试"),
    PermissionNotFound("SYS", "SYS", "NOTPERMISSION", "没有权限");


    private String sys;
    private String module;
    private String code;
    private String msg;

    ResultCodeEnum(String sys, String module, String code, String msg) {
        this.sys = sys;
        this.module = module;
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return sys + "-" + module + "-" + code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSys() {
        return sys;
    }

    public void setSys(String sys) {
        this.sys = sys;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

}
