package com.artrep.model;
import java.io.Serializable;
import java.sql.Timestamp;

public class ArtRepVO implements Serializable{
	
	private Integer artRepNo;
	private Integer memId;
	private Integer artNo;
	private String artRepNoText;
	private Timestamp artRepTime;
	private Integer artRepStatus;
	
	public ArtRepVO(Integer artRepNo, Integer memId, Integer artNo, String artRepNoText, Timestamp artRepTime,
			Integer artRepStatus) {
		super();
		this.artRepNo = artRepNo;
		this.memId = memId;
		this.artNo = artNo;
		this.artRepNoText = artRepNoText;
		this.artRepTime = artRepTime;
		this.artRepStatus = artRepStatus;
	}
	public Integer getArtRepNo() {
		return artRepNo;
	}
	public void setArtRepNo(Integer artRepNo) {
		this.artRepNo = artRepNo;
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
	public String getArtRepNoText() {
		return artRepNoText;
	}
	public void setArtRepNoText(String artRepNoText) {
		this.artRepNoText = artRepNoText;
	}
	public Timestamp getArtRepTime() {
		return artRepTime;
	}
	public void setArtRepTime(Timestamp artRepTime) {
		this.artRepTime = artRepTime;
	}
	public Integer getArtRepStatus() {
		return artRepStatus;
	}
	public void setArtRepStatus(Integer artRepStatus) {
		this.artRepStatus = artRepStatus;
	}
	public ArtRepVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
