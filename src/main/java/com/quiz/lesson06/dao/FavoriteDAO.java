package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quiz.lesson06.model.Favorite;

public interface FavoriteDAO {
	public void insertAddress(
			@Param("name") String name,
			@Param("address") String address
			);
	public List<Favorite> selectFavoriteInfo();
	public List<Favorite> existFavoriteByAddress(String address);
}
