package com.chatone.model;

import java.sql.Timestamp;

public class ChatOneService {
	private ChatOneDAO_interface dao;

	public ChatOneService() {
		dao = new ChatOneDAO();
	}

	public ChatOneVO addChat(Integer aMemid, Integer bMemid, String chatPath, String chatText) {
		
		ChatOneVO chatOneVO = new ChatOneVO();
		chatOneVO.setaMemid(aMemid);
		chatOneVO.setbMemid(bMemid);
		chatOneVO.setChatPath(chatPath);
		chatOneVO.setChatText(chatText);
		dao.insert(chatOneVO);
				
		return chatOneVO;

	}
public void deleteMem(Integer aMemid, Integer bMemid, String chatPath) {
		
		dao.delete(aMemid,bMemid,chatPath);
	}
}
