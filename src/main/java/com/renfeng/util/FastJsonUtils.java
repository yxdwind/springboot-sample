package com.renfeng.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.*;

/**
 * fastjson实用工具
 *
 * @author yanxiaodong
 */
public class FastJsonUtils {
    private static final SerializeConfig config;
    private static final SerializerFeature[] features = {
            // 输出空置字段
            SerializerFeature.WriteMapNullValue,
            // list字段如果为null，输出为[]
            SerializerFeature.WriteNullListAsEmpty,
            // 数值字段如果为null，输出为0，而不是
            SerializerFeature.WriteNullNumberAsZero,
            // Boolean字段如果为null，输出为false
            SerializerFeature.WriteNullBooleanAsFalse,
            // 字符类型字段如果为null，输出为""，而不是null
            SerializerFeature.WriteNullStringAsEmpty,
            // 使用单引号
            // SerializerFeature.UseSingleQuotes
            // 禁用循环引用
            SerializerFeature.DisableCircularReferenceDetect

    };

    static {
        config = new SerializeConfig();
        // 使用和json-lib兼容的日期输出格式
        config.put(java.util.Date.class, new JSONLibDataFormatSerializer());
        // 使用和json-lib兼容的日期输出格式
        config.put(java.sql.Date.class, new JSONLibDataFormatSerializer());
    }

    /**
     * @param obj
     * @return String
     */
    public static String obj2JSON(Object obj) {
        return JSON.toJSONString(obj, config, features);
    }

    /**
     * @param
     * @return obj
     */

    public static <T> T json2Object(String json, Class<T> clazz) {

        return JSON.parseObject(json, clazz);

    }

    /**
     * @param obj
     * @param fileds 过滤的属性名
     * @return String
     */
    public static String obj2JSON(Object obj, String... fileds) {

        SerializeWriter sw = new SerializeWriter();
        JSONSerializer serializer = new JSONSerializer(sw);
        serializer.write(obj);
        return sw.toString();
    }
}
