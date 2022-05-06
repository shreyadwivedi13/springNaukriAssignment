package com.springNaukri.jobs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class JobController {

	@Autowired
	private PostedJobsService postedJobsService;

	@Autowired
	private PostedJobsRepo postedJobsRepository;

	@Autowired
	private AppliedJobServices appliedJobsService;

	@Autowired
	private AppliedJobsRepo appliedJobsRepository;

	@GetMapping("/postJob")
	public String showEmployerPanel(Map<String, Object> model, @RequestParam String username) {

		model.put("username", username);
		
		PostedJobs postedJobs = new PostedJobs();
		model.put("postedJobs", postedJobs);

		return "postJob";

	}

	@RequestMapping(value = "/process-jobposting", method = RequestMethod.POST)
	public String saveCandidate(@ModelAttribute("postedJobs") PostedJobs postedJobs,
			RedirectAttributes redirectAttributes) {

		redirectAttributes.addAttribute("username", postedJobs.getEmployerUsername());
		

		postedJobsService.save(postedJobs);

		return "redirect:/postJob";
	}

	@GetMapping("/jobList")
	public ModelAndView showjoblist(@RequestParam String username) {

		List<PostedJobs> listJobs = postedJobsService.listAll();
		ModelAndView mav = new ModelAndView("jobList");
		mav.addObject("listJobs", listJobs);
		mav.addObject("username", username);
		return mav;

	}

	@GetMapping("/applyJob")
	public String applyJob(Map<String, Object> model, @RequestParam String username,
			@RequestParam Long id, @RequestParam String position) {

		model.put("username", username);
		model.put("id", id);
		model.put("position", position);

		AppliedJobs appliedJobs = new AppliedJobs();
		model.put("appliedJobs", appliedJobs);

		return "applyJob";

	}

	@RequestMapping(value = "/process-jobapplication", method = RequestMethod.POST)
	public String applyJob(@ModelAttribute("appliedJobs") AppliedJobs appliedJobs,
			RedirectAttributes redirectAttributes) {

		appliedJobsService.save(appliedJobs);

		redirectAttributes.addAttribute("username", appliedJobs.getCandidateUsername());

		return "redirect:/jobList";
	}

	@RequestMapping(value = "/candidateList")
	public String jobViews(Map<String, Object> model, @RequestParam String companyName, @RequestParam String username,
		 @RequestParam int id) {

		model.put("companyName", companyName);
		model.put("username", username);
		

		List<AppliedJobs> authors = appliedJobsRepository.displayCandidates(id);

		model.put("values", authors);

		return "candidateList";
	}

	@RequestMapping(value = "/postedJobs")
	public String postedJobs(Map<String, Object> model, @RequestParam String username) {

		model.put("username", username);
		

		List<PostedJobs> postedJobs = postedJobsRepository.getpostedjobs(username);
		System.out.println(postedJobs);

		model.put("postedJobs", postedJobs);

		return "postedJobs";
	}

	@RequestMapping(value = "/deleteJob")
	public String deleteJob(Map<String, Object> model, @RequestParam String username,
			@RequestParam Long id, RedirectAttributes redirectAttributes) {

		postedJobsService.delete(id);

		redirectAttributes.addAttribute("username", username);


		return "postedJobs";
	}

}
