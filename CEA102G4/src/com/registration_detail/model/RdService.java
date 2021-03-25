package com.registration_detail.model;

import java.util.List;



public class RdService {
	
	private RdDAO_interface dao;
	
	public RdService() {
		dao = new RdDAO();
	}
	
	public RdVO getOneByRmNo(Integer rmNo) {
		return dao.findByRmNo(rmNo);
	}
	
	public List<RdVO> getAll() {
		return dao.getAll();
	}
}
