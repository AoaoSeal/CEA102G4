package com.Followinglist.model;

import com.leader.model.LdDAO;
import com.leader.model.LdVO;

public class FlService {

	private FlDAO_interface dao;
	
	public FlService() {
		dao = new FlDAO();
	}
	
	public FlVO addLd(Integer itNo, Integer memId) {
		
		FlVO flVO = new FlVO();
		
		flVO.setItNo(itNo);
		flVO.setMemId(memId);
		dao.insert(flVO);
		
		return flVO;
	}
	
	public void deleteLd(Integer flVo) {
		dao.delete(flVo);
	}
}
