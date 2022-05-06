package com.springNaukri.portalUsers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private PortalUserRepository PortalUserRepository;
     
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
    	PortalUser portalUser = PortalUserRepository.getUserByUsername(username);
         
        if (portalUser == null) {
            throw new UsernameNotFoundException("Could not find user");
        }
         
        return new MyUserDetails(portalUser);
    }
}
