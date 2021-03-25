package com.art.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.art.model.ArticleService;

/**
 * Servlet implementation class ArticleBack
 */
@WebServlet("/ArticleBack")
public class ArticleBack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleBack() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("updateStatus".equals(action)) {
			Integer artStatus = new Integer(req.getParameter("artStatus").trim());
			Integer artNo = new Integer(req.getParameter("artNo").trim());

			ArticleService artSvc = new ArticleService();
			artSvc.updateStatus(artStatus, artNo);
			String url = "/back-end/article/select_art.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		if ("updateStatusFront".equals(action)) {
			Integer artStatus = new Integer(req.getParameter("artStatus").trim());
			Integer artNo = new Integer(req.getParameter("artNo").trim());

			ArticleService artSvc = new ArticleService();
			artSvc.updateStatus(artStatus, artNo);
			String url = "/front-end/article/listAllArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
	}

}
