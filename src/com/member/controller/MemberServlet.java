package com.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bid.model.*;
import com.itinerary.model.ItService;
import com.itinerary.model.ItVO;
import com.member.model.*;

@MultipartConfig
public class MemberServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String openindex = req.getParameter("openindex");						
			req.setAttribute("openindex", openindex);
//System.out.println("getOne_For_Login="+openindex);
			try {
				String memMail = req.getParameter("memMail");
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMemByMail(memMail);

				if (memberVO.getMemStatus() == 1) {
					errorMsgs.add("此帳號被停權中");
				}

				if (memMail == null || memMail.trim().length() == 0 || memberVO == null) {

					errorMsgs.add("電子信箱或密碼錯誤");
				}

				String pass = req.getParameter("memPass");

				if (pass == null || pass.trim().length() == 0) {

					errorMsgs.add("電子信箱或密碼錯誤");
				}

				if (memberVO != null) {
					String mempass = memberVO.getMemPass();

					if (!pass.equals(mempass)) {

						errorMsgs.add("電子信箱或密碼錯誤");
					}

//				getOneMemByMail
					// 開始查詢

				}
				if (!errorMsgs.isEmpty()) {
					boolean openModal = true;
					boolean openlogin = true;
					req.setAttribute("openModal", openModal);
					req.setAttribute("openlogin", openlogin);
										
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交

				req.getSession().setAttribute("memberVO", memberVO);
				boolean openmember = true;

				req.setAttribute("openmember", openmember);
				String uri = (String) req.getSession().getAttribute("uri");
//============從產品頁登入需要加這判斷撈出屬於那一頁的資訊
				if("/front-end/bid/bid_listOne_index.jsp".equals(uri)) {					
					int bidNo= (int) req.getSession().getAttribute("bidNo");

					
					BidService bidSvc = new BidService();					
					BidVO bidVO = bidSvc.getOneBid(bidNo);					
					req.setAttribute("bidVO", bidVO);
				}
//============從產品頁登入需要加這判斷撈出屬於那一頁的資訊		
//============從行程頁登入需要加這判斷撈出屬於那一頁的資訊
				if("/front-end/itinerary/listOneIt2.jsp".equals(uri)) {					
					int itNo= (int) req.getSession().getAttribute("itNo");
					ItService itSvc = new ItService();					
					ItVO itVO = itSvc.getOneIt(itNo);					
					req.setAttribute("itVO", itVO);
				}
//============從行程頁登入需要加這判斷撈出屬於那一頁的資訊	
				
				RequestDispatcher successView = req.getRequestDispatcher(uri);
				successView.forward(req, res);
			} catch (Exception e) {
				boolean openModal = true;
				boolean openlogin = true;
				req.setAttribute("openModal", openModal);
				req.setAttribute("openlogin", openlogin);
				errorMsgs.add("電子信箱或密碼錯誤 ");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				failureView.forward(req, res);
			}
		}
		if ("home".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String openindex = req.getParameter("openindex");						
			req.setAttribute("openindex", openindex);
//			System.out.println("home="+openindex);
		
			try {
				String memId = req.getParameter("memId");
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(Integer.parseInt(memId));

				// 查詢完畢準備轉交

				req.setAttribute("memberVO", memberVO);
				boolean openmember = true;

				req.setAttribute("openmember", openmember);
				String url = "/front-end/front_end_index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display".equals(action)) {
			// ------------接收請求參數,格式錯誤處理-----------
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			// ------------接收請求參數-----------
			try {
				String str = req.getParameter("memId");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer memId = null;

				try {
					memId = new Integer(str);

				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始查詢
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交
				req.setAttribute("memberVO", memberVO);
				String url = "/back-end/member/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_Member_For_Display".equals(action)) {
			// ------------接收請求參數,格式錯誤處理-----------
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			// ------------接收請求參數-----------
			try {
				String str = req.getParameter("memId");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member_scan.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer memId = null;

				try {
					memId = new Integer(str);

				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member_scan.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始查詢
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member_scan.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交
				req.setAttribute("memberVO99", memberVO);
				String url = "/front-end/member_scan.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member_scan.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_allfollow".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer memId = new Integer(req.getParameter("memId"));
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				boolean openmember = true;
				boolean openModal = false;
				String openindexe = "member_index";
				String memberFunction = "我的追蹤";

				req.setAttribute("memberFunction", memberFunction);
				req.setAttribute("openindex", openindexe);
				req.setAttribute("openmember", openmember);
				req.setAttribute("openModal", openModal);

				req.setAttribute("memberVO", memberVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

				successView.forward(req, res);

			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				failureView.forward(req, res);
			}

		}
		if ("logoin".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

//				Integer memId = new Integer(req.getParameter("memId"));
//				MemberService memberSvc = new MemberService();
//				MemberVO memberVO = memberSvc.getOneMem(memId);

//				boolean openmember = true;
				boolean openModal = true;
//				String openindex = "bid_index";
				boolean openlogin = true;
//				req.setAttribute("openindex", openindex);
				req.setAttribute("openlogin", openlogin);
				req.setAttribute("openModal", openModal);
//				req.setAttribute("openmember", openmember);
				String uri = (String) req.getSession().getAttribute("uri");
//============從產品頁登入需要加這判斷撈出屬於那一頁的資訊
				if("/front-end/bid/bid_listOne_index.jsp".equals(uri)) {					
					int bidNo= (int) req.getSession().getAttribute("bidNo");
System.out.println("有經過競標"+bidNo);
					
					BidService bidSvc = new BidService();					
					BidVO bidVO = bidSvc.getOneBid(bidNo);					
					req.setAttribute("bidVO", bidVO);
				}
//============從產品頁登入需要加這判斷撈出屬於那一頁的資訊		
//============從行程頁登入需要加這判斷撈出屬於那一頁的資訊
				if("/front-end/itinerary/listOneIt2.jsp".equals(uri)) {					
					int itNo= (int) req.getSession().getAttribute("itNo");
					ItService itSvc = new ItService();					
					ItVO itVO = itSvc.getOneIt(itNo);					
					req.setAttribute("itVO", itVO);
				}
//============從行程頁登入需要加這判斷撈出屬於那一頁的資訊	

				RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

				successView.forward(req, res);

			} catch (Exception e) {

				boolean openModal = false;
				String openindex = "bid_index";

				req.setAttribute("openindex", openindex);

				req.setAttribute("openModal", openModal);
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				failureView.forward(req, res);
			}

		}

		
		
		if ("add".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

//				Integer memId = new Integer(req.getParameter("memId"));
//				MemberService memberSvc = new MemberService();
//				MemberVO memberVO = memberSvc.getOneMem(memId);

//				boolean openmember = true;
				boolean openModal = true;
//				String openindex = "bid_index";
				boolean openadd = true;
//				req.setAttribute("openindex", openindex);
				req.setAttribute("openadd", openadd);
				req.setAttribute("openModal", openModal);


				RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

				successView.forward(req, res);

			} catch (Exception e) {

				boolean openModal = false;
				String openindex = "bid_index";

				req.setAttribute("openindex", openindex);

				req.setAttribute("openModal", openModal);
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				failureView.forward(req, res);
			}

		}
		if ("getOne_For_message".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer memId = new Integer(req.getParameter("memId"));
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				boolean openmember = true;
				boolean openModal = false;
				String openindex = "member_index";
				String memberFunction = "修改會員資料";

				req.setAttribute("memberFunction", memberFunction);
				req.setAttribute("openindex", openindex);
				req.setAttribute("openmember", openmember);
				req.setAttribute("openModal", openModal);

				req.setAttribute("memberVO", memberVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/listAllMem.jsp");
				failureView.forward(req, res);
			}

		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer memId = new Integer(req.getParameter("memId"));
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				req.setAttribute("memberVO", memberVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/member/member_update.jsp");

				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_update.jsp");
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);


			try {

				Integer memId = Integer.parseInt(req.getParameter("memId"));
				String memPass = req.getParameter("memPass");
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				if (memPass == null || memPass.trim().length() == 0) {
					errorMsgs.add("密碼不可為空白");
				}
				String memName = req.getParameter("memName");

				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("姓名不可為空白");
				}

				String memNick = req.getParameter("memNick");
				if (memNick == null || memNick.trim().length() == 0) {
					errorMsgs.add("暱稱不可為空白");
				}

				String memPhone = req.getParameter("memPhone");

				if (memPhone == null || memPhone.trim().length() == 0) {
					errorMsgs.add("電話不可為空白");
				}

				String memAddress = req.getParameter("memAddress");

				if (memAddress == null) {

					memAddress = memberVO.getMemAddress();

				} else if (memAddress.equals(",,")) {
					memAddress = "";
				}

				byte[] memPic = null;
				Part part = req.getPart("memPic");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					memPic = memberVO.getMemPic();

				} else if (in.available() >= 2000000) {
					memPic = memberVO.getMemPic();
					errorMsgs.add("圖片超過大小");
				} else {
					memPic = new byte[in.available()];

					in.read(memPic);
					in.close();

				}

				String memText = req.getParameter("memText");

				MemberVO memberVO2 = new MemberVO();
				memberVO2.setMemMail(memberVO.getMemMail());
				memberVO2.setMemSex(memberVO.getMemSex());
				memberVO2.setMemBirth(memberVO.getMemBirth());

				memberVO2.setMemId(memId);
				memberVO2.setMemPass(memPass);
				memberVO2.setMemName(memName);
				memberVO2.setMemNick(memNick);
				memberVO2.setMemPhone(memPhone);
				memberVO2.setMemAddress(memAddress);
				memberVO2.setMemPic(memPic);
				memberVO2.setMemText(memText);

				if (!errorMsgs.isEmpty()) {

					req.setAttribute("memberVO", memberVO2);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_update.jsp");
					failureView.forward(req, res);
					return;
				}

				memberSvc = new MemberService();
				memberVO = memberSvc.updateMem(memId, memPass, memName, memNick, memPhone, memAddress, memPic, memText);

				
				 MemberVO memberVO3 = memberSvc.getOneMem(memId);
				 req.getSession().setAttribute("memberVO", memberVO3);

				String url = "/front-end/member/member_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				
				successView.forward(req, res);

			} catch (NullPointerException se) {

				errorMsgs.add("圖檔太大:" + se.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_update.jsp");
				failureView.forward(req, res);
			} catch (Exception e) {

				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/member_update.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			
			String openindex = req.getParameter("openindex");						
			req.setAttribute("openindex", openindex);
			
//			System.out.println("insert"+openindex);
			try {
//先除錯
				String memMail = req.getParameter("memMail");

				String memMailReg = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (memMail == null || memMail.trim().length() == 0) {
					errorMsgs.add("信箱不可為空白");
				} else if (!memMail.trim().matches(memMailReg)) {
					errorMsgs.add("信箱格式不對");
				}
				String memPass = req.getParameter("memPass");
				if (memPass == null || memPass.trim().length() == 0) {
					errorMsgs.add("密碼不可為空白");
				}
				String memName = req.getParameter("memName");
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("姓名不可為空白");
				}

				String memSexStr = req.getParameter("memSex");
				Integer memSex = 0;
				if (memSexStr == null) {
					errorMsgs.add("性別不可為空白");
				} else {
					memSex = new Integer(memSexStr);

				}

				java.sql.Date memBirth = null;

				try {
					memBirth = java.sql.Date.valueOf(req.getParameter("memBirth").trim());
				} catch (IllegalArgumentException e) {
					memBirth = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				String memNick = req.getParameter("memNick");
				if (memNick == null || memNick.trim().length() == 0) {
					errorMsgs.add("暱稱不可為空白");
				}
				String memPhone = req.getParameter("memPhone");

				String memAddress = req.getParameter("memAddress");

				byte[] memPic = null;
				Part part = req.getPart("memPic");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					memPic = null;

				} else if (in.available() >= 2000000) {
					errorMsgs.add("圖片超過大小");
				} else {
					memPic = new byte[in.available()];

					in.read(memPic);
					in.close();
//					memPic = Base64.getEncoder().encodeToString(pic);
				}

				String memText = req.getParameter("memText");

				MemberVO memberVO = new MemberVO();
				memberVO.setMemMail(memMail);
				memberVO.setMemPass(memPass);
				memberVO.setMemName(memName);
				memberVO.setMemSex(memSex);
				memberVO.setMemBirth(memBirth);
				memberVO.setMemNick(memNick);
				memberVO.setMemPhone(memPhone);
				memberVO.setMemAddress(memAddress);
				memberVO.setMemPic(memPic);
				memberVO.setMemText(memText);

				if (!errorMsgs.isEmpty()) {
					
					req.setAttribute("memberVO", memberVO);
					
					
					boolean openModal = true;
					boolean openregistered = true;

					req.setAttribute("openModal", openModal);
					req.setAttribute("openregistered", openregistered);

					// 取出的empVO送給listOneEmp.jsp
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

					successView.forward(req, res);
					return;
				}

				// 開始新增
				MemberService memberSvc = new MemberService();

				memberVO = memberSvc.addMem(memMail, memPass, memName, memSex, memBirth, memNick, memPhone, memAddress,
						memPic, memText);
				boolean openmember = true;
				memberVO = memberSvc.getOneMemByMail(memMail);
				req.setAttribute("memberVO", memberVO);
				req.setAttribute("openmember", openmember);
				String url = "/front-end/front_end_index.jsp";
				req.getSession().setAttribute("memberVO", memberVO);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {

				if (e.getMessage().equals(null)) {

					errorMsgs.add(e.getMessage());
				}
				errorMsgs.add("電子信箱不可重複");

				boolean openModal = true;
				boolean openregistered = true;
				req.setAttribute("openModal", openModal);
				
				openindex = req.getParameter("openindex");						
				req.setAttribute("openindex", openindex);				
//				System.out.println("insert2"+openindex);
				
				
				req.setAttribute("openregistered", openregistered);

				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/front_end_index.jsp");

				failureView.forward(req, res);
			}

		}
		if ("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer memId = new Integer(req.getParameter("memId"));
				Integer memStatus = new Integer(req.getParameter("memStatus"));
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMem(memStatus, memId);

				String url = "/back-end/member/listAllMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/listAllMem.jsp");
				failureView.forward(req, res);
			}

		}
		if ("deleteOne".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer memId = new Integer(req.getParameter("memId"));
				Integer memStatus = new Integer(req.getParameter("memStatus"));
				// 開始查詢
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMem(memStatus, memId);
				MemberVO memberVO = memberSvc.getOneMem(memId);

				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交
				req.setAttribute("memberVO", memberVO);
				String url = "/back-end/member/listOneMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/listOneMem.jsp");
				failureView.forward(req, res);
			}

		}



		if ("logout".equals(action)) {

			try {

				// 取出的empVO送給listOneEmp.jsp
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/front_end_index.jsp");
				req.getSession().setAttribute("memberVO", null);
				successView.forward(req, res);
				return;

				// Handle any unusual exceptions
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}

	}

}
