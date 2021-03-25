package com.artc.model;

public class ArtcVO implements java.io.Serializable{
	private Integer artcNo;
	private String artcName;
	public Integer getArtcNo() {
		return artcNo;
	}
	public void setArtcNo(Integer artcNo) {
		this.artcNo = artcNo;
	}
	public String getArtcName() {
		return artcName;
	}
	public void setArtcName(String artcName) {
		this.artcName = artcName;
	}
	public ArtcVO(Integer artcNo, String artcName) {
		super();
		this.artcNo = artcNo;
		this.artcName = artcName;
	}
	public ArtcVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
