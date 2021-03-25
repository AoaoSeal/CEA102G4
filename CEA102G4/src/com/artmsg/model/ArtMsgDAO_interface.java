package com.artmsg.model;

import java.util.List;

public interface ArtMsgDAO_interface {
	
	public void add(ArtMsgVO artMsg);
	public void update(ArtMsgVO artMsg);
	public void delete(int artMsgNo);
	public ArtMsgVO finkByPk(int artMsgNo);
	public List<ArtMsgVO> getAll();
	public List<ArtMsgVO> getMsgByArtNo(Integer artNo);
	

}
