package com.renfeng.config;

import com.zaxxer.hikari.HikariDataSource;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

/**
 * 数据源
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/9/12 15:46
 */
@Data
@Component
@ConfigurationProperties(prefix = "spring.datasource", ignoreInvalidFields = true)
public class DataSourceConfig {

//    @Autowired
//    private Environment env;
//
//    @Bean
//    public DataSource getDataSource() {
//        HikariDataSource dataSource = new HikariDataSource();
//        dataSource.setJdbcUrl(env.getProperty("spring.datasource.url"));
//        dataSource.setUsername(env.getProperty("spring.datasource.username"));
//        dataSource.setPassword(env.getProperty("spring.datasource.password"));
//        return dataSource;
//    }

    private String url;
    private String username;
    private String password;
    private String driverClassName;

    @Bean
    public DataSource getDataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setJdbcUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.addDataSourceProperty("cachePrepStmts", "true");
        dataSource.addDataSourceProperty("prepStmtCacheSize", "500");
        dataSource.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        dataSource.setDriverClassName(driverClassName);
        dataSource.setConnectionInitSql("SET NAMES utf8mb4");
        dataSource.setMaximumPoolSize(100);
        dataSource.setMinimumIdle(0);
        dataSource.setPoolName("HikariDataSourcePool");
        return dataSource;
    }
}
