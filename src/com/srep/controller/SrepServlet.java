package com.srep.controller;

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

import com.srep.model.SrepService;
import com.srep.model.SrepVO;

/**
 * Servlet implementation class SrepServlet
 */
@WebServlet("/SrepServlet")
@MultipartConfig
public class SrepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if("findGoodsSrep".equals(action)){
			String url = "/front-end/srep/addSrep.jsp";
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
				String str = req.getParameter("srep_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer srep_no = null;
				try {
					srep_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SrepService srepSvc = new SrepService();
				SrepVO srepVO = srepSvc.getOneSrep(srep_no);
				if (srepVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("srepVO", srepVO); // 資料庫取出的srepVO物件,存入req
				String url = "/front-end/srep/listOneSrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneSrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllSrep.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer srep_no = new Integer(req.getParameter("srep_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				SrepService srepSvc = new SrepService();
				SrepVO srepVO = srepSvc.getOneSrep(srep_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("srepVO", srepVO); // 資料庫取出的srepVO物件,存入req
				String url = "/back-end/srep/update_srep_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Srep_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/listAllSrep.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Updatef".equals(action)) { // 來自listAllSrep.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer srep_no = new Integer(req.getParameter("srep_no"));
				
				/*************************** 2.開始查詢資料 ****************************************/
				SrepService srepSvc = new SrepService();
				SrepVO srepVO = srepSvc.getOneSrep(srep_no);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("srepVO", srepVO); // 資料庫取出的srepVO物件,存入req
				String url = "/front-end/srep/update_srep_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_Srep_input.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/listAllSrep.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_Srep_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer srep_no = new Integer(req.getParameter("srep_no").trim());
				SrepService srepSvc2 = new SrepService();
				SrepVO srepVO2 = srepSvc2.getOneSrep(srep_no);
					

				Integer or_no = null;
				try {
					or_no = new Integer(req.getParameter("or_no").trim());
				} catch (NumberFormatException e) {
					or_no = 0;
					errorMsgs.add("商品類別請填數字");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}




				String srep_text = req.getParameter("srep_text").trim();
				
				String srep_mediumblob = "";
				Part part = req.getPart("srep_mediumblob");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					srep_mediumblob = srepVO2.getSrep_mediumblob();

				} else if (in.available() >= 3000000) {
					srep_mediumblob = srepVO2.getSrep_mediumblob();
					errorMsgs.add("圖片超過大小");
				} else {
					byte[] pic = new byte[in.available()];

					in.read(pic);
					in.close();
					srep_mediumblob = Base64.getEncoder().encodeToString(pic);
				}
				
				Integer srep_status = null;
				try {
					srep_status = new Integer(req.getParameter("srep_status").trim());
				} catch (NumberFormatException e) {
					srep_status = 0;
					errorMsgs.add("檢舉狀態請填數字");
				}
				
				
				

				SrepVO srepVO = new SrepVO();
				srepVO.setSrep_no(srep_no);
				srepVO.setOr_no(or_no);
				srepVO.setMem_id(mem_id);
				srepVO.setSrep_text(srep_text);
				srepVO.setSrep_mediumblob(srep_mediumblob);
				srepVO.setSrep_status(srep_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srepVO", srepVO); // 含有輸入格式錯誤的srepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/update_srep_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				SrepService srepSvc = new SrepService();
				srepVO = srepSvc.updateSrep(srep_no, or_no, mem_id, srep_text, srep_mediumblob, srep_status);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("srepVO", srepVO); // 資料庫update成功後,正確的的srepVO物件,存入req
				String url = "/front-end/srep/listAllSrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneSrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/update_srep_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updateb".equals(action)) { // 來自update_Srep_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer srep_no = new Integer(req.getParameter("srep_no").trim());
				SrepService srepSvc2 = new SrepService();
				SrepVO srepVO2 = srepSvc2.getOneSrep(srep_no);
				
				
				Integer or_no = null;
				try {
					or_no = new Integer(req.getParameter("or_no").trim());
				} catch (NumberFormatException e) {
					or_no = 0;
					errorMsgs.add("商品類別請填數字");
				}
				
				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}
				
				
				
				
				String srep_text = req.getParameter("srep_text").trim();
				
				String srep_mediumblob = "";
				Part part = req.getPart("srep_mediumblob");
				InputStream in = part.getInputStream();
				
				if (in.available() == 0) {
					
					srep_mediumblob = srepVO2.getSrep_mediumblob();
					
				} else if (in.available() >= 3000000) {
					srep_mediumblob = srepVO2.getSrep_mediumblob();
					errorMsgs.add("圖片超過大小");
				} else {
					byte[] pic = new byte[in.available()];
					
					in.read(pic);
					in.close();
					srep_mediumblob = Base64.getEncoder().encodeToString(pic);
				}
				
				Integer srep_status = null;
				try {
					srep_status = new Integer(req.getParameter("srep_status").trim());
				} catch (NumberFormatException e) {
					srep_status = 0;
					errorMsgs.add("檢舉狀態請填數字");
				}
				
				
				
				
				SrepVO srepVO = new SrepVO();
				srepVO.setSrep_no(srep_no);
				srepVO.setOr_no(or_no);
				srepVO.setMem_id(mem_id);
				srepVO.setSrep_text(srep_text);
				srepVO.setSrep_mediumblob(srep_mediumblob);
				srepVO.setSrep_status(srep_status);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srepVO", srepVO); // 含有輸入格式錯誤的srepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/srep/update_srep_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}
				
				/*************************** 2.開始修改資料 *****************************************/
				SrepService srepSvc = new SrepService();
				srepVO = srepSvc.updateSrep(srep_no, or_no, mem_id, srep_text, srep_mediumblob, srep_status);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("srepVO", srepVO); // 資料庫update成功後,正確的的srepVO物件,存入req
				String url = "/back-end/srep/listAllSrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneSrep.jsp
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/srep/update_srep_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addSrep.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				Integer srep_no = new Integer(req.getParameter("srep_no").trim());


				Integer or_no = null;
				try {
					or_no = new Integer(req.getParameter("or_no").trim());
				} catch (NumberFormatException e) {
					or_no = 0;
					errorMsgs.add("商品類別請填數字");
				}

				Integer mem_id = null;
				try {
					mem_id = new Integer(req.getParameter("mem_id").trim());
				} catch (NumberFormatException e) {
					mem_id = 0;
					errorMsgs.add("會員編號請填數字");
				}




				String srep_text = req.getParameter("srep_text").trim();
				if (srep_text == null || srep_text.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				}

				String srep_mediumblob = "";
				Part part = req.getPart("srep_mediumblob");
				InputStream in = part.getInputStream();

				if (in.available() == 0) {

					srep_mediumblob = "";

				} else if (in.available() >= 3000000) {
					errorMsgs.add("圖片超過大小");
				} else {
					byte[] pic = new byte[in.available()];

					in.read(pic);
					in.close();
					srep_mediumblob = Base64.getEncoder().encodeToString(pic);
				}
				
				Integer srep_status = null;
				try {
					srep_status = new Integer(req.getParameter("srep_status").trim());
				} catch (NumberFormatException e) {
					srep_status = 0;
					errorMsgs.add("商品狀態請填數字");
				}

				SrepVO srepVO = new SrepVO();
//				srepVO.setSrep_no(srep_no);
				srepVO.setOr_no(or_no);
				srepVO.setMem_id(mem_id);
				srepVO.setSrep_text(srep_text);
				srepVO.setSrep_mediumblob(srep_mediumblob);
				srepVO.setSrep_status(srep_status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("srepVO", srepVO); // 含有輸入格式錯誤的srepVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/addSrep.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				SrepService srepSvc = new SrepService();
				srepVO = srepSvc.addSrep(or_no, mem_id, srep_text, srep_mediumblob, srep_status);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/srep/listAllSrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllSrep.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/addSrep.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllSrep.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer srep_no = new Integer(req.getParameter("srep_no"));

				/*************************** 2.開始刪除資料 ***************************************/
				SrepService srepSvc = new SrepService();
				srepSvc.deleteSrep(srep_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/srep/listAllSrep.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/srep/listAllSrep.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
