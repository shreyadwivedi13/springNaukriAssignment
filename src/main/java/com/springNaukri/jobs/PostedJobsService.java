package com.springNaukri.jobs;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class PostedJobsService {

	@Autowired
	PostedJobsRepo repo;

	public void save(PostedJobs jobs) {

		repo.save(jobs);
	}
	
	@Transactional
	public List<PostedJobs> listAll() {
		return (List<PostedJobs>) repo.findAll();
	}
	
	@Transactional
	public void delete(Long id) {
		repo.deleteById(id);
	}


}
