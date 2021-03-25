package com.bid.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.member.model.MemberVO;
import com.registration_detail.model.RdVO;
import com.registration_master.model.RmVO;

public class BidService {
	private BidDAO_interface dao;

	public BidService() {
		dao = new BidDAO();
	}

	public BidVO addBid(Integer itNo, Integer bidPricestart, Timestamp bidTimestart,
			Timestamp bidTimeend) {

		BidVO bidVO = new BidVO();

		bidVO.setItNo(itNo);
		bidVO.setBidPricestart(bidPricestart);
//		bidVO.setBidPricedir(bidPricedir);
		bidVO.setBidTimestart(bidTimestart);
		bidVO.setBidTimeend(bidTimeend);

		dao.insert(bidVO);
		return bidVO;
 
	}

	public BidVO updateBid(Integer bidNo,Integer itNo, Integer bidPricestart, Timestamp bidTimestart,
			Timestamp bidTimeend) {

		BidVO bidVO = new BidVO();

		bidVO.setBidNo(bidNo);
		bidVO.setItNo(itNo);

		bidVO.setBidPricestart(bidPricestart);
//		bidVO.setBidPricedir(bidPricedir);
		bidVO.setBidTimestart(bidTimestart);
		bidVO.setBidTimeend(bidTimeend);

		
		dao.update(bidVO);
		return bidVO;
	}

	public void changStatus(Integer bidStatus, Integer bidNo) {

		dao.change(bidStatus, bidNo);
	}

	public BidVO getOneBid(Integer bidNo) {

		return dao.findByPrimaryKey(bidNo);
	}

	public List<BidVO> getAll() {
		return dao.getAll();
	}

	public List<BidVO> getAllByStatus(Integer bidStatus) {
		return dao.getAllByStatus(bidStatus);
	}
	
	
	public RmVO updateRm(Integer memId, Integer itNo, Integer peoCount, String[] attName, String[] attPhone, String[] attBirth, String[] emerName, String[] emerPhone) {

		RmVO rmVO = new RmVO();		
		rmVO.setMemId(memId);
		rmVO.setItNo(itNo);
		rmVO.setPeoCount(peoCount);
		RdVO rdVO = new RdVO();  
//		List<RdVO> rdList = new ArrayList<RdVO>(); 
		
//		if((attName.length) == 1) {
		 
		rdVO.setAttName(attName[0]);
		rdVO.setAttPhone(attPhone[0]);
		rdVO.setAttBirth(attBirth[0]);
		rdVO.setEmerName(emerName[0]);
		rdVO.setEmerPhone(emerPhone[0]);
		rdVO.setItNo(itNo);
//		rdList.add(rdVO);
		
//		} 
		
		
		dao.updateWithRds(rmVO, rdVO);

		return rmVO;
	}

}
