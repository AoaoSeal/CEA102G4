package com.tra.controller;

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
import javax.servlet.http.Part;

import com.member.model.MemberDAO;
import com.member.model.MemberVO;
import com.tra.model.TraService;
import com.tra.model.TraVO;

/**
 * Servlet implementation class TraServlet
 */
@WebServlet("/TraServlet")
@MultipartConfig
public class TraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("pay".equals(action)){
			String url = "/front-end/tra/listAllTra2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllGoods.jsp
			successView.forward(req, res);
		}
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("tra_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入交易編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer tra_no = null;
				try {
					tra_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				TraService traSvc = new TraService();
				TraVO traVO = traSvc.getOneTra(tra_no);
				if (traVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("traVO", traVO); // 資料庫取出的traVO物件,存入req
				String url = "/back-end/tra/listOneTra.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneTra.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllTra.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer tra_no = new Integer(req.getParameter("tra_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				TraService traSvc = new TraService();
				TraVO traVO = traSvc.getOneTra(tra_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("traVO", traVO); // 資料庫取出的traVO物件,存入req
				String url = "/back-end/tra/update_tra_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Tra_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/listAllTra.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_Tra_input.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer tra_no = new Integer(req.getParameter("tra_no").trim());
					

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer tra_price = null;
				try {
					tra_price = new Integer(req.getParameter("tra_price").trim());
				} catch (NumberFormatException e) {
					tra_price = 0;
					errorMsgs.add("交易金額請填數字");
				}


				
				Integer tra_status = null;
				try {
					tra_status = new Integer(req.getParameter("tra_status").trim());
				} catch (NumberFormatException e) {
					tra_status = 0;
					errorMsgs.add("交易狀態請填數字");
				}
				
				Integer tra_action = null;
				try {
					tra_action = new Integer(req.getParameter("tra_action").trim());
				} catch (NumberFormatException e) {
					tra_action = 0;
					errorMsgs.add("交易行為請填數字");
				}
				
				

				TraVO traVO = new TraVO();
				traVO.setTra_no(tra_no);
				traVO.setMem_id(mem_id);
				traVO.setTra_action(tra_action);
				MemberVO memVO = new MemberVO();
				MemberVO md=new MemberDAO().findByPrimaryKey(mem_id);
				Integer tra=md.getTraBal();
				if(tra_status==1) {
					if(tra_action==0) {
						tra=tra-tra_price;
					}else if(tra_action==1) {
						
						tra=tra+tra_price;
					}
				}
				memVO.setMemId(mem_id);
				memVO.setTraBal(tra);
				traVO.setTra_price(tra_price);
				traVO.setTra_status(tra_status);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("traVO", traVO); // 含有輸入格式錯誤的traVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/update_tra_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				TraService traSvc = new TraService();
				traVO = traSvc.updateTra( tra_no,  mem_id, tra_action, tra_price,
						 tra_status,tra);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("traVO", traVO); // 資料庫update成功後,正確的的traVO物件,存入req
				String url = "/back-end/tra/listAllTra.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneTra.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/tra/update_tra_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("save".equals(action)) { // 來自addTra.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer tra_no = new Integer(req.getParameter("tra_no").trim());
				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}

				Integer tra_price = null;
				try {
					tra_price = new Integer(req.getParameter("tra_price").trim());
				} catch (NumberFormatException e) {
					tra_price = 0;
					errorMsgs.add("交易金額請填數字");
				}

				Integer tra_status = null;
				
					tra_status = new Integer(req.getParameter("tra_status").trim());
				
				Integer tra_action = null;
				try {
					tra_action = new Integer(req.getParameter("tra_action").trim());
				} catch (NumberFormatException e) {
					tra_action = 0;
					errorMsgs.add("交易行為請填數字");
				}

				
				TraVO traVO = new TraVO();
//				traVO.setTra_no(tra_no);
				traVO.setMem_id(mem_id);
				traVO.setTra_action(tra_action);
				MemberVO memVO = new MemberVO();
				MemberVO md=new MemberDAO().findByPrimaryKey(mem_id);
				Integer tra=md.getTraBal();
						tra=tra+tra_price;
				memVO.setMemId(mem_id);
				memVO.setTraBal(tra);
				traVO.setTra_price(tra_price);
				traVO.setTra_status(tra_status);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("traVO", traVO); // 含有輸入格式錯誤的traVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/tra/addTra.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				TraService traSvc = new TraService();
				traVO = traSvc.addTra2(mem_id, tra_price ,tra_status,tra_action,tra);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/front-end/tra/listAllTra2.jsp";
				String url = "/front-end/tra/listAllTra2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllTra.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/tra/addTra.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("pick".equals(action)) { // 來自addTra.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer tra_no = new Integer(req.getParameter("tra_no").trim());
				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}
				
				Integer tra_price = null;
				try {
					tra_price = new Integer(req.getParameter("tra_price").trim());
				} catch (NumberFormatException e) {
					tra_price = 0;
					errorMsgs.add("交易金額請填數字");
				}
				
				Integer tra_status = null;
				
				tra_status = new Integer(req.getParameter("tra_status").trim());
				
				Integer tra_action = null;
				try {
					tra_action = new Integer(req.getParameter("tra_action").trim());
				} catch (NumberFormatException e) {
					tra_action = 0;
					errorMsgs.add("交易行為請填數字");
				}
				
				
				TraVO traVO = new TraVO();
//				traVO.setTra_no(tra_no);
				traVO.setMem_id(mem_id);
				traVO.setTra_action(tra_action);
				traVO.setTra_price(tra_price);
				traVO.setTra_status(tra_status);
				
				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("traVO", traVO); // 含有輸入格式錯誤的traVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/tra/addTra2.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*************************** 2.開始新增資料 ***************************************/
				TraService traSvc = new TraService();
				traVO = traSvc.addTra(mem_id, tra_price ,tra_status,tra_action);
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/tra/listAllTra2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllTra.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/tra/addTra2.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
