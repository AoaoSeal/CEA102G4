	package com.art.model;
//Vo
import java.io.Serializable;

import java.sql.Timestamp;



public class ArticleVO implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	private Integer artNo;
	private Integer artcNo;
	private Integer memId;
	private String artTitle;
	private String artText;
	private byte[] artPic;
	private Timestamp artTime;
	private Timestamp artLastmod;
	private Integer artCount;
	private Integer artStatus;
	
	
	public ArticleVO() {
		super();
		
	}
	
	public String getPicSrc() {
		String picSrc = "?table=article&column=art_pic&idName=art_no&id=" + this.artNo;
		
		return picSrc;
	}

	public ArticleVO(Integer artNo, Integer artcNo, Integer memId, String artTitle, String artText, byte[] artPic,
			Timestamp artTime, Timestamp artLastmod, Integer artCount, Integer artStatus) {
		super();
		this.artNo = artNo;
		this.artcNo = artcNo;
		this.memId = memId;
		this.artTitle = artTitle;
		this.artText = artText;
		this.artPic = artPic;
		this.artTime = artTime;
		this.artLastmod = artLastmod;
		this.artCount = artCount;
		this.artStatus = artStatus;
	
	}

	public Integer getArtNo() {
		return artNo;
	}

	public void setArtNo(Integer artNo) {
		this.artNo = artNo;
	}

	public Integer getArtcNo() {
		return artcNo;
	}

	public void setArtcNo(Integer artcNo) {
		this.artcNo = artcNo;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public String getArtTitle() {
		return artTitle;
	}

	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}

	public String getArtText() {
		return artText;
	}

	public void setArtText(String artText) {
		this.artText = artText;
	}

	public byte[] getArtPic() {
		return artPic;
	}

	public void setArtPic(byte[] artPic) {
		this.artPic = artPic;
	}

	public Timestamp getArtTime() {
		return artTime;
	}

	public void setArtTime(Timestamp artTime) {
		this.artTime = artTime;
	}

	public Timestamp getArtLastmod() {
		return artLastmod;
	}

	public void setArtLastmod(Timestamp artLastmod) {
		this.artLastmod = artLastmod;
	}

	public Integer getArtCount() {
		return artCount;
	}

	public void setArtCount(Integer artCount) {
		this.artCount = artCount;
	}

	public Integer getArtStatus() {
		return artStatus;
	}

	public void setArtStatus(Integer artStatus) {
		this.artStatus = artStatus;
	}


	
}