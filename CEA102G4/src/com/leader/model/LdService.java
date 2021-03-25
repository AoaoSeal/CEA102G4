package com.leader.model;

import java.util.List;


public class LdService {

	private LdDAO_interface dao;
	
	
	public LdService() {
		dao = new LdDAO();
	}
	
	public LdVO addLd(String ldName, byte[] ldPic, String ldExpr) {
		
		LdVO ldVO = new LdVO();
		
		ldVO.setLdName(ldName);
		ldVO.setLdPic(ldPic);
		ldVO.setLdExpr(ldExpr);
		dao.insert(ldVO);
		
		return ldVO;
	}
	
	
	public LdVO updateLd(Integer ldNo, String ldName, byte[] ldPic, String ldExpr) {
		
		LdVO ldVO = new LdVO();
		
		ldVO.setLdNo(ldNo);
		ldVO.setLdName(ldName);
		ldVO.setLdPic(ldPic);
		ldVO.setLdExpr(ldExpr);
//		ldVO.setLdMail(ldMail);
//		ldVO.setLdPass(ldPass);
		
		dao.update(ldVO);
		
		return ldVO;
	}
	
	
	public void deleteLd(Integer ldVo) {
		dao.delete(ldVo);
	}
	
	public LdVO getOneLd(Integer ldNo) {
		return dao.findByPrimaryKey(ldNo);
	}
	
	public List<LdVO> getAll() {
		return dao.getAll();
	}
	
	public LdVO getOneLdByMail(String ldMail) {
		
		return dao.findByMail(ldMail);
	}

	public String getOneLdName(Integer ldNo) {
		return dao.findByPrimaryKey(ldNo).getLdName();
	}
}
