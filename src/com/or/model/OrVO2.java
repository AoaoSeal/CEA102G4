package com.or.model;

import java.sql.Timestamp;

public class OrVO2 {
	Integer seller;
	Integer or_no;
	Integer buyer;
	String  or_name;
	Integer or_price;
	String  or_phone;
	String  or_address;
	Timestamp    or_time;
	Integer or_status;
	Integer gd_no;
	public Integer getSeller() {
		return seller;
	}
	public void setSeller(Integer seller) {
		this.seller = seller;
	}
	public Integer getOr_no() {
		return or_no;
	}
	public void setOr_no(Integer or_no) {
		this.or_no = or_no;
	}
	public Integer getBuyer() {
		return buyer;
	}
	public void setBuyer(Integer buyer) {
		this.buyer = buyer;
	}
	public String getOr_name() {
		return or_name;
	}
	public void setOr_name(String or_name) {
		this.or_name = or_name;
	}
	public Integer getOr_price() {
		return or_price;
	}
	public void setOr_price(Integer or_price) {
		this.or_price = or_price;
	}
	public String getOr_phone() {
		return or_phone;
	}
	public void setOr_phone(String or_phone) {
		this.or_phone = or_phone;
	}
	public String getOr_address() {
		return or_address;
	}
	public void setOr_address(String or_address) {
		this.or_address = or_address;
	}
	public Timestamp getOr_time() {
		return or_time;
	}
	public void setOr_time(Timestamp or_time) {
		this.or_time = or_time;
	}
	public Integer getOr_status() {
		return or_status;
	}
	public void setOr_status(Integer or_status) {
		this.or_status = or_status;
	}
	public Integer getGd_no() {
		return gd_no;
	}
	public void setGd_no(Integer gd_no) {
		this.gd_no = gd_no;
	}
	
}
