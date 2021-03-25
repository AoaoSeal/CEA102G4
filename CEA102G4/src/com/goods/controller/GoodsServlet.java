package com.goods.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.goods.model.GoodsService;
import com.goods.model.GoodsVO;
import com.member.model.MemberVO;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/GoodsServlet")
@MultipartConfig
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("findGoods".equals(action)) {
			Integer gd_no = new Integer(req.getParameter("gd_no"));
			GoodsService goodsSvc = new GoodsService();
			GoodsVO goodsVO = goodsSvc.getOneGoods(gd_no);
			req.setAttribute("goodsVO", goodsVO); // 資料庫取出的goodsVO物件,存入req
			String url = "/front-end/goods/listOneGoods2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneGoods.jsp
			successView.forward(req, res);
		}
		

		if("getOne_For_Show".equals(action)) {
			Integer gd_no = new Integer(req.getParameter("gd_no"));
			GoodsService goodsSvc = new GoodsService();
			GoodsVO goodsVO = goodsSvc.getOneGoods(gd_no);
			req.setAttribute("goodsVO", goodsVO); // 資料庫取出的goodsVO物件,存入req
			String url = "/front-end/goods/listOneGoods2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneGoods.jsp
			successView.forward(req, res);
		}
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("gd_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer gd_no = null;
				try {
					gd_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodsVO = goodsSvc.getOneGoods(gd_no);
				if (goodsVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("goodsVO", goodsVO); // 資料庫取出的goodsVO物件,存入req
				String url = "/front-end/goods/listOneGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneGoods.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllGoods.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer gd_no = new Integer(req.getParameter("gd_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				GoodsService goodsSvc = new GoodsService();
				GoodsVO goodsVO = goodsSvc.getOneGoods(gd_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("goodsVO", goodsVO); // 資料庫取出的goodsVO物件,存入req
				String url = "/front-end/goods/update_goods_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Goods_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/listAllGoods.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_Goods_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer gd_no = new Integer(req.getParameter("gd_no").trim());
				GoodsService goodsSvc2 = new GoodsService();
				GoodsVO goodsVO2 = goodsSvc2.getOneGoods(gd_no);
					
				String gd_name = req.getParameter("gd_name");
				String gd_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (gd_name == null || gd_name.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				} else if (!gd_name.trim().matches(gd_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}

				Integer gc_no = null;
				try {
					gc_no = new Integer(req.getParameter("gc_no").trim());
				} catch (NumberFormatException e) {
					gc_no = 0;
					errorMsgs.add("商品類別請填數字");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer gd_price = null;
				try {
					gd_price = new Integer(req.getParameter("gd_price").trim());
				} catch (NumberFormatException e) {
					gd_price = 0;
					errorMsgs.add("商品價格請填數字");
				}


				Integer gd_qty = null;
				try {
					gd_qty = new Integer(req.getParameter("gd_qty").trim());
				} catch (NumberFormatException e) {
					gd_qty = 0;
					errorMsgs.add("商品數量請填數字");
				}

				String gd_text = req.getParameter("gd_text").trim();
				
				String gd_mediumblob = "";
				Part part = req.getPart("gd_mediumblob");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					gd_mediumblob = goodsVO2.getGd_mediumblob();

				} else if (in.available() >= 3000000) {
					gd_mediumblob = goodsVO2.getGd_mediumblob();
					errorMsgs.add("圖片超過大小");
				} else {
					byte[] pic = new byte[in.available()];

					in.read(pic);
					in.close();
					gd_mediumblob = Base64.getEncoder().encodeToString(pic);
				}



				
				Integer gd_status = null;
				try {
					gd_status = new Integer(req.getParameter("gd_status").trim());
				} catch (NumberFormatException e) {
					gd_status = 0;
					errorMsgs.add("商品狀態請填數字");
				}
				
				Integer gd_shelf = null;
				try {
					gd_shelf = new Integer(req.getParameter("gd_shelf").trim());
				} catch (NumberFormatException e) {
					gd_shelf = 0;
					errorMsgs.add("商品上架請填數字");
				}
				
				

				GoodsVO goodsVO = new GoodsVO();
				goodsVO.setGd_no(gd_no);
				goodsVO.setGc_no(gc_no);
				goodsVO.setMem_id(mem_id);
				goodsVO.setGd_name(gd_name);
				goodsVO.setGd_price(gd_price);
				goodsVO.setGd_qty(gd_qty);
				goodsVO.setGd_text(gd_text);
				goodsVO.setGd_mediumblob(gd_mediumblob);
				goodsVO.setGd_status(gd_status);
				goodsVO.setGd_shelf(gd_shelf);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("goodsVO", goodsVO); // 含有輸入格式錯誤的goodsVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/update_goods_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				GoodsService goodsSvc = new GoodsService();
				goodsVO = goodsSvc.updateGoods(gd_no, gc_no, mem_id, gd_name,gd_price, gd_qty, gd_text, gd_mediumblob, gd_status, gd_shelf);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("goodsVO", goodsVO); // 資料庫update成功後,正確的的goodsVO物件,存入req
				String url = "/front-end/goods/listAllGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneGoods.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/update_goods_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addGoods.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer gd_no = new Integer(req.getParameter("gd_no").trim());
				
				String gd_name = req.getParameter("gd_name");
				String gd_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (gd_name == null || gd_name.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				} else if (!gd_name.trim().matches(gd_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}

				Integer gc_no = null;
				try {
					gc_no = new Integer(req.getParameter("gc_no").trim());
				} catch (NumberFormatException e) {
					gc_no = 0;
					errorMsgs.add("商品類別請選擇");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer gd_price = null;
				try {
					gd_price = new Integer(req.getParameter("gd_price").trim());
				} catch (NumberFormatException e) {
					gd_price = 0;
					errorMsgs.add("商品價格請填數字");
				}


				Integer gd_qty = null;
				try {
					gd_qty = new Integer(req.getParameter("gd_qty").trim());
				} catch (NumberFormatException e) {
					gd_qty = 0;
					errorMsgs.add("商品數量請填數字");
				}

				String gd_text = req.getParameter("gd_text").trim();
				if (gd_text == null || gd_text.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				}

				String gd_mediumblob = "";
				Part part = req.getPart("gd_mediumblob");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					gd_mediumblob = "";

				} else if (in.available() >= 3000000) {
					errorMsgs.add("圖片超過大小");
				} else {
					byte[] pic = new byte[in.available()];

					in.read(pic);
					in.close();
					gd_mediumblob = Base64.getEncoder().encodeToString(pic);
				}
				
				Integer gd_status = null;
				try {
					gd_status = new Integer(req.getParameter("gd_status").trim());
				} catch (NumberFormatException e) {
					gd_qty = 0;
					errorMsgs.add("商品狀態請填數字");
				}
				
				Integer gd_shelf = null;
				try {
					gd_shelf = new Integer(req.getParameter("gd_shelf").trim());
				} catch (NumberFormatException e) {
					gd_shelf = 0;
					errorMsgs.add("商品上架請填數字");
				}

				GoodsVO goodsVO = new GoodsVO();
//				goodsVO.setGd_no(gd_no);
				goodsVO.setGc_no(gc_no);
				goodsVO.setMem_id(mem_id);
				goodsVO.setGd_name(gd_name);
				goodsVO.setGd_price(gd_price);
				goodsVO.setGd_qty(gd_qty);
				goodsVO.setGd_text(gd_text);
				goodsVO.setGd_mediumblob(gd_mediumblob);
				goodsVO.setGd_status(gd_status);
				goodsVO.setGd_shelf(gd_shelf);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("goodsVO", goodsVO); // 含有輸入格式錯誤的goodsVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/addGoods.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				GoodsService goodsSvc = new GoodsService();
				goodsVO = goodsSvc.addGoods(gc_no, mem_id, gd_name,gd_price, gd_qty, gd_text, gd_mediumblob, gd_status, gd_shelf);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/goods/listAllGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllGoods.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/addGoods.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllGoods.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer gd_no = new Integer(req.getParameter("gd_no"));

				/*************************** 2.開始刪除資料 ***************************************/
				GoodsService goodsSvc = new GoodsService();
				goodsSvc.deleteGoods(gd_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/goods/listAllGoods.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/goods/listAllGoods.jsp");
				failureView.forward(req, res);
			}
		}
		if ("listGoods_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.開始複合查詢***************************************/
				GoodsService goodsSvc = new GoodsService();
				List<GoodsVO> list  = goodsSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("listGoods_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/goods/listGoods_ByCompositeQuery.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/goods/select_page.jsp");
				failureView.forward(req, res);
			}
		}	
	}
}
