package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class School implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String sch_name;
	private String sch_number;
	private String sch_img;
	private String sch_type;
	private String sch_motto;
	private String sch_address;
	private String sch_desc;
	private int eb_id;
	private Date sch_createtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSch_name() {
		return sch_name;
	}
	public void setSch_name(String sch_name) {
		this.sch_name = sch_name;
	}
	public String getSch_number() {
		return sch_number;
	}
	public void setSch_number(String sch_number) {
		this.sch_number = sch_number;
	}
	public String getSch_img() {
		return sch_img;
	}
	public void setSch_img(String sch_img) {
		this.sch_img = sch_img;
	}
	public String getSch_type() {
		return sch_type;
	}
	public void setSch_type(String sch_type) {
		this.sch_type = sch_type;
	}
	public String getSch_motto() {
		return sch_motto;
	}
	public void setSch_motto(String sch_motto) {
		this.sch_motto = sch_motto;
	}
	public String getSch_address() {
		return sch_address;
	}
	public void setSch_address(String sch_address) {
		this.sch_address = sch_address;
	}
	public String getSch_desc() {
		return sch_desc;
	}
	public void setSch_desc(String sch_desc) {
		this.sch_desc = sch_desc;
	}
	public int getEb_id() {
		return eb_id;
	}
	public void setEb_id(int eb_id) {
		this.eb_id = eb_id;
	}
	public Date getSch_createtime() {
		return sch_createtime;
	}
	public void setSch_createtime(Date sch_createtime) {
		this.sch_createtime = sch_createtime;
	}
	@Override
	public String toString() {
		return "School [id=" + id + ", sch_name=" + sch_name + ", sch_number=" + sch_number + ", sch_img=" + sch_img
				+ ", sch_type=" + sch_type + ", sch_motto=" + sch_motto + ", sch_address=" + sch_address + ", sch_desc="
				+ sch_desc + ", eb_id=" + eb_id + ", sch_createtime=" + sch_createtime + "]";
	}
	
	
}
