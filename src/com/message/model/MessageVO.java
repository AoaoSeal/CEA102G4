package com.message.model;

import java.sql.Timestamp;

public class MessageVO implements java.io.Serializable{
private Integer messageNo;
private Integer memId;
private Integer messageC;
private String messageContain;
private Timestamp messageTime;

public Integer getMessageNo() {
	return messageNo;
}
public void setMessageNo(Integer messageNo) {
	this.messageNo = messageNo;
}
public Integer getMemId() {
	return memId;
}
public void setMemId(Integer memId) {
	this.memId = memId;
}
public Integer getMessageC() {
	return messageC;
}
public void setMessageC(Integer messageC) {
	this.messageC = messageC;
}
public String getMessageContain() {
	return messageContain;
}
public void setMessageContain(String messageContain) {
	this.messageContain = messageContain;
}
public Timestamp getMessageTime() {
	return messageTime;
}
public void setMessageTime(Timestamp messageTime) {
	this.messageTime = messageTime;
}

}
