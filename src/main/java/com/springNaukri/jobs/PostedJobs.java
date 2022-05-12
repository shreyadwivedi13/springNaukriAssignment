package com.springNaukri.jobs;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "postedjobs")
public class PostedJobs {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String employerUsername;
	private String position;
	private String companyName;
	private String description;
	public PostedJobs() {

	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmployerUsername() {
		return employerUsername;
	}

	public void setEmployerUsername(String employerUsername) {
		this.employerUsername = employerUsername;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public PostedJobs(Long id, String employerUsername, String position, String companyName, String description ) {
		this.id = id;
		this.employerUsername = employerUsername;
		this.position = position;
		this.companyName = companyName;
		this.description = description;
	}

}
