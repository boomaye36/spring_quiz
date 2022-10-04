package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Store;

@Repository
public interface StoreInfoDAO {
	public List<Store> selectStore();
}
