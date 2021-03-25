package com.artcount.model;

import java.util.List;

public class ArtCountService {
	private ArtCountDAO_interface dao;

	public ArtCountService() {
		dao = new ArtCountDAO();
	}
	
	public ArtCountVO add(Integer memId,Integer artNo) {
		ArtCountVO artCount = new ArtCountVO();
		artCount.setMemId(memId);
		artCount.setArtNo(artNo);
		dao.add(artCount);
		return artCount;
	}
	public ArtCountVO delete(Integer memId,Integer artNo) {
		ArtCountVO artCount = new ArtCountVO();
		artCount.setMemId(memId);
		artCount.setArtNo(artNo);
		dao.delete(artCount);
		return artCount;
	}
	public List<ArtCountVO> getMemberCount(Integer memId) {
	
		return dao.memberCount(memId);
	}
	public int getArtCount(Integer artNo) {
		return dao.artCount(artNo);
	}
	public boolean ifmemberCount(Integer memId,Integer artNo) {
		ArtCountVO artCount = new ArtCountVO();
		artCount.setMemId(memId);
		artCount.setArtNo(artNo);
		
		boolean isAdd = false;
		
		if(artCount.getMemId()==null) {
			return isAdd;
		}else if(dao.ifmemberCount(artCount).getArtNo()==null){
			
			return isAdd;
		}else {
			isAdd = true;
			return isAdd;
		}
	}
}
