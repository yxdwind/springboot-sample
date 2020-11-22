package com.renfeng;

import com.renfeng.config.RedisConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 项目启动类
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/9/10 10:43
 */
@SpringBootApplication(scanBasePackages = {"com.renfeng"}, exclude = {DataSourceAutoConfiguration.class})
@MapperScan("com.renfeng.dao.*")
public class ApplicationStart {
    private static Logger logger = LoggerFactory.getLogger(ApplicationStart.class);

    public static void main(String[] args) {

//        SpringApplication.run(ApplicationStart.class, args);

        SpringApplication application = new SpringApplication(ApplicationStart.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);

        RedisConfig redisConfig = new RedisConfig();
//        logger.warn(redisConfig.getHost());
        logger.warn("Application start finished!!!");
    }
}
