package com.message.model;

import java.sql.Timestamp;
import java.util.List;

import com.member.model.MemberVO;

public class MessageService {

	private MessageDAO_interface dao;

	public MessageService() {
		dao = new MessageDAO();
	}

	public MessageVO addMessage(Integer memId, Integer messageC, String messageContain) {
		MessageVO messageVO = new MessageVO();
		messageVO.setMemId(memId);
		messageVO.setMessageC(messageC);
		messageVO.setMessageContain(messageContain);
		dao.insert(messageVO);

		return messageVO;

	}

	public void deleteMessage(Integer messageNo, Integer memId) {

		dao.delete(messageNo, memId);
	}

	public MessageVO getOneMem(Integer memId) {

		return dao.findBymemId(memId);
	}
	
	public List<MessageVO> getAll(){
		return dao.getAll();
	}
}
