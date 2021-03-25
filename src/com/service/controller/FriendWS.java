package com.service.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


import com.google.gson.Gson;
import com.member.model.MemberService;
import com.member.model.MemberVO;

import com.service.model.*;


@ServerEndpoint("/FriendWS/{identy}/{identyID}")
public class FriendWS { //這邊用Map集合裝,因為要分使用者,不像群聊可以不用分
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();
			// Map<MemVO或是會員ID避免重複名稱, Session> //ConcurrentHashMap在同步鎖定上做的比Hashtable好,範圍小,針對hash裡面的小單位key/value,
			//MemVO使用自訂物件記得override eaqual和hashcode									     //而不像以前直接針對整個hash鎖定,效率提升
	
	Gson gson = new Gson();//google出的json

	@OnOpen
	public void onOpen(@PathParam("identy") String identy, @PathParam("identyID") String identyID,Session userSession) throws IOException {
		if (identy.equals("member")) {
//			MemberService memSvc = new MemberService();
//			MemberVO memVO = memSvc.getOneMem(new Integer(identyID));
			sessionsMap.put("member"+"1007", userSession);
		}else if (identy.equals("admin")) {
//			AdmiService admSvc = new AdmiService();
//			AdmiVO admiVO = admSvc.getByID(new Integer(identyID));
			sessionsMap.put("admin", userSession);
		}
	}


	@OnMessage
	public void onMessage(Session userSession, String message) {
		ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class); //gson可以直接參照class直接講json還原成java物件
		String sender = chatMessage.getSender();
		String receiver = chatMessage.getReceiver();
		
		//從DB拿取和sender和receiver對應的歷史訊息
		if ("history".equals(chatMessage.getType())) {
			System.out.println(sender);
			System.out.println(receiver);
			List<String> historyData = JedisHandleMessage.getHistoryMsg(sender, receiver);
			System.out.println(historyData);
			String historyMsg = gson.toJson(historyData);//將DB的歷史訊息拿出，轉成json
			
			ChatMessage cmHistory = new ChatMessage("history", sender, receiver, historyMsg);//將轉呈json的歷史訊息historyMsg,包入到剛剛傳進的json
			System.out.println("進入fhhd222");
			if (userSession != null && userSession.isOpen()) {
				userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));//將含有歷史訊息的cmHistory轉成json傳去畫面
System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		

		
		Session receiverSession = sessionsMap.get(receiver);
		//將對話訊息,傳至彼此的聊天畫面
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(message);
			userSession.getAsyncRemote().sendText(message);
			//將對話訊息存入DB
			JedisHandleMessage.saveChatMessage(sender, receiver, message);
		}
System.out.println("Message received: " + message);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
		System.out.println("進入friend");
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
//		String userNameClose = null;
//		Set<String> userNames = sessionsMap.keySet();
//		for (String userName : userNames) {
//			if (sessionsMap.get(userName).equals(userSession)) {
//				userNameClose = userName;
//				sessionsMap.remove(userName);
//				break;
//			}
//		}
//
//		if (userNameClose != null) {
//			State stateMessage = new State("close", userNameClose, userNames);
//			String stateMessageJson = gson.toJson(stateMessage);
//			Collection<Session> sessions = sessionsMap.values();
//			for (Session session : sessions) {
//				session.getAsyncRemote().sendText(stateMessageJson);
//			}
//		}
//
//		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
//				reason.getCloseCode().getCode(), userNames);
//		System.out.println(text);
	}
}
