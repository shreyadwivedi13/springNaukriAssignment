package com.springNaukri.jobs;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostedJobsRepo extends CrudRepository<PostedJobs, Long>{

	@Query("SELECT u FROM PostedJobs u WHERE u.employerUsername = :username")
    public List<PostedJobs> getpostedjobs(@Param("username") String username);


}
