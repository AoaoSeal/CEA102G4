package com.itinerary_category.model;

import java.util.List;
import java.util.Set;
import com.itinerary.model.ItVO;

public class ItcService {
	
	private ItcDAO_interface dao;
	
	public ItcService() {
		dao = new ItcDAO();
	}
	
	public ItcVO addItc(String itcName) {
		ItcVO itcVO = new ItcVO();
		
		itcVO.setItcName(itcName);
		dao.insert(itcVO);
		return itcVO;
	}
	
	public ItcVO updateItc(Integer itcNo, String itcName) {
		
		ItcVO itcVO = new ItcVO();
		itcVO.setItcNo(itcNo);
		itcVO.setItcName(itcName);
		dao.update(itcVO);
		
		return itcVO;
	}
	public List<ItcVO> getAll(){
		return dao.getAll();
	}
	
	public Set<ItVO> getItsByItcno(Integer itcNo){
		return dao.getItsByItcno(itcNo);
	}
	
	public ItcVO getOneItc(Integer itcNo) {
		return dao.findByPrimaryKey(itcNo);
	}
	
	public String getItcName(Integer itcNo) {
		return dao.findByPrimaryKey(itcNo).getItcName();
	}
}
