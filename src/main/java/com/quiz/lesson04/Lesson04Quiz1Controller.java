package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quiz.lesson04.bo.SellerBO;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz1Controller {

	
	@RequestMapping(path = "/add_seller_view", method = RequestMethod.GET)
	public String addSellerViewer() {
		return "lesson04/addSeller";
	}
	@Autowired
	private SellerBO sellerBO;
}
