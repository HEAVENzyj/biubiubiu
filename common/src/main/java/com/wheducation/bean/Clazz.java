package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class Clazz implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String cla_name;
	private int sch_id;
	private Date cla_createtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCla_name() {
		return cla_name;
	}
	public void setCla_name(String cla_name) {
		this.cla_name = cla_name;
	}
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public Date getCla_createtime() {
		return cla_createtime;
	}
	public void setCla_createtime(Date cla_createtime) {
		this.cla_createtime = cla_createtime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Class [id=" + id + ", cla_name=" + cla_name + ", sch_id=" + sch_id + ", cla_createtime="
				+ cla_createtime + "]";
	}

	
}
