package com.wheducation.bean;

import org.joda.time.DateTime;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * @description:老师表
 * @author: zhagnyoujun
 * @date: 2019-04-18 14:12
 */
public class Teacher implements Serializable {

    /**
     * 老师id
     */
    private Integer id;
    /**
     * 老师姓名
     */
    private String name;
    /**
     * 老师性别
     */
    private String sex;
    /**
     * 老师地址
     */
    private String address;
    /**
     * 老师生日
     */
    private Date brithday;
    /**
     * 老师联系方式
     */
    private String phone;
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
    private DateTime createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public DateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(DateTime createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Teacher teacher = (Teacher) o;
        return Objects.equals(id, teacher.id) &&
                Objects.equals(name, teacher.name) &&
                Objects.equals(sex, teacher.sex) &&
                Objects.equals(address, teacher.address) &&
                Objects.equals(brithday, teacher.brithday) &&
                Objects.equals(phone, teacher.phone) &&
                Objects.equals(schoolId, teacher.schoolId) &&
                Objects.equals(courseId, teacher.courseId) &&
                Objects.equals(classId, teacher.classId) &&
                Objects.equals(createTime, teacher.createTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, sex, address, brithday, phone, schoolId, courseId, classId, createTime);
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", brithday=" + brithday +
                ", phone='" + phone + '\'' +
                ", schoolId=" + schoolId +
                ", courseId=" + courseId +
                ", classId=" + classId +
                ", createTime=" + createTime +
                '}';
    }

    public Teacher(Integer id, String name, String sex, String address, Date brithday, String phone, Integer schoolId, Integer courseId, Integer classId, DateTime createTime) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.address = address;
        this.brithday = brithday;
        this.phone = phone;
        this.schoolId = schoolId;
        this.courseId = courseId;
        this.classId = classId;
        this.createTime = createTime;
    }

    public Teacher(){

    }
}
