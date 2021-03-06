package com.springNaukri.jobs;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class PostedJobsService {

	@Autowired
	PostedJobsRepo repo;

	public void save(PostedJobs jobs) {

		repo.save(jobs);
	}
	
	
	public List<PostedJobs> listAll() {
		return (List<PostedJobs>) repo.findAll();
	}
	
	
	public void delete(Long id) {
		repo.deleteById(id);
	}

	public void updateJob(Long jobid, String position, String companyName, String description) {
		// TODO Auto-generated method stub
		repo.updatePost(jobid,position,companyName,description);
	}

	public List<PostedJobs> doneByEmployer(String username ) {
		return (List<PostedJobs>) repo.getpostedjobs(username);
	}
	public List<PostedJobs> unappliedJobs(String username) {
		return (List<PostedJobs>) repo.unappliedJobs(username);
	}

}
