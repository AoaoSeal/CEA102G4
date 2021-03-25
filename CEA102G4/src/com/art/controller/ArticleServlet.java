package com.art.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONArray;

import com.art.model.ArticleService;
import com.art.model.ArticleVO;
import com.artc.model.ArtcService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArticleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
		if ("getOneArt".equals(action)) { //

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer artNo = new Integer(req.getParameter("artNo"));
			
				/*************************** 2.開始查詢資料 *****************************************/
				ArticleService artSvc = new ArticleService();
				ArticleVO artVO = artSvc.getOneArticle(artNo);
				if (artVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/listAllArt.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("artVO", artVO); // 資料庫取出的empVO物件,存入req
			
				
				String url = "/front-end/article/viewOneArtPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/listAllArt.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllArt.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
	
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer artNo = new Integer(req.getParameter("artNo"));
				
				/***************************2.開始查詢資料****************************************/
				ArticleService artSvc = new ArticleService();
				ArticleVO artVO = artSvc.getOneArt(artNo);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
								
				req.setAttribute("artVO", artVO);         // 資料庫取出的empVO物件,存入req
				String url = "/front-end/article/update_art_input.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_artInput.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/listAllArt.jsp");
				failureView.forward(req, res);
			}
		}
		

		if ("Update".equals(action)) {
			String location = req.getParameter("location");
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
		
			Integer artNo = new Integer(req.getParameter("artNo").trim());

			Integer artcNo = new Integer(req.getParameter("artcNo").trim());
		

			String artTitle = req.getParameter("artTitle");

			if (artTitle == null || artTitle.trim().length() == 0) { // null防參數錯誤，trim空字串
				errorMsgs.add("標題: 請勿空白");
			}
			String artText = req.getParameter("artText");
			if (artText == null || artText.trim().length() == 0) { // null防參數錯誤，trim空字串
				errorMsgs.add("文章內容: 請勿空白");
			}
			
			byte[] artPic = null;
			Part part = req.getPart("artPic");
			InputStream is = part.getInputStream();
			artPic = new byte [is.available()];
			is.read(artPic);
			is.close();
			
		


			ArticleVO artVO = new ArticleVO();
			artVO.setArtNo(artNo);
			artVO.setArtcNo(artcNo);
			artVO.setArtTitle(artTitle);
			artVO.setArtText(artText);
			artVO.setArtPic(artPic);
			

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("artVO", artVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher(location);
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			ArticleService artSvc = new ArticleService();
			artVO = artSvc.update(artcNo, artTitle, artText, artPic, artNo);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/front-end/article/listAllArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(location);
				failureView.forward(req, res);
			}
		}
		
		
			if ("insert".equals(action)) {

				List<String> errorMsgs = new LinkedList<String>();

				req.setAttribute("errorMsgs", errorMsgs);

				try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				
				Integer artcNo = new Integer(req.getParameter("artcNo").trim());
				if (artcNo == null) {
					errorMsgs.add("請填選文章分類");
				}
				Integer memId = new Integer(req.getParameter("memId").trim());

				String artTitle = req.getParameter("artTitle");

				if (artTitle == null || artTitle.trim().length() == 0) { // null防參數錯誤，trim空字串
					errorMsgs.add("標題: 請勿空白");
				}
				String artText = req.getParameter("artText");
				if (artText == null || artText.trim().length() == 0) { // null防參數錯誤，trim空字串
					errorMsgs.add("文章內容: 請勿空白");
				}
				
				byte[] artPic = null;
				Part part = req.getPart("artPic");
				InputStream is = part.getInputStream();
				artPic = new byte [is.available()];
				is.read(artPic);
				is.close();
	
				Integer artCount = new Integer(req.getParameter("artCount").trim());
		
				Integer artStatus = new Integer(req.getParameter("artStatus").trim());
		System.out.println("qqq"+artStatus);
				ArticleVO artVO = new ArticleVO();
				artVO.setArtcNo(artcNo);
				artVO.setMemId(memId);
				artVO.setArtTitle(artTitle);
				artVO.setArtText(artText);
				artVO.setArtPic(artPic);
				artVO.setArtCount(artCount);
				artVO.setArtStatus(artStatus);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ArticleVO", artVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/addArt.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
		
		
				ArticleService artSvc = new ArticleService();
				artVO = artSvc.add(artcNo, memId, artTitle, artText, artPic, artCount, artStatus);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/article/listAllArt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

//				/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/addArt.jsp");
					failureView.forward(req, res);
				}
			}
		
		if ("updateStatus".equals(action)) {
				Integer artStatus = new Integer(req.getParameter("artStatus").trim());
				Integer artNo = new Integer(req.getParameter("artNo").trim());
			 
				ArticleService artSvc = new ArticleService();
				artSvc.updateStatus(artStatus, artNo);
				String url = "/back-end/article/select_art.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				
			}
		if("finkByTitle".equals(action)) {
			String artTitle = new String(req.getParameter("artTitle"));
			ArticleService artSvc = new ArticleService();
		
			List<ArticleVO> ListArticle = new ArrayList<>();
			ListArticle = artSvc.finkByTitle(artTitle);
			req.setAttribute("ListArticle", ListArticle);
			
			List<String> errorMsgs = new LinkedList<String>();
			if(ListArticle.isEmpty()) {
				errorMsgs.add("查無此文章");
			}
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			String url = "/front-end/article/listAllArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
			}
		if("getArtByArtc".equals(action)){
			List<String>erroeMsgs = new LinkedList<String>();
			req.setAttribute("erroeMsgs", erroeMsgs);
			
			/*******************�ШD�Ѽ�*******************/
			Integer artcNo = new Integer(req.getParameter("artcNo"));
			/*******************�d�߸��*******************/
			ArtcService artcsvc = new ArtcService();
			List<ArticleVO> list = artcsvc.getArtByArtc(artcNo);
			/*******************�d�����********************/
			req.setAttribute("listc", list);
			
			
			String url = "/front-end/article/listAllArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			
			
		}
		if("delete".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
				Integer artNo	= new Integer(req.getParameter("artNo"));
				
				ArticleService artSvc = new ArticleService();
				artSvc.deleteArt(artNo);
				
				String url = "/front-end/article/listAllArt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				}catch(Exception e){
					errorMsgs.add("刪除資料錯誤:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/listAllArt.jsp");
					failureView.forward(req, res);
				}
				
			}
		

	}
}
