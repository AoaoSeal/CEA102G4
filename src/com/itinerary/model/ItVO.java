package com.itinerary.model;

import java.io.Serializable;
import java.sql.Date;

import com.itinerary_category.model.ItcService;
import com.leader.model.LdService;



public class ItVO implements Serializable{
	private Integer itNo;
	private Integer ldNo;
	private Integer itcNo;
	private String  itName;
	private String  itText;
	private String  itTextoth;
	private byte[] itPic;
	private byte[] itPic2;
	private byte[] itPic3;
	private byte[] itPic4;
	private byte[] itPic5;
	private Integer itDays;
	private Integer itPrice;
	private Integer itPeolim;
	private Integer itPeocount;
	private Date itDate;
	private Date itStartdate;
	private Date itEnddate;
	private Integer itStatus;
	
	public ItVO() {
	}



	public Integer getItNo() {
		return itNo;
	}
	public void setItNo(Integer itNo) {
		this.itNo = itNo;
	}
	public Integer getLdNo() {
		return ldNo;
	}
	public void setLdNo(Integer ldNo) {
		this.ldNo = ldNo;
	}
	public Integer getItcNo() {
		return itcNo;
	}
	public void setItcNo(Integer itcNo) {
		this.itcNo = itcNo;
	}
	public String getItName() {
		return itName;
	}
	public void setItName(String itName) {
		this.itName = itName;
	}
	public String getItText() {
		return itText;
	}
	public void setItText(String itText) {
		this.itText = itText;
	}
	public String getItTextoth() {
		return itTextoth;
	}
	public void setItTextoth(String itTextoth) {
		this.itTextoth = itTextoth;
	}
	public byte[] getItPic() {
		return itPic;
	}
	public void setItPic(byte[] itPic) {
		this.itPic = itPic;
	}
	public byte[] getItPic2() {
		return itPic2;
	}

	public void setItPic2(byte[] itPic2) {
		this.itPic2 = itPic2;
	}

	public byte[] getItPic3() {
		return itPic3;
	}

	public void setItPic3(byte[] itPic3) {
		this.itPic3 = itPic3;
	}

	public byte[] getItPic4() {
		return itPic4;
	}

	public void setItPic4(byte[] itPic4) {
		this.itPic4 = itPic4;
	}

	public byte[] getItPic5() {
		return itPic5;
	}

	public void setItPic5(byte[] itPic5) {
		this.itPic5 = itPic5;
	}

	public Integer getItDays() {
		return itDays;
	}

	public void setItDays(Integer itDays) {
		this.itDays = itDays;
	}
	public Integer getItPrice() {
		return itPrice;
	}
	public void setItPrice(Integer itPrice) {
		this.itPrice = itPrice;
	}
	public Integer getItPeolim() {
		return itPeolim;
	}
	public void setItPeolim(Integer itPeolim) {
		this.itPeolim = itPeolim;
	}
	public Integer getItPeocount() {
		return itPeocount;
	}
	public void setItPeocount(Integer itPeocount) {
		this.itPeocount = itPeocount;
	}
	public Date getItDate() {
		return itDate;
	}
	public void setItDate(Date itDate) {
		this.itDate = itDate;
	}
	public Date getItStartdate() {
		return itStartdate;
	}
	public void setItStartdate(Date itStartdate) {
		this.itStartdate = itStartdate;
	}
	public Date getItEnddate() {
		return itEnddate;
	}
	public void setItEnddate(Date itEnddate) {
		this.itEnddate = itEnddate;
	}

	public Integer getItStatus() {
		return itStatus;
	}

	public void setItStatus(Integer itStatus) {
		this.itStatus = itStatus;
	}
	
	public String getLdName() {
		return new LdService().getOneLdName(ldNo);
	}
	
	public String getItcName() {
		return new ItcService().getItcName(itcNo);
	}
	
	public String getPic1() {
		return "/itinerary/pic.do?pic=1&table=itinerary&column=it_pic&idname=it_no&itNo="+itNo;
	}
	public String getPic2() {
		return "/itinerary/pic.do?pic=2&table=itinerary&column=it_pic2&idname=it_no&itNo="+itNo;
	}
	public String getPic3() {
		return "/itinerary/pic.do?pic=3&table=itinerary&column=it_pic3&idname=it_no&itNo="+itNo;
	}
	public String getPic4() {
		return "/itinerary/pic.do?pic=4&table=itinerary&column=it_pic4&idname=it_no&itNo="+itNo;
	}
	public String getPic5() {
		return "/itinerary/pic.do?pic=5&table=itinerary&column=it_pic5&idname=it_no&itNo="+itNo;
	}
}
