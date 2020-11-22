package com.renfeng.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author yanxiaodong
 */
public class ArrayUtils {

    public static boolean isNotEmpty(List list) {
        return list != null && list.size() > 0;
    }

    public static boolean isNotEmpty(Map map) {
        return map != null && map.size() > 0;
    }

    public static boolean isNullOrEmpty(List list) {
        return list == null || list.size() == 0;
    }

    public static boolean isNullOrEmpty(Map map) {
        return map == null || map.size() == 0;
    }

    public static boolean isNotEmpty(Object[] objects) {
        return objects != null && objects.length > 0;
    }

    public static boolean isNullOrEmpty(Object[] objects) {
        return objects == null || objects.length == 0;
    }

    /**
     * 将list按指定大小分片
     */
    public static <T> List<List<T>> splitList(List<T> list, int size) {

        int listSize = list.size();
        int page = (listSize + (size - 1)) / size;

        List<List<T>> listArray = new ArrayList<List<T>>();
        for (int i = 0; i < page; i++) {
            List<T> subList = new ArrayList<T>();
            for (int j = 0; j < listSize; j++) {
                int pageIndex = ((j + 1) + (size - 1)) / size;
                if (pageIndex == (i + 1)) {
                    subList.add(list.get(j));
                }

                if ((j + 1) == ((j + 1) * size)) {
                    break;
                }
                listArray.add(subList);
            }
        }
        return listArray;
    }
}
