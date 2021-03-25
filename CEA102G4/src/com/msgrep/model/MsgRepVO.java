package com.msgrep.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MsgRepVO implements Serializable{
	
	private Integer mesRepNO;
	private Integer artMsgNo;
	private Integer memId;
	private String msgRepText;
	private Timestamp msgRepTime;
	private Integer msgRepStatus;	
	public MsgRepVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MsgRepVO(Integer mesRepNO, Integer artMsgNo, Integer memId, String msgRepText, Timestamp msgRepTime,
			Integer msgRepStatus) {
		super();
		this.mesRepNO = mesRepNO;
		this.artMsgNo = artMsgNo;
		this.memId = memId;
		this.msgRepText = msgRepText;
		this.msgRepTime = msgRepTime;
		this.msgRepStatus = msgRepStatus;
	}
	public Integer getMesRepNO() {
		return mesRepNO;
	}
	public void setMesRepNO(Integer mesRepNO) {
		this.mesRepNO = mesRepNO;
	}
	public Integer getArtMsgNo() {
		return artMsgNo;
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
	public String getMsgRepText() {
		return msgRepText;
	}
	public void setMsgRepText(String msgRepText) {
		this.msgRepText = msgRepText;
	}
	public Timestamp getMsgRepTime() {
		return msgRepTime;
	}
	public void setMsgRepTime(Timestamp msgRepTime) {
		this.msgRepTime = msgRepTime;
	}
	public Integer getMsgRepStatus() {
		return msgRepStatus;
	}
	public void setMsgRepStatus(Integer msgRepStatus) {
		this.msgRepStatus = msgRepStatus;
	}
	
	
}
