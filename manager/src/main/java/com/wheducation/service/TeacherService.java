package com.wheducation.service;

import com.wheducation.bean.Teacher;

/**
 * @description:老师表处理
 * @author: zhangyoujun
 * @date: 2019-04-18 15:32
 */
public interface TeacherService {
    /**
     * 增加老师
     * @param teacher 老师所有信息
     * @return
     */
    int addTeacher(Teacher teacher);

    /**
     * 删除老师信息
     * @param id
     * @return
     */
    int deleteTeacher(Integer id);

    /**
     * 修改老师信息
     * @param newteacher 老师的新信息
     * @return
     */
    int updateTeacher(Integer id,Teacher newteacher);


    /**
     * 查询显示所有老师信息
     * @param id
     * @return
     */
    Teacher selectAllTeacher(Integer id);

    /**
     * 根据条件模糊查询显示老师信息
     * @param like 输入的查询条件
     * @return
     */
    Teacher selectLikeTeacher(String like);
}
