package com.test.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/index.do")
	public String index() {
		
		//JSP 호출하기(X) > Tiles Definition 호출하기(O)
		return "index";
	}
	
	@GetMapping("/test.do")
	public String test() {
		
		return "test";
	}
	
}











