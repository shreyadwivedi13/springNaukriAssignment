package com.springNaukri.jobs;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface AppliedJobsRepo extends CrudRepository<AppliedJobs, Long> {

	// to display all the candidates that have applied for a particular job.
	@Query(value = "Select candidate from AppliedJobs candidate where candidate.jobid = :keyword")
	public List<AppliedJobs> displayCandidates(@Param("keyword") long keyword);

//	@Query(value="Select jobs from PostedJobs jobs left join AppliedJobs applied on jobs.id=applied.jobid where applied.candidateUsername = :username ")
//	public List<PostedJobs> appliedByMe(String username);

//	// Query to delete job from applied jobs when employer deletes their job post
//	@Modifying
//	@Query("delete posting from AppliedJobs  where posting.jobid= :jobid")
//	void deleteApplication(@Param("posting") Long jobid);

	// Query to revoke application of a candidate from a post
//	@Modifying
//	@Query("delete applied from AppliedJobs  where applied.candidateUsername=:username")
//	void unapply(@Param("username") String username);

}
