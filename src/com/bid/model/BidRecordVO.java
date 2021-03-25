package com.bid.model;

import java.sql.Timestamp;

public class BidRecordVO {
	
	private Integer bidrecNo;
	private Integer memId;
	private Integer bidNo;
	private Integer bidPrice;
	private Timestamp bidTime;
	

	
	public Integer getBidrecNo() {
		return bidrecNo;
	}
	public void setBidrecNo(Integer bidrecNo) {
		this.bidrecNo = bidrecNo;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getBidNo() {
		return bidNo;
	}
	public void setBidNo(Integer bidNo) {
		this.bidNo = bidNo;
	}
	public Integer getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(Integer bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Timestamp getBidTime() {
		return bidTime;
	}
	public void setBidTime(Timestamp bidTime) {
		this.bidTime = bidTime;
	}

}
