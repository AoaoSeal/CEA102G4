package com.websocket;

public class ChatBidding {

	private String type;
	private String bid_no;
	
	private String mem_id;
	private String bid_price;

	public ChatBidding(String type,String bid_no, String mem_id, String bid_price) {
		this.type=type;
		this.bid_no=bid_no;
		this.mem_id=mem_id;
		this.bid_price=bid_price;

	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	
	public String getBid_no() {
		return bid_no;
	}

	public void setBid_no(String bid_no) {
		this.bid_no = bid_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBid_price() {
		return bid_price;
	}

	public void setBid_price(String bid_price) {
		this.bid_price = bid_price;
	}

}
