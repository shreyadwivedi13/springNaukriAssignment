package com.springNaukri.portalUsers;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface PortalUserRepository extends CrudRepository<PortalUser, Long> {

	//for search feature
	@Query(value = "SELECT p FROM PortalUser p WHERE p.name LIKE '%' || :keyword || '%'"
			+ " OR p.email LIKE '%' || :keyword || '%'"
			+ " OR p.username LIKE '%' || :keyword || '%'")
	public List<PortalUser> search(@Param("keyword") String keyword);
	
	//fetches user by its username
	 @Query("SELECT u FROM PortalUser u WHERE u.username = :username")
	    public PortalUser getUserByUsername(@Param("username") String username);
	}

