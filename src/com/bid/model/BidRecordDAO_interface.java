package com.bid.model;

import java.util.List;

import com.bid.model.BidRecordVO;

public interface BidRecordDAO_interface {
	
	public void insert(BidRecordVO bidRecordVO);

	public BidRecordVO findByPrimaryKey(Integer bidrecNo);
	
	public BidRecordVO findBymemId(Integer memId);
	
	public List<BidRecordVO> findBybidNo(Integer bidNo);

	public List<BidRecordVO> getAll();
}
