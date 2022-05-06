package com.springNaukri.portalUsers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PortalUserService {
	@Autowired
	PortalUserRepository repo;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public void save(PortalUser portalUser) {

		String encodedPassword = passwordEncoder.encode(portalUser.getPassword());
		// System.out.println(encodedPassword);

		portalUser.setPassword(encodedPassword);

		repo.save(portalUser);
	}

	public List<PortalUser> listAll() {
		return (List<PortalUser>) repo.findAll();
	}

	public PortalUser get(Long id) {
		return repo.findById(id).get();
	}

	public void delete(Long id) {
		repo.deleteById(id);
	}

	public List<PortalUser> search(String keyword) {
		return repo.search(keyword);
	}

}
