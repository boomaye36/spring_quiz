package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {

	@RequestMapping("/add_address_view")
	public String addAddressView() {
		
		return "lesson06/addAddress";
	}
	@Autowired
	private FavoriteBO favoritebo;
	@ResponseBody
	//AJAX가 호출하는 API =? @ResponseBody 있어야함
	@PostMapping("/add_address")
	public String addAddress(
			@RequestParam("name") String name,
			@RequestParam("address") String address) {
		favoritebo.addAddress(name, address);
		return "success";
	}
	@RequestMapping("/get_address_view")
	public String getAddressView(Model model) {
		List<Favorite> favorite = favoritebo.favoriteInfo();
		
		model.addAttribute("result", favorite);
		return "lesson06/getAddress";
	}
		
		
}
