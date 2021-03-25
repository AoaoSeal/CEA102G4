package com.artsave.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class ArtSaveVO implements Serializable{
	private Integer artNo;
	private Integer memId;
	private Timestamp artSaveTime;
	
	public ArtSaveVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArtSaveVO(Integer artNo, Integer memId, Timestamp artSaveTime) {
		super();
		this.artNo = artNo;
		this.memId = memId;
		this.artSaveTime = artSaveTime;
	}
	public Integer getArtNo() {
		return artNo;
	}
	public void setArtNo(Integer artNo) {
		this.artNo = artNo;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Timestamp getArtSaveTime() {
		return artSaveTime;
	}
	public void setArtSaveTime(Timestamp artSaveTime) {
		this.artSaveTime = artSaveTime;
	}
	

}
