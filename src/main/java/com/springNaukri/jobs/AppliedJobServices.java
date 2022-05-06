package com.springNaukri.jobs;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AppliedJobServices implements AppliedJobsServicesImpl {
	
	@Autowired
	AppliedJobsRepo repo;
	
	public void save(AppliedJobs appliedjobs) {
		
		repo.save(appliedjobs);
	}

}
