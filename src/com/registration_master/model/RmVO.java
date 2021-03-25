package com.registration_master.model;

import java.io.Serializable;
import java.sql.Date;

import com.itinerary.model.ItService;
import com.leader.model.LdService;

public class RmVO implements Serializable{
	
	
	private Integer rmNo;
	private Integer memId;
	private Integer itNo;
	private Integer peoCount;
	private Date rmDate;
	private Integer rmStatus;
	private Integer ldScore;
	private String fbText;
	private String[] attName; 
	private String[] attPhone;
	private String[] attBirth;
	private String[] emerName;
	private String[] emerPhone;

	
	
	public RmVO() {		
	}
	
	public Integer getRmNo() {
		return rmNo;
	}
	public void setRmNo(Integer rmNo) {
		this.rmNo = rmNo;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getItNo() {
		return itNo;
	}
	public void setItNo(Integer itNo) {
		this.itNo = itNo;
	}
	public Integer getPeoCount() {
		return peoCount;
	}
	public void setPeoCount(Integer peoCount) {
		this.peoCount = peoCount;
	}
	public Date getRmDate() {
		return rmDate;
	}
	public void setRmDate(Date rmDate) {
		this.rmDate = rmDate;
	}
	public Integer getRmStatus() {
		return rmStatus;
	}
	public void setRmStatus(Integer rmStatus) {
		this.rmStatus = rmStatus;
	}
	public Integer getLdScore() {
		return ldScore;
	}
	public void setLdScore(Integer ldScore) {
		this.ldScore = ldScore;
	}

	public String getFbText() {
		return fbText;
	}

	public void setFbText(String fbText) {
		this.fbText = fbText;
	}

	public String[] getAttName() {
		return attName;
	}

	public void setAttName(String[] attName) {
		this.attName = attName;
	}

	public String[] getAttPhone() {
		return attPhone;
	}

	public void setAttPhone(String[] attPhone) {
		this.attPhone = attPhone;
	}

	public String[] getAttBirth() {
		return attBirth;
	}

	public void setAttBirth(String[] attBirth) {
		this.attBirth = attBirth;
	}

	public String[] getEmerName() {
		return emerName;
	}

	public void setEmerName(String[] emerName) {
		this.emerName = emerName;
	}

	public String[] getEmerPhone() {
		return emerPhone;
	}

	public void setEmerPhone(String[] emerPhone) {
		this.emerPhone = emerPhone;
	}

	public Integer getItPrice() {
		return new ItService().getItPrice(itNo);
	}
	
	public String getItName() {
		return new ItService().getItName(itNo);
	}
}
