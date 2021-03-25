package com.goods.model;

import java.sql.Timestamp;

public class GoodsVO {
	private Integer gd_no;
	private Integer gc_no;
	private Integer mem_id;
	private String  gd_name;
	private Integer gd_price;
	private Timestamp gd_date;
	private Integer gd_qty;
	private String  gd_text;
	private String  gd_mediumblob;
	private Integer gd_status;
	private Integer gd_shelf;
	public Integer getGd_no() {
		return gd_no;
	}
	public void setGd_no(Integer gd_no) {
		this.gd_no = gd_no;
	}
	public Integer getGc_no() {
		return gc_no;
	}
	public void setGc_no(Integer gc_no) {
		this.gc_no = gc_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public String getGd_name() {
		return gd_name;
	}
	public void setGd_name(String gd_name) {
		this.gd_name = gd_name;
	}
	public Integer getGd_price() {
		return gd_price;
	}
	public void setGd_price(Integer gd_price) {
		this.gd_price = gd_price;
	}
	public Timestamp getGd_date() {
		return gd_date;
	}
	public void setGd_date(Timestamp gd_date) {
		this.gd_date = gd_date;
	}
	public Integer getGd_qty() {
		return gd_qty;
	}
	public void setGd_qty(Integer gd_qty) {
		this.gd_qty = gd_qty;
	}
	public String getGd_text() {
		return gd_text;
	}
	public void setGd_text(String gd_text) {
		this.gd_text = gd_text;
	}
	public String getGd_mediumblob() {
		return gd_mediumblob;
	}
	public void setGd_mediumblob(String gd_mediumblob) {
		this.gd_mediumblob = gd_mediumblob;
	}
	public Integer getGd_status() {
		return gd_status;
	}
	public void setGd_status(Integer gd_status) {
		this.gd_status = gd_status;
	}
	public Integer getGd_shelf() {
		return gd_shelf;
	}
	public void setGd_shelf(Integer gd_shelf) {
		this.gd_shelf = gd_shelf;
	}
	
	
}
