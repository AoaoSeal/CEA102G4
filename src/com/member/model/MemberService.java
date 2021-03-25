package com.member.model;

import java.sql.*;
import java.util.List;

public class MemberService {
	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}
	
	public MemberVO addMem(String memMail,String memPass,String memName,Integer memSex,
			Date memBirth, String memNick,String memPhone,String memAddress,byte[] memPic,
			String memText) {
		
		MemberVO memberVO =  new MemberVO();

		memberVO.setMemMail(memMail);
		memberVO.setMemPass(memPass);
		memberVO.setMemName(memName);
		memberVO.setMemSex(memSex);
		memberVO.setMemBirth(memBirth);
		memberVO.setMemNick(memNick);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemPic(memPic);
		memberVO.setMemText(memText);
		dao.insert(memberVO);
		return memberVO;
		
	}
	public MemberVO updateMem(Integer memId,String memPass,String memName,String memNick,String memPhone,String memAddress,byte[] memPic,
			String memText) {
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setMemId(memId);
		memberVO.setMemPass(memPass);
		memberVO.setMemName(memName);
		memberVO.setMemNick(memNick);
		memberVO.setMemPhone(memPhone);
		memberVO.setMemAddress(memAddress);
		memberVO.setMemPic(memPic);
		memberVO.setMemText(memText);
		
		dao.update(memberVO);
		
		return memberVO;
	}
	
	public void deleteMem(Integer memStatus,Integer memId) {
		
		dao.delete(memStatus,memId);
	}
	
	public MemberVO getOneMem(Integer memId) {
		
		return dao.findByPrimaryKey(memId);
	}
	
public MemberVO getOneMemByMail(String memMail) {
		
		return dao.findByMail(memMail);
	}
	
	public List<MemberVO> getAll(){
		return dao.getAll();
	}
	
}
