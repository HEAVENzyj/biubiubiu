package com.wheducation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wheducation.bean.AJAXResult;
import com.wheducation.bean.Page;
import com.wheducation.bean.User;
import com.wheducation.service.UserService;
import com.wheducation.util.MD5Util;
import com.wheducation.util.StringUtil;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/editUser")
	public String editUser(Integer id,Model model){
		User user = userService.queryUserById(id);
		model.addAttribute("user", user);
		return "user/editUser";
	}
	
	@ResponseBody
	@RequestMapping("/updateUser")
	public Object updateUser(User user){
		AJAXResult result = new AJAXResult();
		System.out.println(user);
		try {
			int count = userService.updateUser(user);
			if(count == 1){
				result.setSuccess(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

	/**
	 * 根据ID删除用户信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteUserById")
	public Object deleteUserById(Integer id){
		AJAXResult result = new AJAXResult();
		int count = userService.deleteUserById(id);
		if(count == 1){
			result.setSuccess(true);
		}else{
			result.setSuccess(false);
		}
		return result;
	}
	
	/**
	 * 跳转到用户新增页面
	 * @return
	 */
	@RequestMapping("/addUser")
	public String addUser(){
		return "user/addUser";
	}
	
	@ResponseBody
	@RequestMapping("/insertUser")
	public Object insertUser(User user){
		AJAXResult result = new AJAXResult();
		
		user.setUser_password(MD5Util.digest("111111"));
		user.setUser_createtime(new Date());
		
		int count = userService.insertUser(user);
		if(count == 1){
			result.setSuccess(true);
		}else{
			result.setSuccess(false);
		}
		return result;
	}
	
	
	
	/**
	 * 跳转到用户管理首页
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}

	/**
	 * 分页查询用户信息
	 * 模糊查询用户信息
	 * @param pageno
	 * @param pagesize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPageData")
	public Object queryPageData(String queryText, Integer pageno, Integer pagesize) {
		
		AJAXResult result = new AJAXResult();
		
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("start", (pageno - 1) * pagesize);
			paramMap.put("size", pagesize);
			
			if(StringUtil.isNotEmpty(queryText)){
				if ( queryText.indexOf("\\") != -1 ) {
					queryText = queryText.replaceAll("\\\\", "\\\\\\\\");
				}
				if ( queryText.indexOf("%") != -1 ) {
					queryText = queryText.replaceAll("%", "\\\\%");
				}
				if ( queryText.indexOf("_") != -1 ) {
					queryText = queryText.replaceAll("_", "\\\\_");
				}
				paramMap.put("queryText", queryText);
			}
			
			Page<User> userPage = new Page<User>();
			userPage.setPageno(pageno);
			userPage.setPagesize(pagesize);
			
			List<User> users = userService.queryPageData(paramMap);
			int count = userService.queryUserCount(paramMap);
			
			if(count % pagesize == 0){
				userPage.setTotalsize(count/pagesize);
			}else{
				userPage.setTotalsize(count/pagesize + 1);
			}
			userPage.setData(users);
			result.setData(userPage);
			result.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
		}
		return result;
	}

}


















































