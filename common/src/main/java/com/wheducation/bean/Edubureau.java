package com.wheducation.bean;

import java.io.Serializable;
import java.util.Date;

public class Edubureau implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String eb_name;
	private String eb_address;
	private Date eb_createtime;
	public Date getEb_createtime() {
		return eb_createtime;
	}
	public void setEb_createtime(Date eb_createtime) {
		this.eb_createtime = eb_createtime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEb_name() {
		return eb_name;
	}
	public void setEb_name(String eb_name) {
		this.eb_name = eb_name;
	}
	public String getEb_address() {
		return eb_address;
	}
	public void setEb_address(String eb_address) {
		this.eb_address = eb_address;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Edubureau [id=" + id + ", eb_name=" + eb_name + ", eb_address=" + eb_address + ", eb_createtime="
				+ eb_createtime + "]";
	}

}
