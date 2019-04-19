package com.wheducation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/school")
@Controller
public class SchoolController {
	
	@RequestMapping("/index")
	public String index(){
		return "school/index";
	}

}
