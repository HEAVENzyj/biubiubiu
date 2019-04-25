package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class Role implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id ;
	private String role_name;
	private String role_desc;
	private Date role_createtime;
	
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	
	
	public Date getRole_createtime() {
		return role_createtime;
	}
	public void setRole_createtime(Date role_createtime) {
		this.role_createtime = role_createtime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", role_name=" + role_name + ", role_desc=" + role_desc + ", role_createtime="
				+ role_createtime + "]";
	}
	
	

}
