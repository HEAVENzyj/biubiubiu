package com.wheducation.bean;

import java.util.List;

public class Page<T> {

	/**
	 * 当前页码
	 */
	private int pageno;
	/**
	 * 显示条数
	 */
	private int pagesize;
	/**
	 * 总页码
	 */
	private int totalno;
	/**
	 * 总的数据条数
	 */
	private int totalsize;
	/**
	 * 页面数据
	 */
	private List<T> data;
	public int getPageno() {
		return pageno;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotalno() {
		return totalno;
	}
	public void setTotalno(int totalno) {
		this.totalno = totalno;
	}
	public int getTotalsize() {
		return totalsize;
	}
	public void setTotalsize(int totalsize) {
		this.totalsize = totalsize;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
}
