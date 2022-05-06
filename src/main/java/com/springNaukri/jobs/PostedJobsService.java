package com.springNaukri.jobs;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class PostedJobsService {

	@Autowired
	PostedJobsRepo repo;

	//saves the record
	@Transactional
	public void save(PostedJobs jobs) {

		repo.save(jobs);
	}
	
	//gets the list of the project
	@Transactional
	public List<PostedJobs> listAll() {
		return (List<PostedJobs>) repo.findAll();
	}
	
	//deletes the object
	@Transactional
	public void delete(Long id) {
		repo.deleteById(id);
	}


}
