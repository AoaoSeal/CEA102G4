package com.artrep.model;

import java.util.List;

public class ArtRepService {
	private ArtRepDAO_interface dao;

	public ArtRepService() {
		super();
		 dao = new ArtRepDAO();
	}
	
	public ArtRepVO add(Integer memId, Integer artNo, String artRepNoText, Integer artRepStatus) {
		ArtRepVO artRep = new ArtRepVO();
		artRep.setMemId(memId);
		artRep.setArtNo(artNo);
		artRep.setArtRepNoText(artRepNoText);
		artRep.setArtRepStatus(artRepStatus);
		dao.add(artRep);
		return artRep;
	}
	public ArtRepVO update(String artRepNoText, Integer artRepNo) {
		ArtRepVO artRep = new ArtRepVO();
		artRep.setArtRepNoText(artRepNoText);
		artRep.setArtRepNo(artRepNo);
		dao.update(artRep);
		return artRep;
	}
	public ArtRepVO updateStatus(Integer artRepStatus, Integer artRepNo) {
		ArtRepVO artRep = new ArtRepVO();
		artRep.setArtRepStatus(artRepStatus);
		artRep.setArtRepNo(artRepNo);
		dao.update(artRep);
		return artRep;
	}
	public void delete(Integer artRepNo) {
		dao.delete(artRepNo);
		
	}
	public List<ArtRepVO> getAll() {
		return dao.getAll();
	}
}
