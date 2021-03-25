package com.art.model;

import java.util.List;

public class ArticleService {
	private ArticleDAO_interface dao ;

	public ArticleService() {
		dao = new ArticleDAO();
	
		
	}
	
		
	
	public ArticleVO getOneArticle(Integer artNo) {
		return dao.findByPK(artNo);
	}
	public ArticleVO add(Integer artcNo,Integer memId,String artTitle, String artText, byte[] artPic,
			Integer artCount,Integer artStatus) {
		ArticleVO artvo =new ArticleVO();
		artvo.setArtcNo(artcNo);
		artvo.setMemId(memId);
		artvo.setArtTitle(artTitle);
		artvo.setArtText(artText);
		artvo.setArtPic(artPic);
		artvo.setArtCount(artCount);
		artvo.setArtStatus(artStatus);
	
	
		dao.add(artvo);
		
		return artvo;
		
	}
	public ArticleVO update( Integer artcNo, String artTitle, String artText, byte[] artPic,Integer artNo) {
		ArticleVO artvo =new ArticleVO();
		artvo.setArtcNo(artcNo);
		artvo.setArtTitle(artTitle);
		artvo.setArtText(artText);
		artvo.setArtPic(artPic);
		artvo.setArtNo(artNo);
		dao.update(artvo);
		return artvo;
		
	}
	public ArticleVO updateStatus(Integer artStatus,Integer artNo) {
		ArticleVO artvo =new ArticleVO();
		artvo.setArtNo(artNo);
		artvo.setArtStatus(artStatus);
		dao.updateStatus(artvo);
		return artvo;
		
	}
	public void deleteArt(Integer artNo) {
		dao.delete(artNo);
	}
	public ArticleVO getOneArt(Integer artNo) {
		
		return dao.findByPK(artNo);
	}
	public List<ArticleVO> getAll() {
		return dao.getAll();
	}
	public List<ArticleVO> finkByTitle(String artTitle){
		
		return dao.finkByTitle(artTitle);
	}

}
