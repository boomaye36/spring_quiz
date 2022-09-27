package com.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.model.Seller;

@Service
public interface SellerDAO {

	@Autowired

	public void insertSeller(
		@Param("nickname") String nickname,
		@Param("profileImageUrl") String profileImageUrl,
		@Param("temperature") double temperature 
		);

	public Seller selectSellerInfo();
	
}
