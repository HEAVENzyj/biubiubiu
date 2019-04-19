package com.wheducation.service.impl;

import com.wheducation.bean.Teacher;
import com.wheducation.dao.TeacherDao;
import com.wheducation.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @author: zhangyoujun
 * @date: 2019-04-18 16:04
 */
@Service
public class TeacherServiceImpl implements TeacherService {
/*
    @Autowired
    TeacherDao teacherDao;*/

    @Override
    public int addTeacher(Teacher teacher) {
        return 0;
    }

    public int deleteTeacher(Integer id) {
        return 0;
    }

    public int updateTeacher(Integer id, Teacher newteacher) {
        return 0;
    }

    public Teacher selectAllTeacher(Integer id) {
        return null;
    }

    public Teacher selectLikeTeacher(String like) {
        return null;
    }
}
