package com.bid.model;

import java.util.List;

import com.bid.model.BidVO;
import com.registration_detail.model.RdVO;
import com.registration_master.model.RmVO;

public interface BidDAO_interface {
	
	public void insert(BidVO bidVO);

	public void update(BidVO bidVO);

	public void change(Integer bidStatus, Integer bidNo);

	public BidVO findByPrimaryKey(Integer bidNo);
	
	public BidVO findByItNo(Integer itNo);

	public List<BidVO> getAll();
	
	public List<BidVO> getAllByStatus(Integer bidStatus);
	
	
	public void updateWithRds(RmVO rmVO , RdVO rdVO);
}
