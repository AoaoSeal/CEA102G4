package com.websocket;

public class AlarmMessage {

    private String mem_id;

    private String bid_no;

    private String bid_price;
    
    private String bid_time;
    
 
    private String mem_nick;


    public AlarmMessage(String mem_id, String bid_no, String bid_price, String bid_time ,String mem_nick) {

        this.mem_id = mem_id;

        this.bid_no = bid_no;

        this.bid_price = bid_price;
        
        this.bid_time = bid_time;
        
        this.mem_nick = mem_nick;
        

    }



  
    
    

	public String getMem_nick() {
		return mem_nick;
	}







	public String getMem_id() {
		return mem_id;
	}




	public String getBid_no() {
		return bid_no;
	}




	public String getBid_price() {
		return bid_price;
	}




	public String getBid_time() {
		return bid_time;
	}




}
