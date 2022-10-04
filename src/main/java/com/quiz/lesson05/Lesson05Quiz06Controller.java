package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.StoreInfoBO;
import com.quiz.lesson05.model.Store;

@RequestMapping("lesson05/quiz06")
@Controller
public class Lesson05Quiz06Controller {
	@Autowired
	private StoreInfoBO storeBO;
	@GetMapping("store_view")
	public String storeView() {
		return "lesson05/storeInfo";
	}
	@PostMapping("/store_info")
	public String storeInfo(Model model) {
		List<Store> store = storeBO.getStore();
		model.addAttribute("result", store);
		return "lesson05/storeInfo";
	}
}
