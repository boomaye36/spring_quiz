package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;
@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realestateBO;
	
	@RequestMapping("/1")
	public RealEstate quiz01_1(
			@RequestParam("id")int id) {
		return realestateBO.getRealEstateById(id);
	}
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
			@RequestParam("rentprice")int rentprice) {
		return realestateBO.getRealEstateByRentPrice(rentprice);
	}
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
			@RequestParam("area")int area, @RequestParam("price")int price){ 
		 
		return realestateBO.getRealEstateByArea(area, price);
	}
}
