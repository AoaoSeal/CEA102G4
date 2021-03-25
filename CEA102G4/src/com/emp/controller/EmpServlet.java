package com.emp.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.model.EmpService;
import com.emp.model.EmpVO;


public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
				
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("emp_Login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			try {
				String empEmail = req.getParameter("empEmail");
				EmpService empSvc = new EmpService();
				EmpVO empVO = empSvc.getOneLdByMail(empEmail);
				
				if (empEmail == null || empEmail.trim().length() == 0 || empVO == null) {
					errorMsgs.add("電子信箱或密碼錯誤");
				}
				
				String empPass = req.getParameter("empPass");
				if (empPass == null || empPass.trim().length() == 0) {
					errorMsgs.add("密碼錯誤");
				}
				

				if (empVO != null) {
					String empVopass = empVO.getEmpPass();
					if (!empPass.equals(empVopass)) {
						errorMsgs.add("電子信箱或密碼錯誤");
					}
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/back/emp/emp_login.jsp");
					failView.forward(req, res);
					return;
				}
				req.getSession().setAttribute("empVO", empVO);
				String url =req.getContextPath()+ "/back-end/back_end_index.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				res.sendRedirect(url);
				
			}catch(Exception e) {
				errorMsgs.add("電子信箱或密碼錯誤:"+ e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back/emp/emp_login.jsp");
				failView.forward(req, res);
				
			}
		}
		
	}
}
