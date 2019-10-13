package com.pro1.common.vo;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.support.GenericApplicationContext;
import com.zaxxer.hikari.HikariDataSource;

public class CommonDataSource {

    protected String driver;

    protected String url;

    protected String username;

    protected String password;

    public void setDriver(String driver) {
	this.driver = driver;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public void setUsername(String username) {
	this.username = username;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public HikariDataSource getCommonHikariDS() {
	HikariDataSource ds = DataSourceBuilder.create().type(HikariDataSource.class).build();
	ds.setUsername(username);
	ds.setPassword(password);
	ds.setDriverClassName(driver);
	ds.setJdbcUrl(url);
	return ds;
    }

    public HikariDataSource getCommonHikariDS(String jdbcOpt) {
	HikariDataSource ds = DataSourceBuilder.create().type(HikariDataSource.class).build();
	ds.setUsername(username);
	ds.setPassword(password);
	ds.setDriverClassName(driver);
	ds.setJdbcUrl(url + jdbcOpt);
	return ds;
    }

    // 각각 구현
    public void setEachHikariDS(HikariDataSource hikariDataSource, GenericApplicationContext applicationContext) {

    }

}
