package com.registration_master.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.itinerary.model.ItService;
import com.itinerary.model.ItVO;
import com.member.model.MemberVO;
import com.registration_detail.model.RdService;
import com.registration_detail.model.RdVO;
import com.registration_master.model.RmService;
import com.registration_master.model.RmVO;

import util.it.HttpGetRequestMethodExample;

public class RmServlet extends HttpServlet {

       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		
		
//		if("insert_feedback".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//			
//				String str = req.getParameter("ldScore");
//System.out.println(str);
//				if(str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請填寫分數");
//				}
//				Integer ldScore = new Integer(str);
//				
//				String fbText = req.getParameter("fbText");
//System.out.println(fbText);		
//						
//				RmVO rmVO = new RmVO();
//				rmVO.setLdScore(ldScore);
//				rmVO.setFbText(fbText);
//				
//				RmService rmSvc = new RmService();
//				rmSvc.addFeedback(ldScore, fbText);
//System.out.println("評價新增成功");				
//				String url = "/back-end/leader/listAllLd.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);	
//				
//				if(!errorMsgs.isEmpty()) {
//					RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
//					failView.forward(req, res);
//					return;
//				}
//
//				
//			}catch(Exception e) {
//				errorMsgs.add("無法取的資料" + e.getMessage());
//				RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
//				failView.forward(req, res);
//				
//			}
//		}
		
		if("getOneByRmNo".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
						
			try {
				String str = req.getParameter("rmNo");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("抓不到主檔編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
					failView.forward(req, res);
					return;
				}
				
			 Integer rmNo = null;
			 try {
				 rmNo = new Integer(str);
			 }catch(Exception e) {
				 errorMsgs.add("主檔編號不正確");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
				 failView.forward(req, res);
				 return;
			 }
			 
			 
			 RmService rmSvc = new RmService();
			 RmVO rmVO = rmSvc.getOneByRmNo(rmNo);
			 if(rmVO == null) {
				 errorMsgs.add("查無資料");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
				 failView.forward(req, res);
				 return;
			 }
			req.setAttribute("rmVO", rmVO); 
			String url = "/front-end/registration/listOneDetail.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			}catch(Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myArea.jsp");
				failView.forward(req, res);
				
			}
		}
		
		
		if ("insert".equals(action)) {
//System.out.println("進入rm");			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
//System.out.println("進入try");					
				
				Integer peoCount = new Integer(req.getParameter("peoCount"));
//System.out.println("peoCount="+peoCount);				
				
				String[] attName = req.getParameterValues("attName");
//System.out.println(attName.length);				
				String attNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,15}$";
				if(attName.length == peoCount) {
					
					for(int i = 0 ; i < attName.length; i++) {						
//System.out.println(attName[i]);						
						if(!attName[i].trim().matches(attNameReg)) { 
							errorMsgs.add("姓名-請輸入長度2~15的中、英文字");
			            }
					}
				}else {
					errorMsgs.add("姓名-不可為空白");
				}
				
				String attPhoneReg = "^09[0-9]{2}-[0-9]{6}$";				
				String[] attPhone = req.getParameterValues("attPhone");
				if(attPhone.length == peoCount) {
					for(int i = 0 ; i < attPhone.length; i++) {						
						if(!attPhone[i].trim().matches(attPhoneReg)) { 
							errorMsgs.add("電話格式錯誤09**-123456");
			            }
					}
				}else {
					errorMsgs.add("電話-不可為空白");
				}
				
				
				String[] emerName = req.getParameterValues("emerName");
				if(emerName.length == peoCount) {
					for(int i = 0 ; i < emerName.length; i++) {						
						if(!emerName[i].trim().matches(attNameReg)) { 
							errorMsgs.add("姓名-請輸入長度2~15的中、英文字");
			            }
					}
				}else {
					errorMsgs.add("姓名-不可為空白");
				}
				
				
				
				String[] emerPhone = req.getParameterValues("emerPhone");
				if(emerPhone.length == peoCount) {
					for(int i = 0 ; i < emerPhone.length; i++) {						
						if(!emerPhone[i].trim().matches(attPhoneReg)) { 
							errorMsgs.add("電話格式錯誤09**-123456");
			            }
					}
				}else {
					errorMsgs.add("電話-不可為空白");
				}
				

				String[] attBirth = req.getParameterValues("attBirth");		
				if(!(attBirth.length == peoCount)) {					
					errorMsgs.add("請輸入出生日期");
				}
				
				Integer itNo = new Integer(req.getParameter("itNo").trim());
				
