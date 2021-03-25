package com.srep.model;

import java.sql.Date;

public class SrepVO {
	private Integer srep_no;
	private Integer mem_id;
	private Integer or_no;
	private Date    srep_time;
	private Integer srep_status;
	private String  srep_text;
	private String  srep_mediumblob;
	public Integer getSrep_no() {
		return srep_no;
	}
	public void setSrep_no(Integer srep_no) {
		this.srep_no = srep_no;
	}
	public Integer getOr_no() {
		return or_no;
	}
	public void setOr_no(Integer or_no) {
		this.or_no = or_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Date getSrep_time() {
		return srep_time;
	}
	public void setSrep_time(Date srep_time) {
		this.srep_time = srep_time;
	}
	public String getSrep_text() {
		return srep_text;
	}
	public void setSrep_text(String srep_text) {
		this.srep_text = srep_text;
	}
	public Integer getSrep_status() {
		return srep_status;
	}
	public void setSrep_status(Integer srep_status) {
		this.srep_status = srep_status;
	}
	public String getSrep_mediumblob() {
		return srep_mediumblob;
	}
	public void setSrep_mediumblob(String srep_mediumblob) {
		this.srep_mediumblob = srep_mediumblob;
	}
	
	
}
