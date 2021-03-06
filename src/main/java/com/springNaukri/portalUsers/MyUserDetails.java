package com.springNaukri.portalUsers;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class MyUserDetails implements UserDetails {

	private PortalUser portalUser;
	
	public MyUserDetails(PortalUser portalUser) {
		this.portalUser = portalUser;
	}
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(portalUser.getRole());
        return Arrays.asList(authority);
	}

	@Override
	public String getPassword() {
		return portalUser.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return portalUser.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
