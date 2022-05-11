package com.springNaukri.jobs;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AppliedJobServices  {
	
	@Autowired
	AppliedJobsRepo repo;

	public void save(AppliedJobs appliedjobs) {
		repo.save(appliedjobs);
	}
	//method to fetch candidates of a particular job posting 
		public List<AppliedJobs> showCandidates(Long jobid) {
			
			return (List<AppliedJobs>) repo.displayCandidates(jobid);
		}

//		public void deleteApplication(Long jobid) {
//			repo.deleteApplication(jobid);
//			
//		}

		public void unapply(Long id) {
			repo.deleteById(id);
		}
//		
//		public List<PostedJobs> appliedByMe(String username) {
//			
//			return (List<PostedJobs>) repo.appliedByMe(username);
//		}


}
