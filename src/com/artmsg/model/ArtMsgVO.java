package com.artmsg.model;

import java.sql.Timestamp;

public class ArtMsgVO {
	Integer artMsgNo;
	Integer memId;
	Integer artNo;
	String artMsgText;
	Timestamp artMsgTime;
	Timestamp artMsgLastmo;
	String memName; 
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Integer getArtMsgNo() {
		return artMsgNo;
	}
	public ArtMsgVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArtMsgVO(Integer artMsgNo, Integer memId, Integer artNo, String artMsgText, Timestamp artMsgTime,
			Timestamp artMsgLastmo) {
		super();
		this.artMsgNo = artMsgNo;
		this.memId = memId;
		this.artNo = artNo;
		this.artMsgText = artMsgText;
		this.artMsgTime = artMsgTime;
		this.artMsgLastmo = artMsgLastmo;
	}
	public void setArtMsgNo(Integer artMsgNo) {
		this.artMsgNo = artMsgNo;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getArtNo() {
		return artNo;
	}
	public void setArtNo(Integer artNo) {
		this.artNo = artNo;
	}
	public String getArtMsgText() {
		return artMsgText;
	}
	public void setArtMsgText(String artMsgText) {
		this.artMsgText = artMsgText;
	}
	public Timestamp getArtMsgTime() {
		return artMsgTime;
	}
	public void setArtMsgTime(Timestamp artMsgTime) {
		this.artMsgTime = artMsgTime;
	}
	public Timestamp getArtMsgLastmo() {
		return artMsgLastmo;
	}
	public void setArtMsgLastmo(Timestamp artMsgLastmo) {
		this.artMsgLastmo = artMsgLastmo;
	}

}