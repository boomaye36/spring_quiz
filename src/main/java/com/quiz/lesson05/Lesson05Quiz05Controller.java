package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("lesson05/quiz05")
@Controller
public class Lesson05Quiz05Controller {
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	@GetMapping("weather_history_view")
	public String weatherHistoryView() {
		return "lesson05/weatherInfo";
	}
	@PostMapping("/weather_history_info")
	public String weatherHistoryInfo(Model model) {
		
		List<WeatherHistory> weatherHistory = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("result", weatherHistory);
		return "lesson05/weatherInfo";
	}
}
