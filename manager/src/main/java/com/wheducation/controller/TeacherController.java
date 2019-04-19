package com.wheducation.controller;

import com.wheducation.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description:增删改查代码实现
 * @author: zhangyoujun
 * @date: 2019-04-18 16:28
 */
@RequestMapping(value ="/teacher.do")
@Controller
public class TeacherController {

    @Autowired
    TeacherService teacherService;


}
