package com.bid.model;

import java.sql.Timestamp;

public class BidVO implements java.io.Serializable{

	private Integer bidNo;
	private Integer itNo;
	private Integer bidPricestart;
	private Integer bidPricedir;
	private Timestamp bidTimestart;
	private Timestamp bidTimeend;
	private Integer bidrecNo;
	private Integer memId;
	private Integer bidPrice;
	private Integer bidStatus;
	
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
	public Integer getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(Integer bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Integer getBidNo() {
		return bidNo;
	}
	public void setBidNo(Integer bidNo) {
		this.bidNo = bidNo;
	}
	public Integer getItNo() {
		return itNo;
	}
	public void setItNo(Integer itNo) {
		this.itNo = itNo;
	}
	public Integer getBidPricestart() {
		return bidPricestart;
	}
	public void setBidPricestart(Integer bidPricestart) {
		this.bidPricestart = bidPricestart;
	}
	public Integer getBidPricedir() {
		return bidPricedir;
	}
	public void setBidPricedir(Integer bidPricedir) {
		this.bidPricedir = bidPricedir;
	}
	public Timestamp getBidTimestart() {	
	
		return bidTimestart;
	}
	public void setBidTimestart(Timestamp bidTimestart) {		
		this.bidTimestart = bidTimestart;
	}
	public Timestamp getBidTimeend() {
		return bidTimeend;
	}
	public void setBidTimeend(Timestamp bidTimeend) {
		this.bidTimeend = bidTimeend;
	}
	public Integer getBidStatus() {
		return bidStatus;
	}
	public void setBidStatus(Integer bidStatus) {
		this.bidStatus = bidStatus;
	}
	
	
	
}
