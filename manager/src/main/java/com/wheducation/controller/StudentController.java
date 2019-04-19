package com.wheducation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student")
@Controller
public class StudentController {

	@RequestMapping("/index")
	public String index(){
		return "student/index";
	}
}
