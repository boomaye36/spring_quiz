package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.bo.PensionBO;
import com.quiz.lesson06.model.Favorite;
import com.quiz.lesson06.model.Pension;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Quiz01Controller {

	@RequestMapping("/add_address_view")
	public String addAddressView() {

		return "/quiz01/addAddress";
	}

	@Autowired
	private FavoriteBO favoritebo;

	@ResponseBody
	// AJAX가 호출하는 API =? @ResponseBody 있어야함
	@PostMapping("/quiz01/add_address")
	public String addAddress(@RequestParam("name") String name, @RequestParam("address") String address) {
		favoritebo.addAddress(name, address);
		return "success";
	}

	@RequestMapping("/quiz01/get_address_view")
	public String getAddressView(Model model) {
		List<Favorite> favorite = favoritebo.favoriteInfo();

		model.addAttribute("result", favorite);
		return "lesson06/getAddress";
	}

	// quiz 02
	// AJAX 호출하는 API => @ResponseBody
	@ResponseBody
	@PostMapping("/quiz02/is_duplication_address")
	public Map<String, Boolean> isDuplication(@RequestParam("address") String address) {
		Map<String, Boolean> result = new HashMap<>();
		Favorite favorite = favoritebo.existFavoriteByAddress(address);
		if (favorite == null) {
			result.put("isDuplication", false);
		} else {
			result.put("isDuplication", true);
		}
		return result; // json String
	}

	// AJAX가 호출 -> ResponseBody
	@ResponseBody
	@DeleteMapping("/delete_favorite")
	public Map<String, Object> deleteFavorite(@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();

		int deleteRow = favoritebo.deleteFavorite(id);
		if (deleteRow > 0) {
			result.put("code", 100); // 100이면 성공 => 서버가 지정
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 500이면 실패 => 서버가 지정
			result.put("errorMessage", "삭제 실패");
		}
		return result;

	}

	@Autowired
	private PensionBO pensionBO;

	@RequestMapping("/quiz03/get_pension_view")
	public String getPensionView(Model model) {

		List<Pension> pension = pensionBO.pensionInfo();
		model.addAttribute("log", pension);
		return "lesson06/getLogPension";
	}

	@ResponseBody
	@DeleteMapping("/delete_pension")
	public Map<String, Object> deletePension(@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		int deleteRow = pensionBO.deletePension(id);
		if (deleteRow > 0) {
			result.put("code", 100);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "삭제 실패입니당 ㅠ");
		}
		return result;
	}

	@PostMapping("/add_pension")
		public Map<String, Object> addPension(
				@RequestParam("name") String name,
				@RequestParam("date") String date,
				@RequestParam("day") int day,
				@RequestParam("headcount") int headcount,
				@RequestParam("phoneNumber") String phoneNumber
				) {
		int addCount = pensionBO.addPension(name, date, day, headcount, phoneNumber);	
		Map<String, Object> result = new HashMap<>();
			if(addCount > 0) {
				result.put("code", 100);
				result.put("result", "성공");
			}else {
				result.put("code", 500);
				result.put("errorMessage", "데이터를 입력하는데 실패했습니다.");
			}
			return result;
		
		}

	@RequestMapping("/quiz03/add_pension_view")
	public String addPensionView() {
		return "lesson06/bookPension";
	}
	
	@RequestMapping("/quiz03/confirm_pension_view")
	public String confirmPensionView() {
		return "lesson06/bookView";
	}
	@ResponseBody
	@PostMapping("/search_booking")
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			){
		Pension pension = pensionBO.getLatestBooking(name, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		if(pension != null) {
			result.put("code", 100);
			result.put("booking", pension);
		}else {
			result.put("code", 400);
		}
		return result;
	}


}
