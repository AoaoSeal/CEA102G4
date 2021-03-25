package com.message.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemberService;
import com.member.model.MemberVO;

public class MessageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer memId = new Integer(req.getParameter("memId"));
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMem(memId);

				boolean openmember = true;
				boolean openModal = false;
				boolean openupdate = true;
				String memberFunction = "修改會員資料";

				req.setAttribute("memberFunction", memberFunction);
				req.setAttribute("openupdate", openupdate);
				req.setAttribute("openmember", openmember);
				req.setAttribute("openModal", openModal);

				req.setAttribute("memberVO", memberVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/front_end_index.jsp");

				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/member/listAllMem.jsp");
				failureView.forward(req, res);
			}

		}
	}

}
