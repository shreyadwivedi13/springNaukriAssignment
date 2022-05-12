package com.springNaukri.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.apache.log4j.Logger;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
//initializes webapp

public class WebAppInitializer implements WebApplicationInitializer {
	private static Logger log = Logger.getLogger(WebApplicationInitializer.class.getName());

	//for app startup
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// TODO Auto-generated method stub
		try {
			AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();

			appContext.register(WebMvcConfig.class);

			ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher",
					new DispatcherServlet((appContext)));
			dispatcher.setLoadOnStartup(1);
			dispatcher.addMapping("/");
			log.info("ServletContext works fine");

		} catch (Exception e) {
			log.error("Error in ServletContext");

		}
	}
}
