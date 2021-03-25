package com.itinerary_category.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itinerary.model.ItVO;
import com.itinerary_category.model.ItcDAO;
import com.itinerary_category.model.ItcService;
import com.itinerary_category.model.ItcVO;


public class ItcServlet extends HttpServlet {
	
       
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {		
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("listIts_ByItcno".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				Integer itcNo = new Integer(req.getParameter("itcNo"));
				ItcService itcSvc = new ItcService();
				Set<ItVO> set = itcSvc.getItsByItcno(itcNo);
				req.setAttribute("listIts_ByItcno", set);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary_category/listAllItc.jsp");
				successView.forward(req, res);
			}catch(Exception e) {
				throw new ServletException(e);
			}
			
		}
		
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String itcName = req.getParameter("itcName");
				String itcNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (itcName == null || itcName.trim().length() == 0) {
					errorMsgs.add("種類名稱-不可為空白");
				} else if(!itcName.trim().matches(itcNameReg)) { 
					errorMsgs.add("種類名稱-請輸入長度2~10的中、英文、數字或底線_");
	            }
				
				ItcVO itcVO = new ItcVO();
				itcVO.setItcName(itcName);	
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("itcVO", itcVO); 
					RequestDispatcher failView = req
							.getRequestDispatcher("/back-end/itinerary_category/addItc.jsp");
					failView.forward(req, res);
					return;
				}
				
				ItcService itcSvc = new ItcService();
				itcVO = itcSvc.addItc(itcName);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary_category/listAllItc.jsp"); 
				successView.forward(req, res);	
				
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/back-end/itinerary_category/addItc.jsp");
				failView.forward(req, res);
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//String requestURL = req.getParameter("requestURL");
//System.out.println("getOne_For_Update"+requestURL);	
			try {			
				Integer itcNo = new Integer(req.getParameter("itcNo"));
				
//				ItcService itcSvc = new ItcService();
//				ItcVO itcVO = itcSvc.getOneItc(itcNo);
				
				ItcDAO dao = new ItcDAO();
				ItcVO itcVO = dao.findByPrimaryKey(itcNo);
				
				req.setAttribute("itcVO", itcVO); 
				
				//Bootstrap_modal
				boolean openModal=true;
				req.setAttribute("openModal",openModal );
				
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary_category/listAllItc.jsp"); 
				successView.forward(req, res);
				return;
				
			}catch(Exception e) {
				errorMsgs.add("資料取出時失敗:"+e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/back-end/itinerary_category/listAllItc.jsp");
				failView.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//String requestURL = req.getParameter("requestURL");
//System.out.println("update"+requestURL);			
			
			try {
				Integer itcNo = new Integer(req.getParameter("itcNo").trim());
				
				String itcName = req.getParameter("itcName");
				String itcNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (itcName == null || itcName.trim().length() == 0) {
					errorMsgs.add("種類名稱-不可為空白");
				} else if(!itcName.trim().matches(itcNameReg)) { 
					errorMsgs.add("種類名稱-請輸入長度2~10的中、英文、數字或底線_");
	            }
				
				ItcVO itcVO = new ItcVO();
				itcVO.setItcNo(itcNo);
				itcVO.setItcName(itcName);								


				if (!errorMsgs.isEmpty()) {
					req.setAttribute("itcVO", itcVO); 
					RequestDispatcher failView = req
							.getRequestDispatcher("/back-end/itinerary_category/update_itc_input.jsp");
					failView.forward(req, res);
					return; 
				}
				
				ItcService itcSvc = new ItcService();
				itcVO = itcSvc.updateItc(itcNo, itcName);				
				req.setAttribute("itcVO", itcVO); 			
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary_category/listAllItc.jsp");
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/back-end/itinerary_category/update_itc_input.jsp");
				failView.forward(req, res);
			}
		}
		
		
		
		
	}
}
