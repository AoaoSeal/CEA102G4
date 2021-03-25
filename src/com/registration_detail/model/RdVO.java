package com.registration_detail.model;

import java.io.Serializable;
import java.sql.Date;

public class RdVO implements Serializable{


	private Integer rdNo;
	private Integer rmNo;
	private String attName;
	private String attPhone;
	private String attBirth;
	private String emerName;
	private String emerPhone;
	private Integer itNo;
	
	
	public RdVO() {		
	}
	public Integer getRdNo() {
		return rdNo;
	}
	public void setRdNo(Integer rdNo) {
		this.rdNo = rdNo;
	}
	public Integer getRmNo() {
		return rmNo;
	}
	public void setRmNo(Integer rmNo) {
		this.rmNo = rmNo;
	}
	public String getAttName() {
		return attName;
	}
	public void setAttName(String attName) {
		this.attName = attName;
	}
	public String getAttPhone() {
		return attPhone;
	}
	public void setAttPhone(String attPhone) {
		this.attPhone = attPhone;
	}
	public String getAttBirth() {
		return attBirth;
	}
	public void setAttBirth(String attBirth) {
		this.attBirth = attBirth;
	}
	public String getEmerName() {
		return emerName;
	}
	public void setEmerName(String emerName) {
		this.emerName = emerName;
	}
	public String getEmerPhone() {
		return emerPhone;
	}
	public void setEmerPhone(String emerPhone) {
		this.emerPhone = emerPhone;
	}
	public Integer getItNo() {
		return itNo;
	}
	public void setItNo(Integer itNo) {
		this.itNo = itNo;
	}

 
}
