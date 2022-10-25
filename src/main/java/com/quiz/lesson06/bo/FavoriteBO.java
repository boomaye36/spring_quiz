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
	public Favorite existFavoriteByAddress(String address) {
		List<Favorite>favoriteList = favoritedao.existFavoriteByAddress(address);
		if (favoriteList.isEmpty()) {
			return null; // 중복 아니면 null 리턴
		}
		return favoriteList.get(0); //중복이면 첫번째 데이터를 리턴한다.
	}
	public int deleteFavorite(int id) {
		return favoritedao.deleteFavorite(id);
	}
}
