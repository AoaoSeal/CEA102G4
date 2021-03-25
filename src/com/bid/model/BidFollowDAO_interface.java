package com.bid.model;

import java.util.List;

public interface BidFollowDAO_interface {
	
	public void insert(BidFollowVO bidFollowVO);
	
	public void delete(Integer bidNo, Integer memId);

	public BidFollowVO findBymemId(Integer memId);
	
	public BidFollowVO findBybidNo(Integer bidNo);

	public List<BidFollowVO> getAll();
}
