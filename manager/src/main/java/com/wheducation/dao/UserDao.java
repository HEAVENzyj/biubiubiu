package com.wheducation.dao;


import java.util.List;
import java.util.Map;

import com.wheducation.bean.User;

public interface UserDao {

	User queryUser4login(User user);

	List<User> queryPageData(Map<String, Object> paramMap);

	int queryUserCount(Map<String, Object> paramMap);

	int insertUser(User user);

	int deleteUserById(Integer id);

	User queryUserById(Integer id);

	int updateUser(User user);



}
