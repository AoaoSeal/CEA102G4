package com.grep.controller;

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

import com.grep.model.GrepService;
import com.grep.model.GrepVO;

/**
 * Servlet implementation class GrepServlet
 */
@WebServlet("/GrepServlet")
@MultipartConfig
public class GrepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("getInsertGrep".equals(action)){
			String url = "/front-end/grep/addGrep.jsp";
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
				String str = req.getParameter("grep_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入檢舉商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer grep_no = null;
				try {
					grep_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				GrepService grepSvc = new GrepService();
				GrepVO grepVO = grepSvc.getOneGrep(grep_no);
				if (grepVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("grepVO", grepVO); // 資料庫取出的grepVO物件,存入req
				String url = "/front-end/grep/listOneGrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneGrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllGrep.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer grep_no = new Integer(req.getParameter("grep_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				GrepService grepSvc = new GrepService();
				GrepVO grepVO = grepSvc.getOneGrep(grep_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("grepVO", grepVO); // 資料庫取出的grepVO物件,存入req
				String url = "/back-end/grep/update_grep_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Grep_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/grep/update_grep_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update1".equals(action)) { // 來自listAllGrep.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer grep_no = new Integer(req.getParameter("grep_no"));
				
				/*************************** 2.開始查詢資料 ****************************************/
				GrepService grepSvc = new GrepService();
				GrepVO grepVO = grepSvc.getOneGrep(grep_no);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("grepVO", grepVO); // 資料庫取出的grepVO物件,存入req
				String url = "/front-end/grep/update_grep_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Grep_input.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/update_grep_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_Grep_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer grep_no = new Integer(req.getParameter("grep_no").trim());
				GrepService grepSvc2 = new GrepService();
				GrepVO grepVO2 = grepSvc2.getOneGrep(grep_no);
					

				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}




				String grep_text = req.getParameter("grep_text").trim();
				


				
				Integer grep_status = null;
				try {
					grep_status = new Integer(req.getParameter("grep_status").trim());
				} catch (NumberFormatException e) {
					grep_status = 0;
					errorMsgs.add("檢舉狀態請填數字");
				}
				
				
				

				GrepVO grepVO = new GrepVO();
				grepVO.setGrep_no(grep_no);
				grepVO.setGd_no(gd_no);
				grepVO.setMem_id(mem_id);
				grepVO.setGrep_text(grep_text);
				grepVO.setGrep_status(grep_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("grepVO", grepVO); // 含有輸入格式錯誤的grepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/grep/listAllGrep.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				GrepService grepSvc = new GrepService();
				grepVO = grepSvc.updateGrep(grep_no, gd_no, mem_id, grep_text, grep_status);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("grepVO", grepVO); // 資料庫update成功後,正確的的grepVO物件,存入req
				String url = "/back-end/grep/listAllGrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneGrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/grep/listAllGrep.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update1".equals(action)) { // 來自update_Grep_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer grep_no = new Integer(req.getParameter("grep_no").trim());
				GrepService grepSvc2 = new GrepService();
				GrepVO grepVO2 = grepSvc2.getOneGrep(grep_no);
				
				
				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}
				
				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}
				
				
				
				
				String grep_text = req.getParameter("grep_text").trim();
				
				
				
				
				Integer grep_status = null;
				try {
					grep_status = new Integer(req.getParameter("grep_status").trim());
				} catch (NumberFormatException e) {
					grep_status = 0;
					errorMsgs.add("檢舉狀態請填數字");
				}
				
				
				
				
				GrepVO grepVO = new GrepVO();
				grepVO.setGrep_no(grep_no);
				grepVO.setGd_no(gd_no);
				grepVO.setMem_id(mem_id);
				grepVO.setGrep_text(grep_text);
				grepVO.setGrep_status(grep_status);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("grepVO", grepVO); // 含有輸入格式錯誤的grepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/listAllGrep.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/*************************** 2.開始修改資料 *****************************************/
				GrepService grepSvc = new GrepService();
				grepVO = grepSvc.updateGrep(grep_no, gd_no, mem_id, grep_text, grep_status);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("grepVO", grepVO); // 資料庫update成功後,正確的的grepVO物件,存入req
				String url = "/front-end/grep/listAllGrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneGrep.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/listAllGrep.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addGrep.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer grep_no = new Integer(req.getParameter("grep_no").trim());

				Integer gd_no = null;
				try {
					gd_no = new Integer(req.getParameter("gd_no").trim());
				} catch (NumberFormatException e) {
					gd_no = 0;
					errorMsgs.add("商品編號請填數字");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}




				String grep_text = req.getParameter("grep_text").trim();
				if (grep_text == null || grep_text.trim().length() == 0) {
					errorMsgs.add("檢舉事由請勿空白");
				}

				
				Integer grep_status = null;
				try {
					grep_status = new Integer(req.getParameter("grep_status").trim());
				} catch (NumberFormatException e) {
					grep_status = 0;
					errorMsgs.add("檢舉狀態請填數字");
				}

				GrepVO grepVO = new GrepVO();
//				grepVO.setGrep_no(grep_no);
				grepVO.setGd_no(gd_no);
				grepVO.setMem_id(mem_id);
				grepVO.setGrep_text(grep_text);
				grepVO.setGrep_status(grep_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("grepVO", grepVO); // 含有輸入格式錯誤的grepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/addGrep.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				GrepService grepSvc = new GrepService();
				grepVO = grepSvc.addGrep(gd_no, mem_id,grep_text, grep_status);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/grep/listAllGrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllGrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/addGrep.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllGrep.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer grep_no = new Integer(req.getParameter("grep_no"));

				/*************************** 2.開始刪除資料 ***************************************/
				GrepService grepSvc = new GrepService();
				grepSvc.deleteGrep(grep_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/grep/listAllGrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/grep/listAllGrep.jsp");
				failureView.forward(req, res);
			}
			
		}
		
	}
}
