package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * @description:老师表
 * @author: zhagnyoujun
 * @date: 2019-04-18 14:12
 */
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 老师id
     */
    private Integer id;

    /**
     * 老师编号
     */
    private String tea_number;

    /**
     * 老师姓名
     */
    private String tea_name;
    /**
     * 老师性别
     */
    private String tea_sex;
    /**
     * 老师地址
     */
    private String tea_address;
    /**
     * 老师生日
     */
    private Date tea_brithday;
    /**
     * 老师联系方式
     */
    private String tea_phone;
    /**
     * 老师对应的学校id
     */
    private Integer schoolId;
    /**
     * 老师的课程id
     */
    private Integer courseId;
    /**
     * 老师对应的班级id
     */
    private Integer classId;
    /**
     * 该老师的信息的录入时间
     */
    private Date tea_createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTea_number() {
        return tea_number;
    }

    public void setTea_number(String tea_number) {
        this.tea_number = tea_number;
    }

    public String getTea_name() {
        return tea_name;
    }

    public void setTea_name(String tea_name) {
        this.tea_name = tea_name;
    }

    public String getTea_sex() {
        return tea_sex;
    }

    public void setTea_sex(String tea_sex) {
        this.tea_sex = tea_sex;
    }

    public String getTea_address() {
        return tea_address;
    }

    public void setTea_address(String tea_address) {
        this.tea_address = tea_address;
    }

    public Date getTea_brithday() {
        return tea_brithday;
    }

    public void setTea_brithday(Date tea_brithday) {
        this.tea_brithday = tea_brithday;
    }

    public String getTea_phone() {
        return tea_phone;
    }

    public void setTea_phone(String tea_phone) {
        this.tea_phone = tea_phone;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Date getTea_createTime() {
        return tea_createTime;
    }

    public void setTea_createTime(Date tea_createTime) {
        this.tea_createTime = tea_createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Teacher teacher = (Teacher) o;
        return Objects.equals(id, teacher.id) &&
                Objects.equals(tea_number, teacher.tea_number) &&
                Objects.equals(tea_name, teacher.tea_name) &&
                Objects.equals(tea_sex, teacher.tea_sex) &&
                Objects.equals(tea_address, teacher.tea_address) &&
                Objects.equals(tea_brithday, teacher.tea_brithday) &&
                Objects.equals(tea_phone, teacher.tea_phone) &&
                Objects.equals(schoolId, teacher.schoolId) &&
                Objects.equals(courseId, teacher.courseId) &&
                Objects.equals(classId, teacher.classId) &&
                Objects.equals(tea_createTime, teacher.tea_createTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, tea_number, tea_name, tea_sex, tea_address, tea_brithday, tea_phone, schoolId, courseId, classId, tea_createTime);
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", tea_number='" + tea_number + '\'' +
                ", tea_name='" + tea_name + '\'' +
                ", tea_sex='" + tea_sex + '\'' +
                ", tea_address='" + tea_address + '\'' +
                ", tea_brithday=" + tea_brithday +
                ", tea_phone='" + tea_phone + '\'' +
                ", schoolId=" + schoolId +
                ", courseId=" + courseId +
                ", classId=" + classId +
                ", tea_createTime=" + tea_createTime +
                '}';
    }



    public Teacher(){

    }
}
