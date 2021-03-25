package com.bid.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bid.model.BidDAO;
import com.bid.model.BidRecordDAO;
import com.bid.model.BidRecordVO;
import com.bid.model.BidService;

import com.bid.model.BidVO;

import com.itinerary.model.ItDAO;
import com.itinerary.model.ItVO;
import com.registration_master.model.RmService;
import com.registration_master.model.RmVO;

@MultipartConfig
public class BidServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {
			// ------------接收請求參數,格式錯誤處理-----------
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			// ------------接收請求參數-----------
			try {
				String str = req.getParameter("bidNo");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入競標商品編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer bidNo = null;

				try {
					bidNo = new Integer(str);

				} catch (Exception e) {
					errorMsgs.add("競標商品編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始查詢
				BidService bidSvc = new BidService();
				BidVO bidVO = bidSvc.getOneBid(bidNo);

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交
				req.setAttribute("bidVO", bidVO);
				String url = "/front-end/bid/bid_listOne_index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {

				Integer bidNo = new Integer(req.getParameter("bidNo"));
				System.out.println(bidNo);
				BidService bidSvc = new BidService();
				BidVO BidVO = bidSvc.getOneBid(bidNo);

				req.setAttribute("requestURL", requestURL);
				req.setAttribute("BidVO", BidVO);
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/bid/update_bid_input.jsp");

				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/listAllBid.jsp");
				failureView.forward(req, res);
			}

		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				System.out.println(requestURL);
				System.out.println("update=" + req.getParameter("bidNo"));
				System.out.println("update=" + req.getParameter("itNo"));
				System.out.println("update=" + req.getParameter("bidPricestart"));
				System.out.println("update=" + req.getParameter("bidTimestart"));
				System.out.println("update=" + req.getParameter("bidTimeend"));
				Integer bidNo = Integer.parseInt(req.getParameter("bidNo"));

				BidService bidSvc = new BidService();
				BidVO BidVO = bidSvc.getOneBid(bidNo);
				Integer itNo = null;

				if (!req.getParameter("itNo").isEmpty()) {
					itNo = Integer.parseInt(req.getParameter("itNo"));
				} else {
					errorMsgs.add("行程編號不可為空白");
				}

				String str = req.getParameter("bidPricestart");

				Integer bidPricestart = null;

				if (!req.getParameter("bidPricestart").isEmpty()) {
					bidPricestart = Integer.parseInt(req.getParameter("bidPricestart"));
				} else {
					errorMsgs.add("起標價格不可為空白");
				}

				Timestamp bidTimestart = null;
				try {

					if (!req.getParameter("bidTimestart").isEmpty()) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						java.util.Date d1 = sdf.parse(req.getParameter("bidTimestart")); // 先把字串轉為util.Timestamp物件
						bidTimestart = new java.sql.Timestamp(d1.getTime()); // 再轉換為sql.Timestamp物件
					} else {
						errorMsgs.add("開始時間不可為空白");
					}

				} catch (IllegalArgumentException e) {
					bidTimestart = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				Timestamp bidTimeend = null;
				try {
					if (!req.getParameter("bidTimeend").isEmpty()) {

						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						java.util.Date d1 = sdf.parse(req.getParameter("bidTimeend")); // 先把字串轉為util.Date物件
						bidTimeend = new java.sql.Timestamp(d1.getTime()); // 再轉換為sql.Date物件

					} else {

						errorMsgs.add("結束時間不可為空白");
					}

				} catch (IllegalArgumentException e) {
					bidTimeend = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				BidVO BidVO2 = new BidVO();
				BidVO2.setBidNo(BidVO.getBidNo());
				BidVO2.setBidStatus(BidVO.getBidStatus());

				BidVO2.setItNo(itNo);
				BidVO2.setBidPricestart(bidPricestart);
//				BidVO2.setBidPricedir(bidPricedir);
				BidVO2.setBidTimestart(bidTimestart);
				BidVO2.setBidTimeend(bidTimeend);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("BidVO", BidVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/update_bid_input.jsp");
					failureView.forward(req, res);
					return;
				}

				bidSvc = new BidService();
				BidVO = bidSvc.updateBid(bidNo, itNo, bidPricestart, bidTimestart, bidTimeend);

				String url = requestURL;

				BidVO BidVO3 = new BidVO();
				BidVO3 = bidSvc.getOneBid(bidNo);
				req.setAttribute("BidVO3", BidVO3);
//				String url = "/back-end/bid/listAllBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (NullPointerException se) {
				errorMsgs.add("" + se.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/update_bid_input.jsp");
				failureView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/update_bid_input.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer itNo = null;

				if (!req.getParameter("itNo").isEmpty()) {
					itNo = Integer.parseInt(req.getParameter("itNo"));
				} else {
					errorMsgs.add("行程編號不可為空白");
				}

				String str = req.getParameter("bidPricestart");

				Integer bidPricestart = null;

				if (!req.getParameter("bidPricestart").isEmpty()) {
					bidPricestart = Integer.parseInt(req.getParameter("bidPricestart"));
				} else {
					errorMsgs.add("起標價格不可為空白");
				}

				Timestamp bidTimestart = null;
				try {

					if (!req.getParameter("bidTimestart").isEmpty()) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						java.util.Date d1 = sdf.parse(req.getParameter("bidTimestart")); // 先把字串轉為util.Timestamp物件
						bidTimestart = new java.sql.Timestamp(d1.getTime()); // 再轉換為sql.Timestamp物件
					} else {
						errorMsgs.add("開始時間不可為空白");
					}

				} catch (IllegalArgumentException e) {
					bidTimestart = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				Timestamp bidTimeend = null;
				try {
					if (!req.getParameter("bidTimeend").isEmpty()) {

						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
						java.util.Date d1 = sdf.parse(req.getParameter("bidTimeend")); // 先把字串轉為util.Date物件
						bidTimeend = new java.sql.Timestamp(d1.getTime()); // 再轉換為sql.Date物件

					} else {

						errorMsgs.add("結束時間不可為空白");
					}

				} catch (IllegalArgumentException e) {
					bidTimeend = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				BidVO BidVO = new BidVO();
				BidVO.setItNo(itNo);
				BidVO.setBidPricestart(bidPricestart);

				BidVO.setBidTimestart(bidTimestart);
				BidVO.setBidTimeend(bidTimeend);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("BidVO", BidVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/addBid.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始新增
				BidService bidSvc = new BidService();
				System.out.println("3");
				BidVO = bidSvc.addBid(itNo, bidPricestart, bidTimestart, bidTimeend);

				// 競標佔位
				RmVO rmVO = new RmVO();
				RmService rmSvc = new RmService();
				String[] str1 = new String[1];
				str1[0]="競標行程";
				String[] str2 = new String[1];
				str2[0]="0900-000000";			
				String[] str3 = new String[1];
				str3[0]="2021-03-31";
				
				
				rmVO = rmSvc.addRm(1001, itNo, 1, str1, str2,str3, str1, str2);

				String url = "/back-end/bid/listAllBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {

				BidVO BidVO = null;
				if (e.getMessage().equals(null)) {

					errorMsgs.add(e.getMessage());
				}
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/addBid.jsp");
				failureView.forward(req, res);
			}

		}
		if ("changStatus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				Integer bidNo = new Integer(req.getParameter("bidNo"));
				Integer memStatus = new Integer(req.getParameter("memStatus"));
				BidService bidSvc = new BidService();
				bidSvc.changStatus(memStatus, bidNo);
				String url = requestURL;
//				String url = "/back-end/bid/listAllBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("更改狀態失敗: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/listAllBid.jsp");
				failureView.forward(req, res);
			}

		}
		if ("deleteOne".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			try {
				Integer bidNo = new Integer(req.getParameter("bidNo"));
				Integer bidStatus = new Integer(req.getParameter("bidStatus"));

				System.out.println(bidNo + "   " + bidStatus);
				// 開始查詢
				BidService bidSvc = new BidService();
				bidSvc.changStatus(bidStatus, bidNo);
//				BidVO BidVO = bidSvc.getOneBid(bidNo);
//
//				if (BidVO == null) {
//					errorMsgs.add("查無資料");
//				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/listAllBid.jsp");
					failureView.forward(req, res);
					return;
				}
				// 查詢完畢準備轉交
//				req.setAttribute("BidVO", BidVO);
				String url = requestURL;
//				String url = "/back-end/bid/listAllBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bid/listAllBid.jsp");
				failureView.forward(req, res);
			}

		}

		if ("getOne_From06".equals(action)) {
			String requestURL = req.getParameter("requestURL");
			try {
				// Retrieve form parameters.
				Integer itNo = new Integer(req.getParameter("itNo"));

				ItDAO dao = new ItDAO();
				ItVO itVO = dao.findByPrimaryKey(itNo);

				req.setAttribute("itVO", itVO); // 資料庫取出的empVO物件,存入req

				// Bootstrap_modal
				boolean openModal = true;
				req.setAttribute("openModal", openModal);

				String url = requestURL;
				// 取出的empVO送給listOneEmp.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;

				// Handle any unusual exceptions
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		if ("getOne_From07".equals(action)) {
			String requestURL = req.getParameter("requestURL");
			try {
				// Retrieve form parameters.
				Integer bidNo = new Integer(req.getParameter("bidNo"));

				BidRecordDAO dao = new BidRecordDAO();
				List<BidRecordVO> bidrlist = dao.findBybidNo(bidNo);

				req.setAttribute("bidrlist", bidrlist); // 資料庫取出的empVO物件,存入req

				// Bootstrap_modal
				boolean openModal1 = true;
				req.setAttribute("openModal1", openModal1);

				String url = requestURL;
				// 取出的empVO送給listOneEmp.jsp
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;

				// Handle any unusual exceptions
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		
		//競標更新!!!
				if ("bidupdate".equals(action)) {
					//System.out.println("進入rm");			
								List<String> errorMsgs = new LinkedList<String>();
								req.setAttribute("errorMsgs", errorMsgs);
						
//								try {
					//System.out.println("進入try");					
									
									Integer peoCount = new Integer(req.getParameter("peoCount"));
					//System.out.println("peoCount="+peoCount);				
									
									String[] attName = req.getParameterValues("attName");
					//System.out.println(attName.length);				
									String attNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,15}$";
									if(attName.length == peoCount) {
										
										for(int i = 0 ; i < attName.length; i++) {						
					//System.out.println(attName[i]);						
											if(!attName[i].trim().matches(attNameReg)) { 
												errorMsgs.add("姓名-請輸入長度2~15的中、英文字");
								            }
										}
									}else {
										errorMsgs.add("姓名-不可為空白");
									}
									
									String attPhoneReg = "^09[0-9]{2}-[0-9]{6}$";				
									String[] attPhone = req.getParameterValues("attPhone");
									if(attPhone.length == peoCount) {
										for(int i = 0 ; i < attPhone.length; i++) {						
											if(!attPhone[i].trim().matches(attPhoneReg)) { 
												errorMsgs.add("電話格式錯誤09**-123456");
								            }
										}
									}else {
										errorMsgs.add("電話-不可為空白");
									}
									
									
									String[] emerName = req.getParameterValues("emerName");
									if(emerName.length == peoCount) {
										for(int i = 0 ; i < emerName.length; i++) {						
											if(!emerName[i].trim().matches(attNameReg)) { 
												errorMsgs.add("姓名-請輸入長度2~15的中、英文字");
								            }
										}
									}else {
										errorMsgs.add("姓名-不可為空白");
									}
									
									
									
									String[] emerPhone = req.getParameterValues("emerPhone");
									if(emerPhone.length == peoCount) {
										for(int i = 0 ; i < emerPhone.length; i++) {						
											if(!emerPhone[i].trim().matches(attPhoneReg)) { 
												errorMsgs.add("電話格式錯誤09**-123456");
								            }
										}
									}else {
										errorMsgs.add("電話-不可為空白");
									}
									

									String[] attBirth = req.getParameterValues("attBirth");		
									if(!(attBirth.length == peoCount)) {					
										errorMsgs.add("請輸入出生日期");
									}
									
									Integer itNo = new Integer(req.getParameter("itNo").trim());
//									Integer memId = new Integer(req.getParameter("memId").trim());
//									HttpSession session = req.getSession();
//									Integer memId = (Integer) session.getAttribute("memId");
													
									Integer memId=new Integer(req.getParameter("memId").trim());
									RmVO rmVO = new RmVO();
									
									rmVO.setMemId(memId);	
									rmVO.setItNo(itNo);	
									rmVO.setPeoCount(peoCount);	
									rmVO.setAttName(attName);	
									rmVO.setAttPhone(attPhone);	
									rmVO.setAttBirth(attBirth);	
									rmVO.setEmerName(emerName);
									rmVO.setEmerPhone(emerPhone);

									
									if (!errorMsgs.isEmpty()) {
										req.setAttribute("rmVO", rmVO); 
										RequestDispatcher failView = req
												.getRequestDispatcher("/front-end/bid/bid_select_page.jsp");
										failView.forward(req, res);
										return;
									}
									
									BidService bidSvc = new BidService();
									rmVO = bidSvc.updateRm(memId, itNo, peoCount, attName, attPhone, attBirth, emerName, emerPhone);
									
									//取出剛剛新增成功的rmVO和rdVO,轉交至成功畫面
									RmService rmSvc2 = new RmService();
									System.out.println("itNo="+itNo +"  memId="+memId);
									RmVO rmVO2 = rmSvc2.getOneSuccess(itNo,memId);
									System.out.println(rmVO2);
									req.setAttribute("rmVO2", rmVO2); 
					System.out.println("rmVO2.getRmNo()="+rmVO2.getRmNo());	
									
//									RdService rdSvc2 = new RdService();
//									RdVO rdVO2 = rdSvc2.getOneByRmNo(rmVO2.getRmNo());
									
								
//									req.setAttribute("RdVO2", rdVO2); 
					//System.out.println("rdVO2.getRdNo()="+rdVO2.getRdNo());	
									
									RequestDispatcher successView = req.getRequestDispatcher("/front-end/registration/success.jsp"); 
									successView.forward(req, res);	
									
//								}catch(Exception e) {
//									errorMsgs.add(e.getMessage());
//									RequestDispatcher failView = req
//											.getRequestDispatcher("/front-end/bid/bid_select_page.jsp");
//									failView.forward(req, res);
//								}
							}
				
				
				
				
				
//		if ("getAll_By_Status".equals(action)) {
//			String requestURL = req.getParameter("requestURL");
//			try {
//				// Retrieve form parameters.
//				Integer bidStatus = new Integer(req.getParameter("bidStatus"));
//
//				BidDAO dao = new BidDAO();
//				List<BidVO> bidlist = dao.getAllByStatus(bidStatus);
//
//				req.setAttribute("bidrlist", bidrlist); // 資料庫取出的empVO物件,存入req
//
//				// Bootstrap_modal
//				boolean openModal1 = true;
//				req.setAttribute("openModal1", openModal1);
//
//				String url = requestURL;
//				// 取出的empVO送給listOneEmp.jsp
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//				return;
//
//				// Handle any unusual exceptions
//			} catch (Exception e) {
//				throw new ServletException(e);
//			}
//		}

	}

}
