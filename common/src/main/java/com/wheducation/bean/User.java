package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String user_account;
	private String user_password;
	private String user_name;
	private int sch_id;
	private Date user_createtime;
	
	
	public int getSch_id() {
		return sch_id;
	}
	public void setSch_id(int sch_id) {
		this.sch_id = sch_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getUser_createtime() {
		return user_createtime;
	}
	public void setUser_createtime(Date user_createtime) {
		this.user_createtime = user_createtime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", user_account=" + user_account + ", user_password=" + user_password + ", user_name="
				+ user_name + ", sch_id=" + sch_id + ", user_createtime=" + user_createtime + "]";
	}
	
	

}
