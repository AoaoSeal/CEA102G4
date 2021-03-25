package com.itinerary_category.model;

import java.io.Serializable;

public class ItcVO implements Serializable{
	private Integer itcNo;
	private String itcName;
	
	
	public ItcVO() {
	}
	
	public Integer getItcNo() {
		return itcNo;
	}
	public void setItcNo(Integer itcNo) {
		this.itcNo = itcNo;
	}
	public String getItcName() {
		return itcName;
	}
	public void setItcName(String itcName) {
		this.itcName = itcName;
	}
	

}
