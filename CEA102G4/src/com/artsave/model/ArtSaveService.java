package com.artsave.model;

import java.util.ArrayList;
import java.util.List;

import com.art.model.ArticleService;
import com.art.model.ArticleVO;

public class ArtSaveService {
	private ArtSaveDAO_interface dao;

	public ArtSaveService() {
		dao = new ArtSaveDAO();
	}
	public ArtSaveVO add(Integer memId, Integer artNo) {
		ArtSaveVO artSave = new ArtSaveVO();
		artSave.setMemId(memId);
		artSave.setArtNo(artNo);
		dao.add(artSave);
		return artSave;
	}
	public void delete(Integer memId, Integer artNo) {
		ArtSaveVO artSave = new ArtSaveVO();
		artSave.setMemId(memId);
		artSave.setArtNo(artNo);
		dao.delete(artSave);
	}
	public List<ArticleVO> getSaveByMemList(Integer memId) {
		  
		  List<ArtSaveVO> artSaveList =  dao.getSaveByMem(memId);
		  List<ArticleVO> artVO = new ArrayList<ArticleVO>();
		  for(ArtSaveVO artSave : artSaveList) {
		   ArticleService artSvc = new ArticleService();
		   artVO.add(artSvc.getOneArt(artSave.getArtNo()));
		  }
		  
		  return artVO;
		 }
	
	public List<ArtSaveVO> getSaveByMem(Integer memId) {
		return dao.getSaveByMem(memId);
	}
	public List<ArtSaveVO> getSaveByArt() {
		return dao.getSaveByArt();
	}

}
