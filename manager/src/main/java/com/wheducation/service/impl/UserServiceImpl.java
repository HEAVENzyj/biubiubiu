package com.wheducation.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wheducation.bean.User;
import com.wheducation.dao.UserDao;
import com.wheducation.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	public User queryUser4login(User user) {
		return userDao.queryUser4login(user);
	}

	public List<User> queryPageData(Map<String, Object> paramMap) {
		return userDao.queryPageData(paramMap);
	}

	public int queryUserCount(Map<String, Object> paramMap) {
		return userDao.queryUserCount(paramMap);
	}

	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	public int deleteUserById(Integer id) {
		return userDao.deleteUserById(id);
	}

	public User queryUserById(Integer id) {
		return userDao.queryUserById(id);
	}

	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

}
