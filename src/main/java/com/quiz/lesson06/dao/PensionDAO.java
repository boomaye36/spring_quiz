package com.quiz.lesson06.dao;

import java.util.List;

import com.quiz.lesson06.model.Pension;

public interface PensionDAO {
	public List<Pension> selectPensionInfo();
}
