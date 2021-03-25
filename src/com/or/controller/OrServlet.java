package com.or.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goods.model.GoodsService;
import com.goods.model.GoodsVO;
import com.member.model.MemberDAO;
import com.member.model.MemberVO;
import com.or.model.OrService;
import com.or.model.OrVO;

/**
 * Servlet implementation class OrServlet
 */
@WebServlet("/OrServlet")
@MultipartConfig
public class OrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if("getInsert".equals(action)){
			System.out.println("getinsert");
//			Integer gd_no = new Integer(req.getParameter("gd_no").trim());
//			Integer mem_id = new Integer(req.getParameter("mem_id").trim());
//			OrVO orVO = new OrVO();
//			orVO.setMem_id(mem_id);
//			orVO.setGd_no(gd_no);
//			req.setAttribute("orVO", orVO);
			String url = "/front-end/or/addOr.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllGoods.jsp
			successView.forward(req, res);
		}
		
		if("ship".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer or_no = new Integer(req.getParameter("or_no").trim());
				OrService orSvc2 = new OrService();
				OrVO orVO2 = orSvc2.getOneOr(or_no);
					
				String or_name = req.getParameter("or_name");
				String or_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (or_name == null || or_name.trim().length() == 0) {
					errorMsgs.add("收貨人請勿空白");
				} else if (!or_name.trim().matches(or_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收貨人: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}


				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer or_price = null;
				try {
					or_price = new Integer(req.getParameter("or_price").trim());
				} catch (NumberFormatException e) {
					or_price = 0;
					errorMsgs.add("總金額請填數字");
				}
				
				String or_phone = "";
				try {
					or_phone = new String(req.getParameter("or_phone").trim());
				} catch (NumberFormatException e) {
					or_phone = "";
					errorMsgs.add("請輸入電話");
				}
				
				String or_address = "";
				try {
					or_address = new String(req.getParameter("or_address").trim());
				} catch (NumberFormatException e) {
					or_address = "";
					errorMsgs.add("請輸入地址");
				}
				
				Integer or_status = null;
				try {
					or_status = new Integer(req.getParameter("or_status").trim());
				} catch (NumberFormatException e) {
					or_status = 0;
					errorMsgs.add("訂單狀態請填數字");
				}
				
				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}
				
				

				OrVO orVO = new OrVO();
				orVO.setOr_no(or_no);
				orVO.setMem_id(mem_id);
				orVO.setOr_name(or_name);
				orVO.setOr_price(or_price);
				orVO.setOr_phone(or_phone);
				orVO.setOr_address(or_address);
				orVO.setOr_status(or_status);
				orVO.setGd_no(gd_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orVO", orVO); // 含有輸入格式錯誤的OrVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/listAllOr2.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				OrService orSvc = new OrService();
				orVO = orSvc.updateOr(or_no, mem_id, or_name,or_price, or_phone, or_address, or_status, gd_no);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orVO", orVO); // 資料庫update成功後,正確的的OrVO物件,存入req
				String url = "/front-end/or/listAllOr2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneOr.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/listAllOr2.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("shiped".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer or_no = new Integer(req.getParameter("or_no").trim());
				OrService orSvc2 = new OrService();
				OrVO orVO2 = orSvc2.getOneOr(or_no);
				
				String or_name = req.getParameter("or_name");
				String or_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (or_name == null || or_name.trim().length() == 0) {
					errorMsgs.add("收貨人請勿空白");
				} else if (!or_name.trim().matches(or_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收貨人: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}
				
				
				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}
				
				Integer or_price = null;
				try {
					or_price = new Integer(req.getParameter("or_price").trim());
				} catch (NumberFormatException e) {
					or_price = 0;
					errorMsgs.add("總金額請填數字");
				}
				
				String or_phone = "";
				try {
					or_phone = new String(req.getParameter("or_phone").trim());
				} catch (NumberFormatException e) {
					or_phone = "";
					errorMsgs.add("請輸入電話");
				}
				
				String or_address = "";
				try {
					or_address = new String(req.getParameter("or_address").trim());
				} catch (NumberFormatException e) {
					or_address = "";
					errorMsgs.add("請輸入地址");
				}
				
				Integer or_status = null;
				try {
					or_status = new Integer(req.getParameter("or_status").trim());
				} catch (NumberFormatException e) {
					or_status = 0;
					errorMsgs.add("訂單狀態請填數字");
				}
				
				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}
				
				
				
				OrVO orVO = new OrVO();
				orVO.setOr_no(or_no);
				orVO.setMem_id(mem_id);
				orVO.setOr_name(or_name);
				orVO.setOr_price(or_price);
				orVO.setOr_phone(or_phone);
				orVO.setOr_address(or_address);
				orVO.setOr_status(or_status);
				orVO.setGd_no(gd_no);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orVO", orVO); // 含有輸入格式錯誤的OrVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/listAllOr.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/*************************** 2.開始修改資料 *****************************************/
				OrService orSvc = new OrService();
				orVO = orSvc.updateOr(or_no, mem_id, or_name,or_price, or_phone, or_address, or_status, gd_no);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orVO", orVO); // 資料庫update成功後,正確的的OrVO物件,存入req
				String url = "/front-end/or/listAllOr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneOr.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/listAllOr.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("or_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer or_no = null;
				try {
					or_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				OrService orSvc = new OrService();
				OrVO orVO = orSvc.getOneOr(or_no);
				if (orVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orVO", orVO); // 資料庫取出的OrVO物件,存入req
				String url = "/front-end/or/listOneOr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOr.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllOr.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer or_no = new Integer(req.getParameter("or_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				OrService orSvc = new OrService();
				OrVO orVO = orSvc.getOneOr(or_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("orVO", orVO); // 資料庫取出的OrVO物件,存入req
				String url = "/front-end/or/update_or_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_or_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/listAllOr.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_or_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer or_no = new Integer(req.getParameter("or_no").trim());
				OrService orSvc2 = new OrService();
				OrVO orVO2 = orSvc2.getOneOr(or_no);
					
				String or_name = req.getParameter("or_name");
				String or_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (or_name == null || or_name.trim().length() == 0) {
					errorMsgs.add("收貨人請勿空白");
				} else if (!or_name.trim().matches(or_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收貨人: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}


				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer or_price = null;
				try {
					or_price = new Integer(req.getParameter("or_price").trim());
				} catch (NumberFormatException e) {
					or_price = 0;
					errorMsgs.add("總金額請填數字");
				}
				
				String or_phone = "";
				try {
					or_phone = new String(req.getParameter("or_phone").trim());
				} catch (NumberFormatException e) {
					or_phone = "";
					errorMsgs.add("請輸入電話");
				}
				
				String or_address = "";
				try {
					or_address = new String(req.getParameter("or_address").trim());
				} catch (NumberFormatException e) {
					or_address = "";
					errorMsgs.add("請輸入地址");
				}

				Integer or_status = null;
				try {
					or_status = new Integer(req.getParameter("or_status").trim());
				} catch (NumberFormatException e) {
					or_status = 0;
					errorMsgs.add("訂單狀態請填數字");
				}
				
				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}
				
				

				OrVO orVO = new OrVO();
				orVO.setOr_no(or_no);
				orVO.setMem_id(mem_id);
				orVO.setOr_name(or_name);
				orVO.setOr_price(or_price);
				orVO.setOr_phone(or_phone);
				orVO.setOr_address(or_address);
				orVO.setOr_status(or_status);
				orVO.setGd_no(gd_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orVO", orVO); // 含有輸入格式錯誤的OrVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/update_or_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				OrService orSvc = new OrService();
				orVO = orSvc.updateOr(or_no, mem_id, or_name,or_price, or_phone, or_address, or_status, gd_no);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orVO", orVO); // 資料庫update成功後,正確的的OrVO物件,存入req
				String url = "/front-end/or/listAllOr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneOr.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/update_or_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addOr.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer or_no = new Integer(req.getParameter("or_no").trim());
				Integer gd_qty=new Integer(req.getParameter("gd_qty").trim());
				
				String or_name = req.getParameter("or_name");
				String or_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (or_name == null || or_name.trim().length() == 0) {
					errorMsgs.add("收貨人請勿空白");
				} else if (!or_name.trim().matches(or_nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("收貨人: 只能是中、英文字母、數字和_ , 且長度必需在2到30之間");
				}


				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer or_price = null;
				try {
					or_price = new Integer(req.getParameter("or_price").trim());
				} catch (NumberFormatException e) {
					or_price = 0;
					errorMsgs.add("總金額請填數字");
				}
				
				String or_phone = req.getParameter("or_phone");
				String or_phoneReg = "^09[0-9]{2}-[0-9]{6}$";
				if (or_phone == null || or_phone.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				} else if (!or_phone.trim().matches(or_phoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("電話: 只能是數字 , 範例:09xx-xxxxxx");
				}
				
				String or_address = req.getParameter("or_address");
				if (or_address == null || or_address.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}
				
				Integer or_status = null;
				try {
					or_status = new Integer(req.getParameter("or_status").trim());
				} catch (NumberFormatException e) {
					or_status = 0;
					errorMsgs.add("訂單狀態請填數字");
				}
				
				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}
				gd_qty=gd_qty-1;
				MemberVO md=new MemberDAO().findByPrimaryKey(mem_id);
				Integer traBal=md.getTraBal();
				OrVO orVO = new OrVO();
//				OrVO.setor_no(or_no);
				orVO.setMem_id(mem_id);
				orVO.setOr_name(or_name);
				orVO.setOr_price(or_price);
				orVO.setOr_phone(or_phone);
				orVO.setOr_address(or_address);
				orVO.setOr_status(or_status);
				orVO.setGd_no(gd_no);
				GoodsVO goodsVO=new GoodsVO();
				goodsVO.setGd_no(gd_no);
				goodsVO.setGd_qty(gd_qty);
				if(traBal-or_price<0) {
					errorMsgs.add("金額不足");
					req.setAttribute("orVO", orVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/addOr.jsp");
					failureView.forward(req, res);
					return;
				}
				traBal=traBal-or_price;
				MemberVO memberVO=new MemberVO();
				memberVO.setMemId(mem_id);
				memberVO.setTraBal(traBal);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orVO", orVO); 
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/addOr.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				OrService orSvc = new OrService();
				orVO = orSvc.addOr(mem_id, or_name,or_price, or_phone, or_address, or_status, gd_no,gd_qty,traBal);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/or/listAllOr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllOr.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/or/addOr.jsp");
				failureView.forward(req, res);
			}
		}

		
	}
}
