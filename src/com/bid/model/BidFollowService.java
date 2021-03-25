package com.bid.model;

public class BidFollowService {
	private BidFollowDAO_interface dao;

	public BidFollowService() {
		dao = new BidFollowDAO();

	}

	public BidFollowVO addBidFollow(Integer bidrecNo, Integer memId) {

		BidFollowVO bidFollowVO = new BidFollowVO();

		bidFollowVO.setBidrecNo(bidrecNo);
		bidFollowVO.setMemId(memId);
		dao.insert(bidFollowVO);

		return bidFollowVO;

	}

	public void deleteBidFollow(Integer bidrecNo, Integer memId) {

		dao.delete(bidrecNo, memId);
	}

}
