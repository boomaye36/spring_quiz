package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.lesson06.model.Pension;

public interface PensionDAO {
	public List<Pension> selectPensionInfo();
	public int deletePension(int id);
	public int insertPension(
			@Param("name")String name,
			@Param("date")String date,
			@Param("day")int day, 
			@Param("headcount")int headcount,
			@Param("phoneNumber")String phoneNumber);
	
	public List<Pension>  selectBookingListByNamePhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
}
