package com.springNaukri.jobs;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JobController {

	private static Logger log = Logger.getLogger(JobController.class.getName());

	@Autowired
	private PostedJobsService postedJobsService;

	@Autowired
	private PostedJobsRepo postedJobsRepository;

	@Autowired
	private AppliedJobServices appliedJobsService;

	@Autowired
	private AppliedJobsRepo appliedJobsRepository;

	// displays the portal with post job feature.
	@GetMapping("/postJob")
	public String showEmployerPanel(Map<String, Object> model, @RequestParam String username) {

		model.put("username", username);

		PostedJobs postedJobs = new PostedJobs();
		model.put("postedJobs", postedJobs);

		return "postJob";

	}

	//process that will save job posting to the databse
	@RequestMapping(value = "/process-jobposting", method = RequestMethod.POST)
	public String saveCandidate(@ModelAttribute("postedJobs") PostedJobs postedJobs,
			RedirectAttributes redirectAttributes) {

		redirectAttributes.addAttribute("username", postedJobs.getEmployerUsername());

		postedJobsService.save(postedJobs);

		return "redirect:/postJob";
	}

	// displays the portal with all jobs.
	@GetMapping("/jobList")
	public ModelAndView showjoblist(@RequestParam String username) {

		List<PostedJobs> listJobs = postedJobsService.unappliedJobs(username);
		ModelAndView mav = new ModelAndView("jobList");
		mav.addObject("listJobs", listJobs);
		mav.addObject("username", username);
		return mav;

	}

	// displays the portal with apply job feature.
	@GetMapping("/applyJob")
	public String applyJob(Map<String, Object> model, @RequestParam String username, @RequestParam Long id,
			@RequestParam String companyName) {

		model.put("username", username);
		model.put("id", id);
		model.put("companyName", companyName);
		// model.put("position", position);

		AppliedJobs appliedJobs = new AppliedJobs();
		model.put("appliedJobs", appliedJobs);
		return "applyJob";

	}

	//will redirect the succesjobApply url to job apply page.
	@RequestMapping(value = "/process-jobApply")
	public String ap(@RequestParam String username, @RequestParam Long id,
			@RequestParam String companyName){

		AppliedJobs appliedJobs= new AppliedJobs();
		appliedJobs.setCandidateUsername(username);
		appliedJobs.setJobid(id);
		appliedJobsService.save(appliedJobs);
		//redirectAttributes.addAttribute("username", appliedJobs.getCandidateUsername());
		return "applyJobSuccess";}

	//shows all the applicants
	@RequestMapping(value = "/candidateList")
	public String jobViews(Map<String, Object> model, @RequestParam String username, @RequestParam int id) {
		model.put("username", username);
		model.put("id", id);

		List<AppliedJobs> candidtes = appliedJobsRepository.displayCandidates(id);

		model.put("values", candidtes);

		return "candidateList";
	}

	//shows all the jobs posted by a particular employer
	@RequestMapping(value = "/postedJobs")
	public String postedJobs(Map<String, Object> model, @RequestParam String username) {

		model.put("username", username);

		List<PostedJobs> postedJobs = postedJobsRepository.getpostedjobs(username);
		// System.out.println(postedJobs);

		model.put("postedJobs", postedJobs);

		return "postedJobs";
	}

//	@RequestMapping(value = "/appliedByMe")
//	public String appliedJobs(Map<String, Object> model, @RequestParam String username) {
//
//		model.put("username", username);
//
//		List<PostedJobs> applied = appliedJobsRepository.appliedByMe(username);
//		//System.out.println(postedJobs);
//
//		model.put("applied", applied);
//
//		return "appliedByMe";
//	}
	
	
	// deletes job entry.
	@RequestMapping(value = "/deleteJob")
	public String deleteJob(Map<String, Object> model, @RequestParam String username, @RequestParam Long id,
			RedirectAttributes redirectAttributes) {

		postedJobsService.delete(id);

		redirectAttributes.addAttribute("username", username);

		return "postedJobs";
	}

	@RequestMapping(value = "/unapplyJob")
	public String unapplyJob(Map<String, Object> model, @RequestParam String username, @RequestParam Long id,
			RedirectAttributes redirectAttributes) {

		appliedJobsService.unapply(id);

		redirectAttributes.addAttribute("username", username);

		return "postedJobs";
	}

	// updates the job posts
	@GetMapping("/updateJobInfo")
	public String updateJobPosting(@RequestParam Long id, @RequestParam String position,
			@RequestParam String companyName, @RequestParam String description, @RequestParam String username,
			Model model) {

		try {
			PostedJobs updateJob = new PostedJobs();

			updateJob.setId(id);
			updateJob.setCompanyName(companyName);
			updateJob.setPosition(position);
			updateJob.setDescription(description);

			model.addAttribute(updateJob);

			model.addAttribute(username);

			return "updateJobInfo";
		} catch (Exception e) {
			log.error("Error with loading update job");
		}

		return null;

	}

	//updates job posting
	@RequestMapping(value = "/processPostUpdate", method = RequestMethod.POST)
	public String updateTheJob(@ModelAttribute("postedJobs") PostedJobs postedJobs) {

		try {

			Long jobid = postedJobs.getId();
			String position = postedJobs.getPosition();
			String companyName = postedJobs.getCompanyName();
			String description = postedJobs.getDescription();

			// updates in the database
			postedJobsService.updateJob(jobid, position, companyName, description);

			return "redirect:/welcome";
		} catch (Exception e) {
			log.error("Error with processing job update");
		}
		return null;
	}

}
