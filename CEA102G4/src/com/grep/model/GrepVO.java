package com.grep.model;

import java.sql.Date;

public class GrepVO {
	private Integer grep_no;
	private Integer mem_id;
	private Integer gd_no;
	private Date    grep_time;
	private Integer grep_status;
	private String  grep_text;
	public Integer getGrep_no() {
		return grep_no;
	}
	public void setGrep_no(Integer grep_no) {
		this.grep_no = grep_no;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public Integer getGd_no() {
		return gd_no;
	}
	public void setGd_no(Integer gd_no) {
		this.gd_no = gd_no;
	}
	public Date getGrep_time() {
		return grep_time;
	}
	public void setGrep_time(Date grep_time) {
		this.grep_time = grep_time;
	}
	public Integer getGrep_status() {
		return grep_status;
	}
	public void setGrep_status(Integer grep_status) {
		this.grep_status = grep_status;
	}
	public String getGrep_text() {
		return grep_text;
	}
	public void setGrep_text(String grep_text) {
		this.grep_text = grep_text;
	}
	
}
