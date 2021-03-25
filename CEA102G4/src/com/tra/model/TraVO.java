package com.tra.model;

import java.sql.Timestamp;

public class TraVO {
	Integer tra_no;
	Integer mem_id;
	Integer tra_action;
	Integer tra_price;
	Integer tra_status;
	Timestamp tra_time;
	public Integer getTra_no() {
		return tra_no;
	}
	public void setTra_no(Integer tra_no) {
		this.tra_no = tra_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getTra_action() {
		return tra_action;
	}
	public void setTra_action(Integer tra_action) {
		this.tra_action = tra_action;
	}
	public Integer getTra_price() {
		return tra_price;
	}
	public void setTra_price(Integer tra_price) {
		this.tra_price = tra_price;
	}
	public Integer getTra_status() {
		return tra_status;
	}
	public void setTra_status(Integer tra_status) {
		this.tra_status = tra_status;
	}
	public Timestamp getTra_time() {
		return tra_time;
	}
	public void setTra_time(Timestamp tra_time) {
		this.tra_time = tra_time;
	}
	
}
