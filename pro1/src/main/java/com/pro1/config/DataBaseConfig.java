package com.pro1.config;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.core.annotation.Order;

import com.pro1.board.dao.UserCafeBoardDAO;
import com.pro1.board.service.UserCafeBoardService;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.service.CafeManager;
import com.pro1.common.vo.CommonDataSource;
import com.pro1.config.comp._Config;
import com.pro1.config.comp.database._Database;
import com.zaxxer.hikari.HikariDataSource;

/**
 * DataBaseSource 선택하여 bean 등록 로직
 * 
 * @author HoYa
 */
@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class,
	DataSourceTransactionManagerAutoConfiguration.class })
@Configuration
@Order(2)
// @EnableTransactionManagement
public class DataBaseConfig {

    @Autowired
    private ConfigManagement configManagement;

    private GenericApplicationContext applicationContext;

    private final String MYBATIS_TYPE = "mybatis";

    private final String Hibernate_TYPE = "hibernate";

    private final String Timezone_Prefix = "serverTimezone=";

    @PostConstruct
    public void dataBaseSetting() {

	_Config config = configManagement.getConfigData();
	_Database database = config.getDatabase();
	String dbType = database.getSelect();
	// setting DataSource bean 등록
	HikariDataSource hikariDataSource;
	CommonDataSource dataBase = null;
	if (dbType.equals(MYBATIS_TYPE)) {
	    dataBase = applicationContext.getBean(MyBatisDataSourceConfig.class);
	} else if (dbType.contentEquals(Hibernate_TYPE)) {
	    dataBase = applicationContext.getBean(HibernateDataSourceConfig.class);
	}
	String add_jdbc_opt = '&' + Timezone_Prefix + config.getTimezone();
	hikariDataSource = dataBase.getCommonHikariDS(add_jdbc_opt);
	applicationContext.registerBean(DataSource.class, () -> hikariDataSource);
	// sqlsession , transactionmanger 부분 각각 구성
	dataBase.setEachHikariDS(hikariDataSource, applicationContext);

	// database 호출하는 bean들 다등록
	// Cafe create bean
	applicationContext.registerBean("com.pro1.cafe.dao.CafeDAO", CafeDAO.class, () -> new CafeDAO());
	applicationContext.registerBean("com.pro1.cafe.service.CafeManager", CafeManager.class,
		() -> new CafeManager());
	// UserCafeBoards createBean

	applicationContext.registerBean("com.pro1.board.dao.UserCafeBoardDAO", UserCafeBoardDAO.class,
		() -> new UserCafeBoardDAO());
	applicationContext.registerBean("com.pro1.board.service.UserCafeBoardService", UserCafeBoardService.class,
		() -> new UserCafeBoardService());

    }

    public DataBaseConfig(GenericApplicationContext applicationContext) {
	this.applicationContext = applicationContext;

    }

}
