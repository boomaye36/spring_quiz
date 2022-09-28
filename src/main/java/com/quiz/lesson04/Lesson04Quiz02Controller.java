package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson02/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	@Autowired
	private RealtorBO realtorBO;
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model
			) {
		//insert
		realtorBO.addRealtor(realtor);
		//select by id
		realtor = realtorBO.getRealtor(realtor.getId());
		//model 넣고
		model.addAttribute("realtor", realtor);
		//jsp
		return "lesson04/afterAddRealtor";
	}
}
