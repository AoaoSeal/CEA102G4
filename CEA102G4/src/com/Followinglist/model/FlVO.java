package com.Followinglist.model;

import java.io.Serializable;

public class FlVO implements Serializable{
	
	private Integer itNo;
	private Integer memId;
	
	public FlVO() {
	}

	public Integer getItNo() {
		return itNo;
	}
	public void setItNo(Integer itNo) {
		this.itNo = itNo;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	
	
}
