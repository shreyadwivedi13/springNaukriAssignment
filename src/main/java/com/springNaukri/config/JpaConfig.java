package com.springNaukri.config;

import javax.persistence.EntityManagerFactory;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableJpaRepositories(basePackages = {"com.springNaukri.*"})
@EnableTransactionManagement
public class JpaConfig {
	
	private static Logger log = Logger.getLogger(JpaConfig.class.getName());

    @Bean
    public LocalEntityManagerFactoryBean entityManagerFactory() {
    	try {
        LocalEntityManagerFactoryBean factoryBean = new LocalEntityManagerFactoryBean();
        factoryBean.setPersistenceUnitName("naukri_database");
         log.info("LocalEntityManagerFactoryBean works fine");
        return factoryBean;
    }
    	catch(Exception e) {
            log.error("check LocalEntityManagerFactoryBean");

    	}
    	return null;
    }
    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
        try{
        	JpaTransactionManager transactionManager = new JpaTransactionManager();
        
        transactionManager.setEntityManagerFactory(entityManagerFactory);
        log.info(" JpaTransactionManager works fine");

        return transactionManager;
    }  catch(Exception e) {
        log.error("check JpaTransactionManager");

	}
	return null;
}
}
