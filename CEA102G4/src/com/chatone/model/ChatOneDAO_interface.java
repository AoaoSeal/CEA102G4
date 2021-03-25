package com.chatone.model;

import java.util.List;

import com.bid.model.BidRecordVO;

public interface ChatOneDAO_interface {

	public void insert(ChatOneVO chatOneVO);

	public ChatOneVO findByMemid(Integer aMemid, Integer bMemid, String chatPath);
	
	public void delete(Integer aMemid, Integer bMemid, String chatPath);

	public List<ChatOneVO> getAll();
}
