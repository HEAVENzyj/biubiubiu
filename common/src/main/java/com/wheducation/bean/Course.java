package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class Course implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String cou_name;
	private int sch_id;
	private Date cou_createtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCou_name() {
		return cou_name;
	}
	public void setCou_name(String cou_name) {
		this.cou_name = cou_name;
	}
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public Date getCou_createtime() {
		return cou_createtime;
	}
	public void setCou_createtime(Date cou_createtime) {
		this.cou_createtime = cou_createtime;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", cou_name=" + cou_name + ", sch_id=" + sch_id + ", cou_createtime="
				+ cou_createtime + "]";
	}
	
	
}
