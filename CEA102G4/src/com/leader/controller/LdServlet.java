package com.leader.controller;

import java.io.*;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.leader.model.*;
import com.member.model.MemberService;
import com.member.model.MemberVO;


@MultipartConfig
public class LdServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
	
		if ("ld_Login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			try {
				String ldMail = req.getParameter("ldMail");
				LdService ldSvc = new LdService();
				LdVO ldVO = ldSvc.getOneLdByMail(ldMail);
				
				if (ldMail == null || ldMail.trim().length() == 0 || ldVO == null) {
					errorMsgs.add("電子信箱或密碼錯誤");
				}
				
				String ldPass = req.getParameter("ldPass");
				if (ldPass == null || ldPass.trim().length() == 0) {
					errorMsgs.add("密碼錯誤");
				}
				

				if (ldVO != null) {
					String ldVopass = ldVO.getLdPass();
					if (!ldPass.equals(ldVopass)) {
						errorMsgs.add("電子信箱或密碼錯誤");
					}
				}
				if(!errorMsgs.isEmpty()) {
//					req.setAttribute("ldVO", ldVO);
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/leader_login.jsp");
					failView.forward(req, res);
					return;
				}
				req.getSession().setAttribute("ldVO", ldVO);
				String url = "/back-end/leader/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.add("電子信箱或密碼錯誤:"+ e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/leader_login.jsp");
				failView.forward(req, res);
				
			}
		}

		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);			
	
			try {
				
				Integer ldNo = new Integer(req.getParameter("ldNo"));
				LdService ldSvc = new LdService();
				LdVO ldVO = ldSvc.getOneLd(ldNo);
				
				req.setAttribute("ldVO", ldVO);
				String url = "/back-end/leader/update_ld_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:"+ e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/listAllLd.jsp");
				failView.forward(req, res);
				
			}
		}
		
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			
			try {
				Integer ldNo = new Integer(req.getParameter("ldNo").trim());
				String ldName = req.getParameter("ldName");
				String ldNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				LdService ldSvc1 = new LdService();
				LdVO ldVO1 = ldSvc1.getOneLd(ldNo);
				
				
				if(ldName == null || ldName.trim().length() == 0) {
					errorMsgs.add("領隊姓名-不可為空白");
				}else if(!ldName.trim().matches(ldNameReg)) {
					errorMsgs.add("領隊姓名-請輸入長度2~10的中、英文");
				}
				
				
				byte[] ldPic = null;
				try {
					Part part = req.getPart("ldPic");
					InputStream in = part.getInputStream();
System.out.println(part);
System.out.println(in.available());
System.out.println(ldVO1.getLdPic());
					if(in.available() == 0) {
						ldPic = ldVO1.getLdPic();
					}else {
						ldPic = new byte[in.available()];	
						in.read(ldPic);		
System.out.println("圖片上傳成功");
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}
				
//				String ldMail = req.getParameter("ldMail");
//				if(ldMail == null || (ldMail.trim().length() == 0)) {
//					errorMsgs.add("Email不可空白");
//				}
				
//				String ldPass = req.getParameter("ldPass");
//				if(ldPass == null || (ldPass.trim().length() == 0)) {
//					errorMsgs.add("密碼不可空白");
//				}
				
				String ldExpr = req.getParameter("ldExpr");
				if(ldExpr == null || (ldExpr.trim().length() == 0)) {
					errorMsgs.add("請填寫領隊經歷");
				}
				

				LdVO ldVO = new LdVO();
				ldVO.setLdNo(ldNo);
				ldVO.setLdName(ldName);
				ldVO.setLdPic(ldPic);
				ldVO.setLdExpr(ldExpr);
//				ldVO.setLdMail(ldMail);
//				ldVO.setLdPass(ldPass);
System.out.println("成功1");
				
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("ldVO", ldVO);
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/update_ld_input.jsp");
					failView.forward(req, res);
					return;
				}
				
				LdService ldSvc = new LdService();
				ldVO = ldSvc.updateLd(ldNo, ldName, ldPic, ldExpr);
System.out.	println("修改資料ldSvc.updateLd");					
				LdVO ldVO2 = new LdVO();
				ldVO2 = ldSvc.getOneLd(ldNo);
				req.setAttribute("ldVO", ldVO2);
System.out.	println("req.setAttribute修改資料成功");				
				String url = "/back-end/leader/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.add("修改失敗:"+e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/update_ld_input.jsp");
				failView.forward(req, res);
			}
		}
		
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
	
				String ldName = req.getParameter("ldName");
//System.out.println(ldName[0]);		
//System.out.println(ldName[1]);	
				String ldNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				
				if (ldName == null || ldName.trim().length() == 0) {
					errorMsgs.add("領隊姓名-不可為空白");
				} else if(!ldName.trim().matches(ldNameReg)) { 
					errorMsgs.add("領隊姓名-請輸入長度2~10的中、英文");
	            }
				


				
				byte[] ldPic = null;
				try {
					Part part = req.getPart("ldPic");
					InputStream in = part.getInputStream();
					ldPic = new byte[in.available()];	
					in.read(ldPic);		
System.out.println("圖片上傳成功");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				

				String ldExpr = req.getParameter("ldExpr");
				if(ldExpr == null || (ldExpr.trim().length() == 0)) {
					errorMsgs.add("請填寫領隊經歷");
				}
							
				LdVO ldVO = new LdVO();
				ldVO.setLdName(ldName);
				ldVO.setLdPic(ldPic);
				ldVO.setLdExpr(ldExpr);
//				ldVO.setLdMail(ldMail);
//				ldVO.setLdPass(ldPass);

				LdService ldSvc = new LdService();
				ldSvc.addLd(ldName, ldPic, ldExpr);
				
				String url = "/back-end/leader/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);		
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/addLd.jsp");
					failView.forward(req, res);
					return;
				}
				
				
			}catch(Exception e){
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/leader/addLd.jsp");
				failureView.forward(req, res);			
			}
		}
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				String str = req.getParameter("ldNo");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入領隊編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/select_page.jsp");
					failView.forward(req, res);
					return;
				}

				
			 Integer ldNo = null;
			 try {
				 ldNo = new Integer(str);
			 }catch(Exception e) {
				 errorMsgs.add("輸入格式不正確");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/select_page.jsp");
				 failView.forward(req, res);
				 return;
			 }
			 
			 
			 LdService ldSvc = new LdService();
			 LdVO ldVO = ldSvc.getOneLd(ldNo);
			 if(ldVO == null) {
				 errorMsgs.add("查無資料");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/select_page.jsp");
				 failView.forward(req, res);
				 return;
			 }
			req.setAttribute("ldVO", ldVO); 
			String url = "/back-end/leader/listOneLd.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			}catch(Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/leader/select_page.jsp");
				failView.forward(req, res);
				
			}
		}
	}

}
