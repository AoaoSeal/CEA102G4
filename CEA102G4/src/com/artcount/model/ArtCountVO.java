package com.artcount.model;

import java.io.Serializable;

public class ArtCountVO implements Serializable{
	private Integer artNo;
	private Integer	memId;
	
	public ArtCountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ArtCountVO(Integer artNo, Integer memId) {
		super();
		this.artNo = artNo;
		this.memId = memId;
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

}
