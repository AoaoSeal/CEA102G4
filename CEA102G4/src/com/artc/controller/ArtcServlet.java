package com.artc.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.art.model.ArticleVO;
import com.artc.model.ArtcService;
import com.artc.model.ArtcVO;

/**
 * Servlet implementation class ArtcServlet
 */
@WebServlet("/ArtcServlet")
public class ArtcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		
		String action = req.getParameter("action");
		
		if("getArtByArtc".equals(action)){
			
			List<String>erroeMsgs = new LinkedList<String>();
			req.setAttribute("erroeMsgs", erroeMsgs);
			
			/*******************�ШD�Ѽ�*******************/
			Integer artcNo = new Integer(req.getParameter("artcNo"));
			/*******************�d�߸��*******************/
			ArtcService artcsvc = new ArtcService();
			List<ArticleVO> list = artcsvc.getArtByArtc(artcNo);
			/*******************�d�����********************/
			req.setAttribute("list", list);
			
		
			
			String url = "/front-end/article/listAllArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			
			
		}
		
	}

}
