package com.msgrep.model;

import java.util.List;

public class MsgRepService {
	private MsgRepDAO_interface dao;

	public MsgRepService() {
		dao = new MsgRepDAO();
	}
	public MsgRepVO add(Integer artMsgNo, Integer memId,String msgRepText, Integer msgRepStatus) {
		MsgRepVO msgRep = new MsgRepVO();
		msgRep.setArtMsgNo(artMsgNo);
		msgRep.setMemId(memId);
		msgRep.setMsgRepText(msgRepText);
		msgRep.setMsgRepStatus(msgRepStatus);
		dao.add(msgRep);
		return msgRep;
	}
	public MsgRepVO updateStatus(Integer artMsgNo, Integer msgRepStatus) {
		MsgRepVO msgRep = new MsgRepVO();
		msgRep.setArtMsgNo(artMsgNo);
		msgRep.setMsgRepStatus(msgRepStatus);
		dao.add(msgRep);
		return msgRep;
	}
	
	public MsgRepVO update(Integer artMsgNo,String msgRepText) {
		MsgRepVO msgRep = new MsgRepVO();
		msgRep.setArtMsgNo(artMsgNo);
		msgRep.setMsgRepText(msgRepText);	
		dao.update(msgRep);
		return msgRep;
	}
	public MsgRepVO finkByPk(Integer msgRepNo) {
		return dao.finkByPk(msgRepNo);
	}
	public List<MsgRepVO> getAll() {
		return dao.getAll();
	}
}
