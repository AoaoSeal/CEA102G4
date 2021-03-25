package com.bid.model;

import java.sql.Timestamp;
import java.util.List;

import com.bid.model.BidRecordDAO_interface;
import com.bid.model.BidRecordVO;

public class BidRecordService {
	private BidRecordDAO_interface dao;

	public BidRecordService() {
		dao = new BidRecordDAO();
	}

	public BidRecordVO addBidRecord(Integer memId, Integer bidNo, Integer bidPrice) {
		BidRecordVO bidRecordVO = new BidRecordVO();
		bidRecordVO.setMemId(memId);
		bidRecordVO.setBidNo(bidNo);
		bidRecordVO.setBidPrice(bidPrice);

		return bidRecordVO;
	}

	public List<BidRecordVO> getOneBidRecord(Integer bidNo) {
		return dao.findBybidNo(bidNo);
	}

	public List<BidRecordVO> getAll() {
		return dao.getAll();
	}
}
