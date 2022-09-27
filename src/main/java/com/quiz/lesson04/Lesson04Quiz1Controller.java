package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller //viewResolver
public class Lesson04Quiz1Controller {

	@Autowired
	private SellerBO sellerBO;
	
	@RequestMapping(path = "/add_seller_view", method = RequestMethod.GET)
	public String addSellerViewer() {
		return "lesson04/addSeller";
	}
	@PostMapping("/add_seller")
	public String addSeller(
		@RequestParam("nickname") String nickname,
		@RequestParam(value="profileImageUrl", required=false) String profile,
		@RequestParam("temperature") double temperature){
			
		sellerBO.addSeller(nickname, profile, temperature);
			return "lesson04/afterAddSeller";
		}
	@GetMapping("/seller_info")
	public String sellerInfo(Model model) {
		Seller seller = sellerBO.sellerInfo();
		
		model.addAttribute("result", seller);
		model.addAttribute("subject", "판매자 정보");
		return "lesson04/sellerInfo";
		
	}
	
}
