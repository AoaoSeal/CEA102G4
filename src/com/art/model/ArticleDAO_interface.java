package com.art.model;

import java.util.List;

import com.msgrep.model.MsgRepVO;

public interface ArticleDAO_interface {

	public void add(ArticleVO article);
	public void update(ArticleVO article);
	public void updateStatus(ArticleVO article);
	public void delete(Integer artNo);
	public ArticleVO findByPK(Integer artNo);
	public List<ArticleVO> finkByTitle(String artTitle);
	public List<ArticleVO> finkByStatus(Integer msgRepNo);
	public List<ArticleVO> getAll();
	
}