//				Integer memId = new Integer(req.getParameter("memId").trim());
				
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				Integer memId = memberVO.getMemId();
System.out.println("session的memId="+memId);								
//				Integer memId=1007;
				RmVO rmVO = new RmVO();
				
				rmVO.setMemId(memId);	
				rmVO.setItNo(itNo);	
				rmVO.setPeoCount(peoCount);	
				rmVO.setAttName(attName);	
				rmVO.setAttPhone(attPhone);	
				rmVO.setAttBirth(attBirth);	
				rmVO.setEmerName(emerName);
				rmVO.setEmerPhone(emerPhone);

				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("rmVO", rmVO); 
					RequestDispatcher failView = req
							.getRequestDispatcher("/front-end/registration/select_page2.jsp");
					failView.forward(req, res);
					return;
				}
				
				RmService rmSvc = new RmService();
				rmVO = rmSvc.addRm(memId, itNo, peoCount, attName, attPhone, attBirth, emerName, emerPhone);
				
				
				//報名成功寄出簡訊
				RmService rmSvc4 = new RmService();
				String itName = rmSvc4.getOneSuccess(itNo,memId).getItName();
				

//				String phone = "0981101146"; //接收者的電話 要測試的話可以改成你自己的號碼
//				String msg = "親愛的"+attName[0]+"您好，您的報名的"+itName +","+peoCount+"人已報名成功，期待當天與您相見。";//傳送的訊息
//				String endcodeMsg = URLEncoder.encode(msg,"UTF-8");
//System.out.println("endcodeMsg"+endcodeMsg);		
//				HttpGetRequestMethodExample sms = new HttpGetRequestMethodExample();
//				sms.sendSms(phone,endcodeMsg);
				
				
				//取出剛剛新增成功的人數peoCount累加到it的it_peocount
				RmService rmSvc3 = new RmService();
				Integer rmVOcount = rmSvc3.getOneSuccess(itNo,memId).getPeoCount();
				ItService itSvc = new ItService();
				Integer itVOcount = itSvc.getOneIt(itNo).getItPeocount();
				Integer addCount = rmVOcount+itVOcount;
System.out.println("addCount"+addCount);		

				ItVO itVO = new ItVO();
				itVO.setItNo(itNo);	
				itVO.setItPeocount(addCount);
				
				ItService itSvc2 = new ItService();
				itVO = itSvc2.updatePC(addCount, itNo);
System.out.println("更改人數成功");				
				
				//取出剛剛新增成功的rmVO和rdVO,轉交至成功畫面
				RmService rmSvc2 = new RmService();
				RmVO rmVO2 = rmSvc2.getOneSuccess(itNo,memId);
				
				req.setAttribute("rmVO2", rmVO2); 
System.out.println("rmVO2.getRmNo()="+rmVO2.getRmNo());	
				
//				RdService rdSvc2 = new RdService();
//				RdVO rdVO2 = rdSvc2.getOneByRmNo(rmVO2.getRmNo());
				
			
//				req.setAttribute("RdVO2", rdVO2); 
//System.out.println("rdVO2.getRdNo()="+rdVO2.getRdNo());	
				
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/registration/success.jsp"); 
				successView.forward(req, res);	
				
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/front-end/registration/select_page2.jsp");
				failView.forward(req, res);
			}
		}
		
		
		if("getOne_For_Display_BymemId".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
System.out.println("getOne_For_Display_BymemId");			

			try {				
//				Integer memId=1007;	
				HttpSession session = req.getSession();				
				Object memberVO = session.getAttribute("memberVO");
				MemberVO memberVO2=null;

//沒有memId->轉會員登入畫面
				if(memberVO == null) {
					errorMsgs.add("請先登入會員");
				}else {
					memberVO2 = (MemberVO)memberVO;
				}
								
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/mem.do?action=logoin");
					failView.forward(req, res);
					return;
				}
				
				Integer memId = memberVO2.getMemId();
				RmService rmSvc = new RmService();
				List<RmVO> list = rmSvc.getByMemId(memId);			 
			 
			 
//有memId,RM的List空的->轉無資料畫面
				 if(list == null) {
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/myAreaEmpty.jsp");
					failView.forward(req, res);
					return;
				 }
			 
//有memId,有RM的List->轉myArea畫面			 
				req.setAttribute("list", list); 
				String url = "/front-end/registration/myArea.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			
			}catch(Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/itinerary/listAllIt.jsp");
				failView.forward(req, res);
				
			}
		}

		
		
		if ("updateStatus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				Integer rmNo = new Integer(req.getParameter("rmNo").trim());
				Integer rmStatus = new Integer(req.getParameter("rmStatus").trim());
System.out.println("rmNo="+rmNo);	
System.out.println("rmStatus="+rmStatus);	

				RmVO rmVO = new RmVO();
				rmVO.setRmNo(rmNo);	
				rmVO.setRmStatus(rmStatus);	
		

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("rmVO", rmVO);
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/registration/listOneDetail.jsp");
					failView.forward(req, res);
					return;
				}
				
				RmService rmSvc = new RmService();
				rmVO = rmSvc.updateST(rmStatus,rmNo);
				
System.out.	println("rmStatus修改成功");		

				RmVO rmVO2 = new RmVO();
				rmVO2 = rmSvc.getOneByRmNo(rmNo);
				req.setAttribute("rmVO", rmVO2);
				String url = "/front-end/registration/listOneDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
								
				
			}catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/registration/listOneDetail.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
}
