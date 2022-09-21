package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02Controller {

	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1(){
		// @ResponseBody + return String => HttpMessageConverter String => 글자가 response에 담긴다.
		// @ResponseBody + return 객체 => HttpMessageConverter 객체 jackson 라이브러리 => JSON 응답 - API
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object>map = new HashMap<String, Object>() {{ put("rate", 15);put("director", "봉준호");put("time", 131);put("title", "기생충");}};
		
		list.add(map);
		map = new HashMap<String, Object>() {{put("rate", 0);put("director", "로베르토 베니니");put("time", 116);put("title", "인생은 아름다워");}};
		
		list.add(map);
		map = new HashMap<String, Object>() {{put("rate", 12);put("director", "크리스토퍼 놀란");put("time", 147);put("title", "인셉션");}};
	
		list.add(map);
		map = new HashMap<String, Object>() {{put("rate", 19);put("director", "윤종민");put("time", 135);put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");}};
		
		list.add(map);
		map = new HashMap<String, Object>() {{put("rate", 15);put("director", "프란시스 로렌스");put("time", 137);put("title", "헝거게임");}};
		list.add(map);
		return list;
	}
	@RequestMapping("/2")
	public List<Data> quiz02_2() {
		List<Data> list = new ArrayList<>();

		Data data = new Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요 가입했어요 앞으로 잘 부탁드립니다.");
		list.add(data);
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘 목요일이었어 금요일인줄...");
		list.add(data);
		data.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		data.setUser("hagulu");
		data.setContent("....");
		list.add(data);
		return list;
	}
	@RequestMapping("/3")
	public ResponseEntity<Data> quiz02_3(){
		Data data = new Data();
		data.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		data.setUser("hagulu");
		data.setContent("....");
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

