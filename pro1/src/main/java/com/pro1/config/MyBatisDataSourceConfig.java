package com.pro1.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import com.pro1.common.vo.CommonDataSource;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "mybatis")
@PropertySource(value = { "classpath:static/conf/mybatis.properties" }, ignoreResourceNotFound = true)
public class MyBatisDataSourceConfig extends CommonDataSource {

    private String config_location;

    private String mapper_location;

    public String getConfig_location() {
        return config_location;
    }

    public void setConfig_location(String config_location) {
        this.config_location = config_location;
    }

    public String getMapper_location() {
        return mapper_location;
    }

    public void setMapper_location(String mapper_location) {
        this.mapper_location = mapper_location;
    }

    @Override
    public void setEachHikariDS(HikariDataSource hikariDataSource, GenericApplicationContext applicationContext) {
        // SqlSession Factory bean 등록
        SqlSessionFactoryBean sessionFactoryBean = new SqlSessionFactoryBean();
        sessionFactoryBean.setDataSource(hikariDataSource);
        sessionFactoryBean.setTypeAliasesPackage("com.pro1");

        try {
            sessionFactoryBean.setMapperLocations(
                    applicationContext.getResources("classpath:/static/mybatis/sql/*.xml"));
            SqlSessionFactory sqlSessionFactory = sessionFactoryBean.getObject();
            applicationContext.registerBean(SqlSessionFactory.class, () -> sqlSessionFactory);
            // SqlSessionTemplate bean 등록
            applicationContext.registerBean(SqlSessionTemplate.class, () -> new SqlSessionTemplate(sqlSessionFactory));

        } catch (Exception e) {

        }
        // transactionManager bean 등록
        DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(hikariDataSource);
        transactionManager.setGlobalRollbackOnParticipationFailure(false);
        applicationContext.registerBean(PlatformTransactionManager.class, () -> transactionManager);

    }

}
