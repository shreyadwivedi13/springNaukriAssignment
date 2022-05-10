package com.springNaukri.jobs;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name = "applied_jobs",schema="project_db")// table name= applied jobs
public class AppliedJobs {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long user_id;
	private Long jobid;
	private String candidateUsername;
	
	public AppliedJobs() {
	}


	public AppliedJobs(Long user_id, Long jobid, String candidateUsername) {
		this.user_id = user_id;
		this.jobid = jobid;
		this.candidateUsername = candidateUsername;
		
	}

	// setter and getters
	public Long getId() {
		return user_id;
	}

	public void setId(Long user_id) {
		this.user_id = user_id;
	}

	public Long getJobid() {
		return jobid;
	}

	public void setJobid(Long jobid) {
		this.jobid = jobid;
	}

	public String getCandidateUsername() {
		return candidateUsername;
	}

	public void setCandidateUsername(String candidateUsername) {
		this.candidateUsername = candidateUsername;
	}

	
}
