package com.leader.model;

import java.io.Serializable;

public class LdVO implements Serializable{
	
	private Integer ldNo;
	private String ldName;
	private byte[] ldPic;
	private String ldExpr;
	private Integer ldStatus;
	private Integer ldScore;
	private Integer ldPeople;
	private String ldMail;
	private String ldPass;
	
	
	public LdVO() {
		
	}

	public Integer getLdNo() {
		return ldNo;
	}

	public void setLdNo(Integer ldNo) {
		this.ldNo = ldNo;
	}

	public String getLdName() {
		return ldName;
	}

	public void setLdName(String ldName) {
		this.ldName = ldName;
	}

	public byte[] getLdPic() {
		return ldPic;
	}

	public void setLdPic(byte[] ldPic) {
		this.ldPic = ldPic;
	}

	public String getLdExpr() {
		return ldExpr;
	}

	public void setLdExpr(String ldExpr) {
		this.ldExpr = ldExpr;
	}

	public Integer getLdStatus() {
		return ldStatus;
	}

	public void setLdStatus(Integer ldStatus) {
		this.ldStatus = ldStatus;
	}

	public Integer getLdScore() {
		return ldScore;
	}

	public void setLdScore(Integer ldScore) {
		this.ldScore = ldScore;
	}

	public Integer getLdPeople() {
		return ldPeople;
	}

	public void setLdPeople(Integer ldPeople) {
		this.ldPeople = ldPeople;
	}

	public String getLdMail() {
		return ldMail;
	}

	public void setLdMail(String ldMail) {
		this.ldMail = ldMail;
	}

	public String getLdPass() {
		return ldPass;
	}

	public void setLdPass(String ldPass) {
		this.ldPass = ldPass;
	}


	

}
