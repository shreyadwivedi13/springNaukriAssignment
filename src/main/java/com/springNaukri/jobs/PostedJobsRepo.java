package com.springNaukri.jobs;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostedJobsRepo extends CrudRepository<PostedJobs, Long> {

	//all posting by a particular employer
	@Query("SELECT u FROM PostedJobs u WHERE u.employerUsername = :username")
	public List<PostedJobs> getpostedjobs(@Param("username") String username);

	//update job post
	@Modifying(clearAutomatically = true)
	@Query("update PostedJobs job set job.position=:position, job.companyName=:companyName, job.description=:description where job.id=:jobid")
	void updatePost(@Param("jobid") Long jobid, @Param("position") String position,
		@Param("companyName") String companyName, @Param("description") String description);

	//all job posting
	@Query("Select jobs from PostedJobs jobs left join AppliedJobs appliedjob on jobs.id = appliedjob.jobid where appliedjob.candidateUsername = :username")
	public List<PostedJobs> getjobapplication(@Param("username") String username);

	//unapplied job postings
	@Query("select jobs from PostedJobs jobs where jobs.id not in (select appliedjob.user_id from AppliedJobs appliedjob where appliedjob.candidateUsername = :username)")
	public List<PostedJobs> unappliedJobs(@Param("username") String username);
}
