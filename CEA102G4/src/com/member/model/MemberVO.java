package com.member.model;

import java.sql.*;

public class MemberVO implements java.io.Serializable{
	
	private Integer memId;
	private String memMail;
	private String memPass;
	private String memName;
	private Integer memSex;
	private Date memBirth;
	private String memNick;
	private String memPhone;
	private String memAddress;
	private byte[] memPic;
	private String memText;
	private Timestamp memTime;
	private Integer traBal;	
	private Integer memReport;
	private Integer memStatus;
	
	private String allPic;
	
	
	
	public String getAllPic() {
		
		String table = "member_list";
		String picColumn = "mem_pic";
		String idColumn = "mem_id";
			
		allPic = "AllPic.do?table="+ table +"&picColumn=" + picColumn + "&idColumn="+idColumn+"&id="+ this.memId;						
	
		return allPic;
	}
	public void setAllPic(String allPic) {		
		this.allPic = allPic;
	}
	
	
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Integer getMemSex() {
		return memSex;
	}
	public void setMemSex(Integer memSex) {
		this.memSex = memSex;
	}
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public byte[] getMemPic() {
		return memPic;
	}
	public void setMemPic(byte[] memPic) {
				
		this.memPic = memPic;
	}
	public String getMemText() {
		return memText;
	}
	public void setMemText(String memText) {
		this.memText = memText;
	}
	public Timestamp getMemTime() {
		return memTime;
	}
	public void setMemTime(Timestamp memTime) {
		this.memTime = memTime;
	}
	public Integer getTraBal() {
		return traBal;
	}
	public void setTraBal(Integer traBal) {
		this.traBal = traBal;
	}
	public Integer getMemReport() {
		return memReport;
	}
	public void setMemReport(Integer memReport) {
		this.memReport = memReport;
	}
	public Integer getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(Integer memStatus) {
		this.memStatus = memStatus;
	}
	

	
	
	
}
