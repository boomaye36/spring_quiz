package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;
@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstateById(int id);
	public List<RealEstate> selectRealEstateByRentPrice(int rentprice);
	
	// @Param은 하나의 Map을 만들어준다
	// @Parma은 repository DAO에서만 사용
	public List<RealEstate> selectRealEstateByArea(
			@Param("area") int area, //entity
			@Param("price") int price);
			
			
			
}
