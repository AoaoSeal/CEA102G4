package com.artc.model;

import java.util.List;
import java.util.Set;

import com.art.model.ArticleVO;

public class ArtcService {
	
	private ArtcDAO_interface dao;
	

	public ArtcService() {
		dao = new ArtcDAO();
		
	}
	public ArtcVO add(ArtcVO artcVO) {
		dao.insert(artcVO);
		return artcVO;
	}
	public ArtcVO update(ArtcVO artcVO) {
		dao.update(artcVO);
		return artcVO;
	}
	public Integer  delete(Integer artcNo) {
		dao.delete(artcNo);
		return artcNo;
	}
	public List<ArtcVO> getAll(){
		return dao.getAll();
	}
	public List<ArticleVO> getArtByArtc(Integer artcNo){
		
		return dao.getArtByArtc(artcNo);
		
	}
	
	
	

}
