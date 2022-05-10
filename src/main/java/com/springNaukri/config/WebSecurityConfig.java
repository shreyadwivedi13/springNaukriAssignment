package com.springNaukri.config;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.dao.*;
import org.springframework.security.config.annotation.authentication.builders.*;
import org.springframework.security.config.annotation.web.builders.*;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.WebApplicationInitializer;

import com.springNaukri.portalUsers.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	private static Logger log = Logger.getLogger(WebSecurityConfig.class.getName());


	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	}

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		try {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userDetailsService());
		authProvider.setPasswordEncoder(passwordEncoder());
		log.info("DaoAuthenticationProvider works fine");

		return authProvider;
	}
		catch (Exception e) {
			log.info("check DaoAuthenticationProvider ");
		}
		return null;}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		try {
		http.authorizeRequests()
				.antMatchers("/applyJob").hasAuthority("candidate")
				.antMatchers("/candidateList").hasAuthority("Employer")
				.antMatchers("/jobList").authenticated()
				.antMatchers("/postedJobs").hasAuthority("Employer")
				.antMatchers("/postJob").hasAuthority("Employer")
				.and().formLogin().loginPage("/login-form").loginProcessingUrl("/process-login").permitAll()
				.defaultSuccessUrl("/welcome").and().logout().permitAll();
		log.info("authorizeRequests workfine");
	}
		catch (Exception e) {
			log.error("check authorizeRequests");

		}}


	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/static/**");
	}
}
