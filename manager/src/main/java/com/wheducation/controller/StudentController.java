package com.wheducation.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student")
public class StudentController {

	@RequestMapping("/index")
	public String index(){
		return "student/index";
	}
}
