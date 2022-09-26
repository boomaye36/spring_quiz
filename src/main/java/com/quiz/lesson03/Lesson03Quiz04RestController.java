package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz04RestController {
	@Autowired
	private RealEstateBO realestateBO;
	@RequestMapping("/lesson03/quiz04")
	public String quiz04(
			@RequestParam(value = "id") int id) {
		realestateBO.deleteRealEstateById(id);
		int cnt = realestateBO.deleteRealEstateById(id);
		return "delete complete" + cnt;
	}
}
