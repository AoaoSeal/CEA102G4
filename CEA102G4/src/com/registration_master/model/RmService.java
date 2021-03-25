package com.registration_master.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


import com.registration_detail.model.RdVO;

public class RmService {

	private RmDAO_interface dao;
	
	public RmService() {
		dao = new RmDAO();
	}
	
	public RmVO addFeedback(Integer ldScore, String fbText) {
		
		RmVO rmVO = new RmVO();
		
		rmVO.setLdScore(ldScore);
		rmVO.setFbText(fbText);
		dao.insert(rmVO);
		
		return rmVO;
	}
	
	public List<RmVO> getByMemId(Integer memId) {
		return dao.getByMemId(memId);
	}
	
	public RmVO getOneSuccess(Integer itNo,Integer memId) {
		return dao.findByItnoMemid(itNo,memId);
	}
	
	public RmVO getOneByRmNo(Integer rmNo) {
		return dao.findByRmNO(rmNo);
	}
	
	public RmVO updateST(Integer rmStatus, Integer rmNo) {

		RmVO rmVO = new RmVO();		
		rmVO.setRmStatus(rmStatus);
		rmVO.setRmNo(rmNo);
		dao.updateStatus(rmVO);
		return rmVO;
	}
	
	public RmVO addRm(Integer memId, Integer itNo, Integer peoCount, String[] attName, String[] attPhone, String[] attBirth, String[] emerName, String[] emerPhone) {

		RmVO rmVO = new RmVO();		
		rmVO.setMemId(memId);
		rmVO.setItNo(itNo);
		rmVO.setPeoCount(peoCount);
		
		List<RdVO> rdList = new ArrayList<RdVO>(); 
		
		if((attName.length) == 1) {
		RdVO rd01 = new RdVO();   
		rd01.setAttName(attName[0]);
		rd01.setAttPhone(attPhone[0]);
		rd01.setAttBirth(attBirth[0]);
		rd01.setEmerName(emerName[0]);
		rd01.setEmerPhone(emerPhone[0]);
		rd01.setItNo(itNo);
		rdList.add(rd01);
		
		} else if((attName.length) == 2) {
		RdVO rd01 = new RdVO();   
		rd01.setAttName(attName[0]);
		rd01.setAttPhone(attPhone[0]);
		rd01.setAttBirth(attBirth[0]);
		rd01.setEmerName(emerName[0]);
		rd01.setEmerPhone(emerPhone[0]);
		rd01.setItNo(itNo);
		rdList.add(rd01);
		
		RdVO rd02 = new RdVO();   
		rd02.setAttName(attName[1]);
		rd02.setAttPhone(attPhone[1]);
		rd02.setAttBirth(attBirth[1]);
		rd02.setEmerName(emerName[1]);
		rd02.setEmerPhone(emerPhone[1]);
		rd02.setItNo(itNo);
		rdList.add(rd02);
		
		} else if((attName.length) == 3) {
		RdVO rd01 = new RdVO();   
		rd01.setAttName(attName[0]);
		rd01.setAttPhone(attPhone[0]);
		rd01.setAttBirth(attBirth[0]);
		rd01.setEmerName(emerName[0]);
		rd01.setEmerPhone(emerPhone[0]);
		rd01.setItNo(itNo);
		rdList.add(rd01);
		
		RdVO rd02 = new RdVO();   
		rd02.setAttName(attName[1]);
		rd02.setAttPhone(attPhone[1]);
		rd02.setAttBirth(attBirth[1]);
		rd02.setEmerName(emerName[1]);
		rd02.setEmerPhone(emerPhone[1]);
		rd02.setItNo(itNo);
		rdList.add(rd02);
		
		RdVO rd03 = new RdVO();   
		rd03.setAttName(attName[2]);
		rd03.setAttPhone(attPhone[2]);
		rd03.setAttBirth(attBirth[2]);
		rd03.setEmerName(emerName[2]);
		rd03.setEmerPhone(emerPhone[2]);
		rd03.setItNo(itNo);
		rdList.add(rd03);
		
		}else if((attName.length) == 4) {
		RdVO rd01 = new RdVO();   
		rd01.setAttName(attName[0]);
		rd01.setAttPhone(attPhone[0]);
		rd01.setAttBirth(attBirth[0]);
		rd01.setEmerName(emerName[0]);
		rd01.setEmerPhone(emerPhone[0]);
		rd01.setItNo(itNo);
		rdList.add(rd01);
		
		RdVO rd02 = new RdVO();   
		rd02.setAttName(attName[1]);
		rd02.setAttPhone(attPhone[1]);
		rd02.setAttBirth(attBirth[1]);
		rd02.setEmerName(emerName[1]);
		rd02.setEmerPhone(emerPhone[1]);
		rd02.setItNo(itNo);
		rdList.add(rd02);
		
		RdVO rd03 = new RdVO();   
		rd03.setAttName(attName[2]);
		rd03.setAttPhone(attPhone[2]);
		rd03.setAttBirth(attBirth[2]);
		rd03.setEmerName(emerName[2]);
		rd03.setEmerPhone(emerPhone[2]);
		rd03.setItNo(itNo);
		rdList.add(rd03);
		
		RdVO rd04 = new RdVO();   
		rd04.setAttName(attName[3]);
		rd04.setAttPhone(attPhone[3]);
		rd04.setAttBirth(attBirth[3]);
		rd04.setEmerName(emerName[3]);
		rd04.setEmerPhone(emerPhone[3]);
		rd04.setItNo(itNo);
		rdList.add(rd04);
		
		
		}else if((attName.length) == 5) {
		RdVO rd01 = new RdVO();   
		rd01.setAttName(attName[0]);
		rd01.setAttPhone(attPhone[0]);
		rd01.setAttBirth(attBirth[0]);
		rd01.setEmerName(emerName[0]);
		rd01.setEmerPhone(emerPhone[0]);
		rd01.setItNo(itNo);
		rdList.add(rd01);
		
		RdVO rd02 = new RdVO();   
		rd02.setAttName(attName[1]);
		rd02.setAttPhone(attPhone[1]);
		rd02.setAttBirth(attBirth[1]);
		rd02.setEmerName(emerName[1]);
		rd02.setEmerPhone(emerPhone[1]);
		rd02.setItNo(itNo);
		rdList.add(rd02);
		
		RdVO rd03 = new RdVO();   
		rd03.setAttName(attName[2]);
		rd03.setAttPhone(attPhone[2]);
		rd03.setAttBirth(attBirth[2]);
		rd03.setEmerName(emerName[2]);
		rd03.setEmerPhone(emerPhone[2]);
		rd03.setItNo(itNo);
		rdList.add(rd03);
		
		RdVO rd04 = new RdVO();   
		rd04.setAttName(attName[3]);
		rd04.setAttPhone(attPhone[3]);
		rd04.setAttBirth(attBirth[3]);
		rd04.setEmerName(emerName[3]);
		rd04.setEmerPhone(emerPhone[3]);
		rd04.setItNo(itNo);
		rdList.add(rd04);
		
		RdVO rd05 = new RdVO();   
		rd05.setAttName(attName[4]);
		rd05.setAttPhone(attPhone[4]);
		rd05.setAttBirth(attBirth[4]);
		rd05.setEmerName(emerName[4]);
		rd05.setEmerPhone(emerPhone[4]);
		rd05.setItNo(itNo);
		rdList.add(rd05);
		}
		
		
		dao.insertWithRds(rmVO, rdList);

		return rmVO;
	}
}
