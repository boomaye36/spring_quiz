package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	@Autowired
	private RealEstateDAO realestateDAO;
	public RealEstate getRealEstateById(int id) {
		return realestateDAO.selectRealEstateById(id);
	}
	
	public List<RealEstate> getRealEstateByRentPrice(int rentprice) {
		return realestateDAO.selectRealEstateByRentPrice(rentprice);
	}
	public List<RealEstate> getRealEstateByArea(int area, int price) {
		return realestateDAO.selectRealEstateByArea(area, price);
	}
}
