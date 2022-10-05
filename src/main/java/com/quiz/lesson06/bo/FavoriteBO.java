package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	@Autowired
	private FavoriteDAO favoritedao;
	public void addAddress(String name, String address) {
		favoritedao.insertAddress(name, address);
	}
	public List<Favorite> favoriteInfo() {
		return favoritedao.selectFavoriteInfo();
	}
}
