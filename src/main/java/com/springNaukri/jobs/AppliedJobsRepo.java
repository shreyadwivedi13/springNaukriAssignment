package com.springNaukri.jobs;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


public interface AppliedJobsRepo extends CrudRepository<AppliedJobs, Long>{
	
	
	//to display all the candidates that have applied for a particular job.
	@Query(value = "Select candidate from AppliedJobs candidate where candidate.jobid = :keyword")		
	public List<AppliedJobs> displayCandidates(@Param("keyword") long keyword);

	
}
