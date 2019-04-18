package com.wheducation.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wheducation.bean.AJAXResult;
import com.wheducation.bean.User;
import com.wheducation.service.UserService;
import com.wheducation.util.MD5Util;


@Controller
public class DispatcherController {

	@Autowired
	UserService userService;
	/**
	 * 项目启动跳转到项目登录首页
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	/**
	 * 处理登录请求
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/dologin")
	public Object dologin(User user){
		AJAXResult result = new AJAXResult();
		System.out.println(MD5Util.digest("111111"));
		user.setUser_password(MD5Util.digest(user.getUser_password()));
		User dbUser = userService.queryUser4login(user);
		if(dbUser != null){
			result.setSuccess(true);
			result.setData(dbUser);
		}else{
			result.setSuccess(false);
		}
		return result;
	}
	/**
	 * 登录成功后，跳转后台主页面
	 * @return
	 */
	@RequestMapping("/main")
	public String main(){
		return "main";
	}
}




































