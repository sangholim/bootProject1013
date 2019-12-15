package com.pro1.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import com.pro1.common.vo.CommonDataSource;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableConfigurationProperties
@PropertySource(value = { "classpath:static/conf/hibernate.properties" }, ignoreResourceNotFound = true)
@ConfigurationProperties(prefix = "hibernate")
public class HibernateDataSourceConfig extends CommonDataSource {

    private String dialect;

    private boolean show_sql;

    private boolean format_sql;

    private boolean use_sql_comments;

    private boolean id_new_generator_mappings;

    private String hbm2ddl_auto;

    public String getDialect() {
        return dialect;
    }

    public void setDialect(String dialect) {
        this.dialect = dialect;
    }

    public boolean isShow_sql() {
        return show_sql;
    }

    public void setShow_sql(boolean show_sql) {
        this.show_sql = show_sql;
    }

    public boolean isFormat_sql() {
        return format_sql;
    }

    public void setFormat_sql(boolean format_sql) {
        this.format_sql = format_sql;
    }

    public boolean isUse_sql_comments() {
        return use_sql_comments;
    }

    public void setUse_sql_comments(boolean use_sql_comments) {
        this.use_sql_comments = use_sql_comments;
    }

    public boolean isId_new_generator_mappings() {
        return id_new_generator_mappings;
    }

    public void setId_new_generator_mappings(boolean id_new_generator_mappings) {
        this.id_new_generator_mappings = id_new_generator_mappings;
    }

    public String getHbm2ddl_auto() {
        return hbm2ddl_auto;
    }

    public void setHbm2ddl_auto(String hbm2ddl_auto) {
        this.hbm2ddl_auto = hbm2ddl_auto;
    }

    @Override
    public void setEachHikariDS(HikariDataSource hikariDataSource, GenericApplicationContext applicationContext) {
        // hikariDataSource.addDataSourceProperty(propertyName, value);
        hikariDataSource.addDataSourceProperty("hibernate.dialect", dialect);
        hikariDataSource.addDataSourceProperty("hibernate.show_sql", show_sql);
        hikariDataSource.addDataSourceProperty("hibernate.format_sql", format_sql);
        hikariDataSource.addDataSourceProperty("hibernate.use_sql_comments", use_sql_comments);
        hikariDataSource.addDataSourceProperty("hibernate.id.new_generator_mappings", id_new_generator_mappings);
        hikariDataSource.addDataSourceProperty("hibernate.hbm2ddl.auto", hbm2ddl_auto);
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        try {
            sessionFactory.setDataSource(hikariDataSource);
            sessionFactory.setPackagesToScan("com.pro1");
            sessionFactory.afterPropertiesSet();
        } catch (Exception e) {
            e.printStackTrace();
        }
        applicationContext.registerBean(LocalSessionFactoryBean.class, () -> sessionFactory);

        // transactionManager bean 등록
        HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory.getObject());
        transactionManager.setGlobalRollbackOnParticipationFailure(false);
        applicationContext.registerBean(PlatformTransactionManager.class, () -> transactionManager);

    }

}
