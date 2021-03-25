package com.websocket;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
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

//import idv.david.websocketchat.model.ChatMessage;

@ServerEndpoint("/websocketK/{bid_no}")
public class websocketK {
	private static Map<Session, String> sessionsMap = new ConcurrentHashMap<>();
	Gson gson = new Gson();

	/*
	 * 如果想取得HttpSession與ServletContext必須實作
	 * ServerEndpointConfig.Configurator.modifyHandshake()，
	 * 參考https://stackoverflow.com/questions/21888425/accessing-servletcontext-and-
	 * httpsession-in-onmessage-of-a-jsr-356-serverendpoint
	 */
	@OnOpen
	public void onOpen(@PathParam("bid_no") String bid_no, Session userSession) throws IOException {
		System.out.println("38=" + userSession+bid_no);
		sessionsMap.put(userSession, bid_no);
//		System.out.println("40");
		System.out.println("userSession=" + userSession);
		System.out.println("40");
		DBUtil dbUtil = new DBUtil();
		String getFromDB = null;

		try {
			getFromDB = gson.toJson(dbUtil.getFromDB(bid_no));

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (userSession.isOpen()) {
			synchronized (userSession) {
				if (userSession.isOpen()) {
					try {
//						System.out.println("session=" + getFromDB);
						userSession.getAsyncRemote().sendText(getFromDB);
					} catch (Exception e) {
						e.getStackTrace();
					}
				}
			}
		}

	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		String setBiding = null;
		String type = null;
		String bid_no = null;
		String mem_id = null;
		String bid_price = null;
		
		synchronized (userSession) {
			if ("ping".equals(message)) {
//				System.out.println(message);
				userSession.getAsyncRemote().sendText("poung");
				return;
			} else {

				ChatBidding chatBidding = gson.fromJson(message, ChatBidding.class);
				type = chatBidding.getType();
				bid_no = chatBidding.getBid_no();

//				System.out.println("95="+chatBidding.getType());
				if ("biding".equals(chatBidding.getType())) {
				
					mem_id = chatBidding.getMem_id();
					bid_price = chatBidding.getBid_price();
					
					DBUtil dbUtil1 = new DBUtil();

					try {
						setBiding = gson.toJson(dbUtil1.setBiding(bid_no, mem_id, bid_price));
					} catch (ClassNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (IllegalAccessException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (InstantiationException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

					Collection<String> bidnos = sessionsMap.values();
					Collection<Session> sessions2 = sessionsMap.keySet();
					System.out.println("bidnos="+bidnos.size());
					System.out.println("sessions2="+sessions2.size());
					int Acountttt = 0;
					for (String bidno : bidnos) {

						if (bid_no.equals(bidno) && Acountttt==0) {
							++Acountttt;
							Collection<Session> sessions = sessionsMap.keySet();
							System.out.println(sessions.size());
							int countttt = 0;
							for (Session session : sessions) {

								if (session.isOpen()) {

									if (session.isOpen()) {
										try {
											++countttt;
											
										System.out.println("一次競標近來"+countttt+"次");
											session.getAsyncRemote().sendText(setBiding);
										} catch (Exception e) {
											e.getStackTrace();
										}

									}
								}
							}
						}
					}
				}else if("endBid".equals(chatBidding.getType())) {
					
//					System.out.println("143="+bid_no);
					DBUtil dbUtil2 = new DBUtil();
					String endingBid = null;
					try {
						endingBid = gson.toJson(dbUtil2.endingBid(bid_no));
						
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					Collection<String> bidnos = sessionsMap.values();
					for (String bidno : bidnos) {

						if (bid_no.equals(bidno)) {

							Collection<Session> sessions = sessionsMap.keySet();

							for (Session session : sessions) {

								if (session.isOpen()) {

									if (session.isOpen()) {
										try {
											session.getAsyncRemote().sendText(endingBid);
											System.out.println("有寄出"+endingBid);
										} catch (Exception e) {
											e.getStackTrace();
										}

									}
								}
							}
						}
					}
				
					
					
					
				}else if("startBid".equals(chatBidding.getType())) {

					DBUtil dbUtil3 = new DBUtil();
					try {
						dbUtil3.startBid(bid_no);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InstantiationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
					
					
				}
			}
		}
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		sessionsMap.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
//		System.out.println(text);
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

}
