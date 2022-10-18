 package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.quiz.lesson06.dao.PensionDAO;
import com.quiz.lesson06.model.Pension;

@Service
public class PensionBO {
	@Autowired
	private PensionDAO pensionDAO;
	public List<Pension> pensionInfo(){
		return pensionDAO.selectPensionInfo();
	}
	
	public int deletePension(int id) {
		return pensionDAO.deletePension(id);
	}
	public int addPension(String name, String date, int day, int headcount, String phoneNumber ) {
		return pensionDAO.insertPension(name, date, day, headcount, phoneNumber);
	}
	public Pension getLatestBooking(String name, String phoneNumber) {
		List<Pension> bookingList = pensionDAO.selectBookingListByNamePhoneNumber(name, phoneNumber); // [], 채워져 있거나 3
		if (CollectionUtils.isEmpty(bookingList)) {
			return null;
		}
		return bookingList.get(bookingList.size() - 1); // 마지막 인덱스 데이터 가져옴
	}
}
