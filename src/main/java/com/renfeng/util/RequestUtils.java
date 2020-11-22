package com.renfeng.util;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * 请求参数转换
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/25 14:20
 */
public class RequestUtils {
    /**
     *@date 2019/6/26
     *@return int
     */
    public static int param2Int(HttpServletRequest request, String param){
        String v= request.getParameter(param);
        if(StringUtils.isEmpty(param)){
            return 0;
        }
        try{
            return Integer.valueOf(v).intValue();
        }catch (Exception e){
            return  0;
        }
    }

    public static long param2Long(HttpServletRequest request, String param){
        String v= request.getParameter(param);
        if(StringUtils.isEmpty(param)){
            return 0;
        }
        try{
            return Long.valueOf(v).longValue();
        }catch (Exception e){
            return  0;
        }
    }

    protected static double param2Double(HttpServletRequest request, String param){
        String v= request.getParameter(param);
        if(StringUtils.isEmpty(param)){
            return 0.0;
        }
        try{
            return Double.valueOf(v).doubleValue();
        }catch (Exception e){
            return  0.0;
        }
    }

    public static String getparam(HttpServletRequest request, String param){
        String v= request.getParameter(param);
        if(StringUtils.isEmpty(v)){
            return "";
        }
        try{
            return v;
        }catch (Exception e){
            return  "";
        }
    }


    /**
     *@description 所有参数转换成Map(多参数值去重)
     *@date 2019/6/26
     *@param
     *@return Map<String , String>
     *@throws
     */
    public static Map<String, String> params2Map(HttpServletRequest request) {

        Map<String, String> data = new HashMap<>();

        for (Map.Entry<String, String[]> entry : request.getParameterMap()
                .entrySet()) {

            data.put(entry.getKey(), entry.getValue()[0]);
        }
        return data;
    }


    /**
     *@description 请求数据转换为字符串
     *@date 2019/6/26
     *@param
     *@return java.lang.String
     *@throws
     */
    public static String data2Str(HttpServletRequest request, String charSet) {
        StringBuffer sb = new StringBuffer();
        try {
            ServletInputStream sis = request.getInputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = sis.read(buffer, 0, buffer.length)) != -1) {
                sb.append(new String(buffer, 0, len, charSet));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    /**
     *@description 输出json
     *@date 2019/6/26
     *@param
     *@return void
     *@throws
     */
    public static void printJSON(HttpServletResponse response, Object o) {
        try {
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(FastJsonUtils.obj2JSON(o));
            out.flush();
            out.close();
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    /**
     *@description 输出任意格式文本
     *@date 2019/6/26
     *@param
     *@return void
     *@throws
     */
    public static void printText(HttpServletResponse response, String msg) {
        try {
            response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.print(msg);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
