package com.renfeng.common;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yanxiadong
 * @date 2019-12-02
 */
@SuppressWarnings({"serial", "rawtypes", "unchecked"})
public class ThreadLocalManager {
    private static ThreadLocalManager manager = new ThreadLocalManager();
    private ThreadLocal<HashMap> threadLocalMap = new ThreadLocal<>();

    private ThreadLocalManager() {
    }

    public static ThreadLocalManager me() {
        return manager;
    }
    public void release() {
        threadLocalMap.remove();
    }

    public void setThreadLocalMap(HashMap map) {
        threadLocalMap.set(map);
    }

    private Map getMap(){
        return threadLocalMap.get();
    }

    public <T> T get(String key) {
        return (T) getMap().get(key);
    }
    public  void put(String key,Object t) {
        getMap().put(key,t);
    }
}
