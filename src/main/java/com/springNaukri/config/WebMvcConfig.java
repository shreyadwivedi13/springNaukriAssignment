package com.springNaukri.config;

import org.apache.log4j.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
//scans packages with com.naukri to enable webMVC to them
@ComponentScan("com.springNaukri")
@EnableWebMvc
public class WebMvcConfig implements WebMvcConfigurer {
	
	private static Logger log = Logger.getLogger(WebMvcConfig.class.getName());

	//configurations for the view part of the project
	@Bean(name ="viewResolver")
	public InternalResourceViewResolver getViewResolver() {
		try {
		InternalResourceViewResolver viewResolver= new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		log.info("viewResolver success!");
		return viewResolver;
	}
	catch(Exception e){
		log.error("viewResolver failed");
		return null;
	}}
	
	//bean for password encryption
	@Bean
	PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
	}
	
	//additional resources to be added in the project
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");
	}
	

}
