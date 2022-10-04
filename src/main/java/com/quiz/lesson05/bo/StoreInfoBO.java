package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.StoreInfoDAO;
import com.quiz.lesson05.model.Store;

@Service
public class StoreInfoBO {
	@Autowired
	private StoreInfoDAO storeDAO;
	public List<Store> getStore(){
		return storeDAO.selectStore();
	}
}
