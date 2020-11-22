package com.renfeng.util;

import com.renfeng.config.RedisConfig;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;

/**
 * 创建redisson客户端
 *
 * @author yanxiaodong
 * @date 2017-5-5
 */
public class RedissonClientUtils {

    public static RedissonClient getRedissonClient() {
        RedisConfig redisConfig = new RedisConfig();
        Config redissonConfig = new Config();
        redissonConfig.useSingleServer().setAddress(redisConfig.getHost() + ":" + redisConfig.getPort()).setPassword(redisConfig.getPassword());
        return Redisson.create(redissonConfig);
    }
}
