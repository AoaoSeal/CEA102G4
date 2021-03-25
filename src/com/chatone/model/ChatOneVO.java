package com.chatone.model;

import java.sql.Timestamp;

public class ChatOneVO implements java.io.Serializable{
	
	private Integer chatNo;
	private Integer aMemid;
	private Integer bMemid;
	private String chatPath;
	private String chatText;
	private Timestamp chatTime;
	
	public Integer getChatNo() {
		return chatNo;
	}
	public void setChatNo(Integer chatNo) {
		this.chatNo = chatNo;
	}
	public Integer getaMemid() {
		return aMemid;
	}
	public void setaMemid(Integer aMemid) {
		this.aMemid = aMemid;
	}
	public Integer getbMemid() {
		return bMemid;
	}
	public void setbMemid(Integer bMemid) {
		this.bMemid = bMemid;
	}
	public String getChatPath() {
		return chatPath;
	}
	public void setChatPath(String chatPath) {
		this.chatPath = chatPath;
	}
	public String getChatText() {
		return chatText;
	}
	public void setChatText(String chatText) {
		this.chatText = chatText;
	}
	public Timestamp getChatTime() {
		return chatTime;
	}
	public void setChatTime(Timestamp chatTime) {
		this.chatTime = chatTime;
	}
}
