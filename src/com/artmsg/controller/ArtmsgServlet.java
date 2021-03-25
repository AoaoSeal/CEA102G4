package com.artmsg.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.art.model.ArticleService;
import com.art.model.ArticleVO;
import com.artmsg.model.ArtMsgService;
import com.artmsg.model.ArtMsgVO;

@WebServlet("/ArtmsgServlet")
public class ArtmsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArtmsgServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		if ("insert".equals(action)) {
			try {
			

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

			String artMsgText = req.getParameter("artMsgText");
			if (artMsgText == null || artMsgText.trim().length() == 0) { // null防參數錯誤，trim空字串
				errorMsgs.add("文章內容: 請勿空白");
			}
			Integer artNo = Integer.parseInt(req.getParameter("artNo"));
			Integer memId = Integer.parseInt(req.getParameter("memId"));

			ArtMsgVO artMsgVO = new ArtMsgVO();
			artMsgVO.setArtMsgText(artMsgText);
			artMsgVO.setArtNo(artNo);
			artMsgVO.setMemId(memId);

			ArticleVO artvo = new ArticleService().getOneArt(artNo);
			req.setAttribute("artVO", artvo);

			/*************************** 2.開始新增資料 ***************************************/
			ArtMsgService artSvc = new ArtMsgService();
			artMsgVO = artSvc.add(memId, artNo, artMsgText);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = request.getRequestDispatcher("/front_end/article/viewOneArtPage.jsp");
//				failureView.forward(request, response);
			}

		}
		if ("getAllMsg".equals(action)) {

			ArtMsgService artSvc = new ArtMsgService();
			List<ArtMsgVO> list = new ArrayList<ArtMsgVO>();
			list = artSvc.getAll();
			res.setCharacterEncoding("UTF-8");
			
			PrintWriter out = res.getWriter();

			String jsonStr = new JSONArray(list).toString();
			out.println(jsonStr);

		}
		if ("getMsgByArtNo".equals(action)) {
			Integer artNo = Integer.parseInt(req.getParameter("artNo"));
			
			
			ArtMsgService artSvc = new ArtMsgService();
			List<ArtMsgVO> list = new ArrayList<ArtMsgVO>();
			
			list = artSvc.getMsgByArtNo(artNo);
			
			res.setCharacterEncoding("UTF-8");
			
			PrintWriter out = res.getWriter();
			
			String jsonStr = new JSONArray(list).toString();
			out.println(jsonStr);
			
		}
//		if ("update".equals(action)) {

		

//			try {
//				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//
//				String artMsgText = req.getParameter("artMsgText");
//				if (artMsgText == null || artMsgText.trim().length() == 0) { // null防參數錯誤，trim空字串
//					errorMsgs.add("文章內容: 請勿空白");
//				}
//				Integer artMsgNo = Integer.parseInt(req.getParameter("artMsgNo"));
//				Integer artNo = Integer.parseInt(req.getParameter("artNo"));
//				Integer memId = Integer.parseInt(req.getParameter("memId"));
//
//				ArtMsgVO artMsgVO = new ArtMsgVO();
//				artMsgVO.setArtMsgNo(artMsgNo);
//				artMsgVO.setMemId(memId);
//				artMsgVO.setArtNo(artNo);
//				artMsgVO.setArtMsgText(artMsgText);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("artMsgVO", artMsgVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/viewOnePage.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//
//				/*************************** 2.開始新增資料 ***************************************/
//				ArtMsgService artSvc = new ArtMsgService();
//				artMsgVO = artSvc.update(artMsgNo, artMsgText);
//
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/front-end/article/viewOnePage.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/viewOnePage.jsp");
//				failureView.forward(req, res);
//			}

//			if ("getAllMsg".equals(action)) {
//				ArtMsgService artSvc = new ArtMsgService();	
//				List<ArtMsgVO> list = new ArrayList<ArtMsgVO>();
//				list = artSvc.getAll();
//			
//				req.setAttribute("list", list);
//				

//				String url = location;
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
//				session.removeAttribute("location");
//			}

//		}

	}

}
