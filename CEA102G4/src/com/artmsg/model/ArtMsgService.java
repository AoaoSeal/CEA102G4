package com.artmsg.model;

import java.util.ArrayList;
import java.util.List;

import com.art.model.ArticleVO;
import com.member.model.MemberService;
import com.member.model.MemberVO;

public class ArtMsgService {
	private ArtMsgDAO_interface dao;

	public ArtMsgService() {
		dao = new ArtMsgDAO();
	}
	
	public ArtMsgVO add(Integer memId,Integer artNo,String artMsgText) {

		ArtMsgVO artMsg = new ArtMsgVO();
		artMsg.setMemId(memId);
		artMsg.setArtNo(artNo);
		artMsg.setArtMsgText(artMsgText);
		dao.add(artMsg);
		return artMsg;
	}
	public ArtMsgVO update(Integer artMsgNo, String artMsgText) {
		ArtMsgVO artMsg = new ArtMsgVO();
		artMsg.setArtMsgText(artMsgText);
		artMsg.setArtMsgNo(artMsgNo);
		dao.add(artMsg);
		return artMsg;
	}
	public void delete(Integer artMsgNo) {
		dao.delete(artMsgNo);
	}
	public List<ArtMsgVO> getAll() {
		List<ArtMsgVO> artMsgList = new ArrayList(dao.getAll());
		MemberService memSvc = new MemberService();
		for(int i=0 ; i<artMsgList.size() ; i++) {
			int memId = artMsgList.get(i).getMemId();
			String memName = memSvc.getOneMem(memId).getMemName();
			artMsgList.get(i).setMemName(memName);
			System.out.println(artMsgList.get(i).getMemName());
		}
		return artMsgList;
	}
	public List<ArtMsgVO> getMsgByArtNo(Integer artNo) {
//		List<ArtMsgVO> artMsgList = new ArrayList<ArtMsgVO>(getMsgByArtNo(artNo));
		List<ArtMsgVO> artMsgList = new ArtMsgDAO().getMsgByArtNo(artNo);
		MemberService memSvc = new MemberService();
		for(int i=0 ; i<artMsgList.size() ; i++) {
			int memId = artMsgList.get(i).getMemId();
			String memName = memSvc.getOneMem(memId).getMemName();
			artMsgList.get(i).setMemName(memName);
		}
		return artMsgList;
	}
public ArtMsgVO getOneArt(Integer artMsgNo) {
		
		return dao.finkByPk(artMsgNo);
	}
}
