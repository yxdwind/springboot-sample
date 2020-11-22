package com.renfeng.common;

/**
 * 返回结果
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019-08-16
 */
public class Result<T> implements java.io.Serializable {

    private static final long serialVersionUID = 5222790171955638545L;

    private boolean status;
    private String code;
    private String msg;
    private T data;

    public String getCode() {
        return code;
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

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }


    public static Result success(Object data) {
        Result result = new Result();
        result.setStatus(true);
        result.setCode(ResultCodeEnum.Success.getCode());
        result.setMsg(ResultCodeEnum.Success.getMsg());
        result.setData(data);
        return result;
    }

    public static Result success() {
        Result result = new Result();
        result.setStatus(true);
        result.setCode(ResultCodeEnum.Success.getCode());
        result.setMsg(ResultCodeEnum.Success.getMsg());
        return result;
    }

    public static Result bizError(String code, String msg) {
        Result result = new Result();
        result.setStatus(false);
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    public static Result bizError(ResultCodeEnum resultCodeEnum) {
        return bizError(resultCodeEnum.getCode(), resultCodeEnum.getMsg());
    }


    /**
     * 系统异常
     *
     * @return
     */
    public static Result sysError() {
        Result result = new Result();
        result.setStatus(false);
        result.setCode(ResultCodeEnum.SysError.getCode());
        result.setMsg(ResultCodeEnum.SysError.getMsg());
        return result;
    }


    /**
     * @param
     * @return com.agent.common.vo.Result
     * @throws
     * @description 无业务性参数错误
     * @date 2019/7/6
     */
    public static Result paramError() {
        Result result = new Result();
        result.setStatus(false);
        result.setCode(ResultCodeEnum.ParamError.getCode());
        result.setMsg(ResultCodeEnum.ParamError.getMsg());
        return result;
    }

    /**
     * 参数错误
     * @param msg 错误描述
     * @return Result
     */
    public static Result paramErrorWithMsg(String msg) {
        Result result = new Result();
        result.setStatus(false);
        result.setCode(ResultCodeEnum.ParamError.getCode());
        result.setMsg(ResultCodeEnum.ParamError.getMsg() + " : " +msg);
        return result;
    }

    /**
     * 404资源未找到
     **/
    public static Result notFoundError() {
        Result result = new Result();
        result.setStatus(false);
        result.setCode(ResultCodeEnum.NotFound.getCode());
        result.setMsg(ResultCodeEnum.NotFound.getMsg());
        return result;
    }


    public boolean isStatus() {
        return status;
    }

    private void setStatus(boolean status) {
        this.status = status;
    }
}
