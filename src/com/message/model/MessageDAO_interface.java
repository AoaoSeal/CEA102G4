package com.message.model;

import java.util.List;

import com.bid.model.BidRecordVO;


public interface MessageDAO_interface {
	
	public void insert(MessageVO messageVO);
	
	public void delete(Integer messageNo, Integer memId);

	public MessageVO findBymemId(Integer memId);

	public List<MessageVO> getAll();

}
