package com.itinerary.model;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public class ItService {
	
	private ItDAO_interface dao;
	
	public ItService() {
		dao = new ItDAO();
	}

	public ItVO addIt(String  itName, Integer itcNo, Integer ldNo,  byte[] itPic, byte[] itPic2, byte[] itPic3, byte[] itPic4, byte[] itPic5, Integer itDays, Integer itPeolim, Integer itPrice, 
			java.sql.Date itDate, java.sql.Date itStartdate, java.sql.Date itEnddate, String  itText) {

		ItVO itVO = new ItVO();
		
		itVO.setItName(itName);
		itVO.setItcNo(itcNo);
		itVO.setLdNo(ldNo);
		itVO.setItPic(itPic);
		itVO.setItPic2(itPic2);
		itVO.setItPic3(itPic3);
		itVO.setItPic4(itPic4);
		itVO.setItPic5(itPic5);
		itVO.setItDays(itDays);
		itVO.setItPeolim(itPeolim);
		itVO.setItPrice(itPrice);
		itVO.setItDate(itDate);
		itVO.setItStartdate(itStartdate);
		itVO.setItEnddate(itEnddate);
		itVO.setItText(itText);
	
		dao.insert(itVO);

		return itVO;
	}
	
	public ItVO updateIt(String  itName, Integer itcNo, Integer ldNo,  byte[] itPic,  byte[] itPic2, byte[] itPic3, byte[] itPic4, byte[] itPic5, Integer itDays, Integer itPeolim, Integer itPrice, 
			java.sql.Date itDate, java.sql.Date itStartdate, java.sql.Date itEnddate, String  itText, Integer itNo) {

		ItVO itVO = new ItVO();
		
		itVO.setItName(itName);
		itVO.setItcNo(itcNo);
		itVO.setLdNo(ldNo);
		itVO.setItPic(itPic);
		itVO.setItPic2(itPic2);
		itVO.setItPic3(itPic3);
		itVO.setItPic4(itPic4);
		itVO.setItPic5(itPic5);
		itVO.setItDays(itDays);
		itVO.setItPeolim(itPeolim);
		itVO.setItPrice(itPrice);
		itVO.setItDate(itDate);
		itVO.setItStartdate(itStartdate);
		itVO.setItEnddate(itEnddate);	
		itVO.setItText(itText);
		itVO.setItNo(itNo);
		dao.update(itVO);

		return itVO;
	}
	
	public ItVO updateST(Integer itStatus, Integer itNo) {

		ItVO itVO = new ItVO();		
		itVO.setItStatus(itStatus);
		itVO.setItNo(itNo);
		dao.updateStatus(itVO);
//System.out.	println("updateST修改資料成功");	
		return itVO;
	}
	
	public ItVO updatePC(Integer itPeocount, Integer itNo) {

		ItVO itVO = new ItVO();		
		itVO.setItPeocount(itPeocount);
		itVO.setItNo(itNo);
		dao.updatePeoCount(itVO);
//System.out.	println("updateST修改資料成功");	
		return itVO;
	}
	
	public ItVO getOneIt(Integer itNo) {
		return dao.findByPrimaryKey(itNo);
	}

	public List<ItVO> getAll() {
		return dao.getAll();
	}
	
	public List<ItVO> getStatus0() {
		return dao.getAllbyStatus0();
	}
	
	public List<ItVO> getAllbyLdNo() {
		return dao.getAllbyLdNo();
	}
	
	public List<ItVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	public Integer getItPrice(Integer itNo) {
		return dao.findByPrimaryKey(itNo).getItPrice();
	}
	
	public String getItName(Integer itNo) {
		return dao.findByPrimaryKey(itNo).getItName();
	}
}
