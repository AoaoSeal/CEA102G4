package com.artc.model;

import java.util.List;
import java.util.Set;

import com.art.model.ArticleVO;

public interface ArtcDAO_interface {
	public void insert(ArtcVO artcVO);
	public void update(ArtcVO artcVO);
	public void delete(Integer artcNo);
	public ArtcVO findByPk(Integer artcNo);
	public List<ArtcVO> getAll(); //���p����Ʈw���|���ƩҥH�~�i�H��list
	//NoSQL�ɤ@��h��set�o������
	public  List<ArticleVO> getArtByArtc(Integer artcNo);//��list�O����?  ,<>��ArticleVO�ˤJ�j�M�X�Ӫ��峹
	//A ArticlelistAll   B listArtc  C listArt_ByArtcNo

}
