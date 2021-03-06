package com.springNaukri.portalUsers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PortalUserController {

	@Autowired
	private PortalUserService portalUserService;
	@Autowired
	private PortalUserRepository portalUserRepository;
	
	//will take you to the login page
	@RequestMapping(value = "/login-form", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		return "login-form";

	}
	
	//will take you to the common welcome dashboard
	@RequestMapping(value = "/welcome")
	public String welcome(Authentication auth, Model model) {
		
		auth=SecurityContextHolder.getContext().getAuthentication();
		String username= auth.getName();
		PortalUser portalUser = portalUserRepository.getUserByUsername(username);
		model.addAttribute(portalUser);
		return "welcome";

	}
	
	//opens the registration page
	@RequestMapping("/")
	public String newRegistration(Map<String, Object> model) {
		PortalUser portalUser = new PortalUser();
		model.put("portalUser", portalUser);
		return "registration";
	}
	
	//will same the registration info and redirect to loginpage
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String savePortalUser(@ModelAttribute("portalUser") PortalUser portalUser) {

		portalUserService.save(portalUser);
		return "redirect:/login-form";
	}
	

}
