package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.PensionDAO;
import com.quiz.lesson06.model.Pension;

@Service
public class PensionBO {
	@Autowired
	private PensionDAO pensionDAO;
	public List<Pension> pensionInfo(){
		return pensionDAO.selectPensionInfo();
	}
}
