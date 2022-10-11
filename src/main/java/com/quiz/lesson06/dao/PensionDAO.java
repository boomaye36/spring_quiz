package com.quiz.lesson06.dao;

import java.util.List;

import com.quiz.lesson06.model.Pension;

public interface PensionDAO {
	public List<Pension> selectPensionInfo();
	public int deletePension(int id);
	public void insertPension(String name, String date, int day, int headcount, String phoneNumber);
}
