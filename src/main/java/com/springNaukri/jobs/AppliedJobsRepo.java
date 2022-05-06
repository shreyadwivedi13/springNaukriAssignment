package com.springNaukri.jobs;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AppliedJobsRepo extends CrudRepository<AppliedJobs, Long>{
	
	//implements the function to get object by id
	@Query(value = "Select candidate from AppliedJobs candidate where candidate.jobid = :keyword")		
	public List<AppliedJobs> displayCandidates(@Param("keyword") long keyword);

}
