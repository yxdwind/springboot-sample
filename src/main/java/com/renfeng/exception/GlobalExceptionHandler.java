package com.renfeng.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2020/2/12 20:52
 */
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public Map<String, Object> resultErr(){
        Map<String, Object> resultMap =  new HashMap<>();
        resultMap.put("errorCode","500");
        resultMap.put("errorMsg","系统错误");
        return resultMap;
    }
}
