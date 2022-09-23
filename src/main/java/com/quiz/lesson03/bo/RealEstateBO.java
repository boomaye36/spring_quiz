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
	public int addRealEstate(RealEstate realestate) {
		return realestateDAO.insertRealEstate(realestate);
	}
	//realEstateBO.addRealEstateAsfield(realtorId, "썅떼빌리버 오피스텔 814호", 45, 월세, 100000, 120)
	public int addRealEstateAsfield(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realestateDAO.insertRealEstateAsfield(realtorId, address, area, type, price, rentPrice);
	}
	public int updateRealEstateById(int id, String type, int price) {
		return realestateDAO.updateRealEstateById(id, type, price);
	}
}
