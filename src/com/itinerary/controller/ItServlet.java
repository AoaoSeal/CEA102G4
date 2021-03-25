package com.itinerary.controller;

import java.io.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONObject;

import com.itinerary.model.*;
import com.leader.model.LdService;
import com.leader.model.LdVO;





@MultipartConfig
public class ItServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		String action = req.getParameter("action");
		
		
		if ("updateStatus".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				Integer itNo = new Integer(req.getParameter("itNo").trim());
				Integer itStatus = new Integer(req.getParameter("itStatus").trim());
System.out.println("itNo="+itNo);	
System.out.println("itStatus="+itStatus);	

				ItVO itVO = new ItVO();
				itVO.setItNo(itNo);	
				itVO.setItStatus(itStatus);	
		

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("itVO", itVO);
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/itinerary/calendar2.jsp");
					failView.forward(req, res);
					return;
				}
				
				ItService itSvc = new ItService();
				itVO = itSvc.updateST(itStatus,itNo);
				
System.out.	println("itStatus修改成功");		

				String url = "/back-end/itinerary/calendar2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
								
				
			}catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/itinerary/calendar2.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		if ("getOneItOnCal".equals(action)) {
			try {
				Integer itNo = new Integer(req.getParameter("itNo"));
				ItService itSvc = new ItService();
				ItVO itVO = itSvc.getOneIt(itNo);

				String jsonStr = new JSONObject(itVO).toString();
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;

			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/itinerary/listAllIt.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		
		if ("listEventsOnCal".equals(action)) {
			try {
				ItService itSvc = new ItService();
				List<ItVO> list = itSvc.getAll();

				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				String jsonStr = new JSONArray(list).toString();
				PrintWriter out = res.getWriter();
				out.print(jsonStr);
				out.flush();
				out.close();
				return;
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/itinerary/listAllIt.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		
		
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				String str = req.getParameter("itNo");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("抓不到行程編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failView = req.getRequestDispatcher("/front-end/listAllIt.jsp");
					failView.forward(req, res);
					return;
				}
				
			 Integer itNo = null;
			 try {
				 itNo = new Integer(str);
			 }catch(Exception e) {
				 errorMsgs.add("行程編號不正確");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/front-end/listAllIt.jsp");
				 failView.forward(req, res);
				 return;
			 }
			 
			 
			 ItService itSvc = new ItService();
			 ItVO itVO = itSvc.getOneIt(itNo);
			 if(itVO == null) {
				 errorMsgs.add("查無資料");
			 }
			 if(!errorMsgs.isEmpty()) {
				 RequestDispatcher failView = req.getRequestDispatcher("/front-end/listAllIt.jsp");
				 failView.forward(req, res);
				 return;
			 }
			req.setAttribute("itVO", itVO); 
			String url = "/front-end/itinerary/listOneIt2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			
			}catch(Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/front-end/listAllIt.jsp");
				failView.forward(req, res);
				
			}
		}
		
		if ("listIts_ByCompositeQuery".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				Map<String, String[]> map = req.getParameterMap();
Set<String> keys = map.keySet();
System.out.println("CONTROLLER的map的keys "+keys);				
				ItService itSvc = new ItService();
				List<ItVO> list  = itSvc.getAll(map);
				
				req.setAttribute("listIts_ByCompositeQuery", list); 
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary/listIts_ByCompositeQuery.jsp"); 
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/back-end/itinerary/select_page.jsp");
				failView.forward(req, res);
			}
		}

		
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);			
	
			try {
				
				Integer itNo = new Integer(req.getParameter("itNo"));
				ItService itSvc = new ItService();
				ItVO itVO = itSvc.getOneIt(itNo);
				
				req.setAttribute("itVO", itVO);
				String url = "/back-end/itinerary/update_it_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:"+ e.getMessage());
				RequestDispatcher failView = req.getRequestDispatcher("/back-end/itinerary/listAllIt.jsp");
				failView.forward(req, res);
				
			}
		}
		
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try{
				Integer itNo = new Integer(req.getParameter("itNo").trim());
				String itName = req.getParameter("itName");
				String itNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
		
				ItService itSvc1 = new ItService();
				ItVO itVO1 = itSvc1.getOneIt(itNo);
				
				if (itName == null || itName.trim().length() == 0) {
					errorMsgs.add("行程名稱-不可為空白");
				} else if(!itName.trim().matches(itNameReg)) { 
					errorMsgs.add("行程名稱-請輸入長度2~20的中、英文、數字或底線_");
	            }
				
				Integer itcNo = new Integer(req.getParameter("itcNo").trim());
				
				Integer ldNo = new Integer(req.getParameter("ldNo").trim());
				
				
				byte[] itPic = null;
				try {
					Part part = req.getPart("itPic");
					InputStream in = part.getInputStream();
//System.out.println(part);
//System.out.println(in.available());
//System.out.println(itVO1.getItPic());
					if(in.available() == 0) {
						itPic = itVO1.getItPic();
					}else {
						itPic = new byte[in.available()];	
						in.read(itPic);		
//System.out.println("圖片上傳成功");
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}

				
				byte[] itPic2 = null;
				try {
					Part part = req.getPart("itPic2");
					InputStream in = part.getInputStream();
					if(in.available() == 0) {
						itPic2 = itVO1.getItPic2();
					}else {
						itPic2 = new byte[in.available()];	
						in.read(itPic2);		
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				
				byte[] itPic3 = null;
				try {
					Part part = req.getPart("itPic3");
					InputStream in = part.getInputStream();
					if(in.available() == 0) {
						itPic3 = itVO1.getItPic3();
					}else {
						itPic3 = new byte[in.available()];	
						in.read(itPic3);		
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				byte[] itPic4 = null;
				try {
					Part part = req.getPart("itPic4");
					InputStream in = part.getInputStream();
//System.out.println(in);					
					if(in.available() == 0) {
						itPic4 = itVO1.getItPic4();
					}else {
						itPic4 = new byte[in.available()];	
						in.read(itPic4);	
//System.out.println(itPic4);						
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				byte[] itPic5 = null;
				try {
					Part part = req.getPart("itPic5");
					InputStream in = part.getInputStream();
					if(in.available() == 0) {
						itPic5 = itVO1.getItPic5();
					}else {
						itPic5 = new byte[in.available()];	
						in.read(itPic5);		
						in.close();
					}						
				}catch(Exception e) {
					e.getMessage();
				}
				
				Integer itDays = null;
				try {
					itDays = new Integer(req.getParameter("itDays").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("行程天數-不可為空白");
				}
				
				
				Integer itPeolim = null;
				try {
					itPeolim = new Integer(req.getParameter("itPeolim").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("人數上限-不可為空白");
				}
				
				
				
				Integer itPrice = null;
				try {
					itPrice = new Integer(req.getParameter("itPrice").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("行程費用-不可為空白");
				}
				
				
				java.sql.Date itDate = null;
				try {
					itDate = java.sql.Date.valueOf(req.getParameter("itDate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("出發日期-不可為空白");
				}
				
				
				java.sql.Date itStartdate = null;
				try {
					itStartdate = java.sql.Date.valueOf(req.getParameter("itStartdate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("報名起始日-不可為空白");
				}
				
				
				java.sql.Date itEnddate = null;
				try {
					itEnddate = java.sql.Date.valueOf(req.getParameter("itEnddate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("報名結束日-不可為空白");
				}
				
				
				String itText = req.getParameter("itText");
				if(itText == null || (itText.trim().length() == 0)) {
					errorMsgs.add("行程介紹-不可為空白");
				}
				
				ItVO itVO = new ItVO();
				itVO.setItName(itName);	
				itVO.setItcNo(itcNo);	
				itVO.setLdNo(ldNo);	
				itVO.setItPic(itPic);	
				itVO.setItPic2(itPic2);
				itVO.setItPic3(itPic3);
				itVO.setItPic4(itPic4);
				itVO.setItPic5(itPic5);
				itVO.setItDays(itDays);	
				itVO.setItPeolim(itPeolim);	
				itVO.setItPrice(itPrice);	
				itVO.setItDate(itDate);
				itVO.setItStartdate(itStartdate);
				itVO.setItEnddate(itEnddate);
				itVO.setItText(itText);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("itVO", itVO);
					RequestDispatcher failView = req.getRequestDispatcher("/back-end/itinerary/update_it_input.jsp");
					failView.forward(req, res);
					return;
				}
				
				ItService itSvc = new ItService();
				itVO = itSvc.updateIt(itName, itcNo, ldNo, itPic, itPic2, itPic3, itPic4, itPic5, itDays, itPeolim, itPrice, itDate, itStartdate, itEnddate, itText, itNo);
				
				ItVO itVO2 = new ItVO();
				itVO2 = itSvc.getOneIt(itNo);
				req.setAttribute("itVO", itVO2);
//System.out.	println("修改資料成功");				
				String url = "/back-end/itinerary/listAllIt.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/itinerary/update_it_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				String itName = req.getParameter("itName");
				String itNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if (itName == null || itName.trim().length() == 0) {
					errorMsgs.add("行程名稱-不可為空白");
				} else if(!itName.trim().matches(itNameReg)) { 
					errorMsgs.add("行程名稱-請輸入長度2~20的中、英文、數字或底線_");
	            }
				
				Integer itcNo = new Integer(req.getParameter("itcNo").trim());
				
				Integer ldNo = new Integer(req.getParameter("ldNo").trim());
				
				
				byte[] itPic = null;
				try {
					Part part = req.getPart("itPic");
					InputStream in = part.getInputStream();
					itPic = new byte[in.available()];	
					in.read(itPic);		
System.out.println("圖片上傳成功1");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				byte[] itPic2 = null;
				try {
					Part part = req.getPart("itPic2");
					InputStream in = part.getInputStream();
					itPic2 = new byte[in.available()];	
					in.read(itPic2);		
System.out.println("圖片上傳成功2");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				
				byte[] itPic3 = null;
				try {
					Part part = req.getPart("itPic3");
					InputStream in = part.getInputStream();
					itPic3 = new byte[in.available()];	
					in.read(itPic3);		
System.out.println("圖片上傳成功3");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				byte[] itPic4 = null;
				try {
					Part part = req.getPart("itPic4");
					InputStream in = part.getInputStream();
					itPic4 = new byte[in.available()];	
					in.read(itPic4);		
System.out.println("圖片上傳成功4");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				byte[] itPic5 = null;
				try {
					Part part = req.getPart("itPic5");
					InputStream in = part.getInputStream();
					itPic5 = new byte[in.available()];	
					in.read(itPic5);		
System.out.println("圖片上傳成功5");
					in.close();
				}catch(Exception e) {
					e.getMessage();
				}
				
				
				Integer itDays = null;
				try {
					itDays = new Integer(req.getParameter("itDays").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("行程天數-不可為空白");
				}
	
				
				Integer itPeolim = null;
				try {
					itPeolim = new Integer(req.getParameter("itPeolim").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("人數上限-不可為空白");
				}
				
				
				
				Integer itPrice = null;
				try {
					itPrice = new Integer(req.getParameter("itPrice").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("行程費用-不可為空白");
				}
				
				
				java.sql.Date itDate = null;
				try {
					itDate = java.sql.Date.valueOf(req.getParameter("itDate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("出發日期-不可為空白");
				}
				
				
				java.sql.Date itStartdate = null;
				try {
					itStartdate = java.sql.Date.valueOf(req.getParameter("itStartdate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("報名起始日-不可為空白");
				}
				
				
				java.sql.Date itEnddate = null;
				try {
					itEnddate = java.sql.Date.valueOf(req.getParameter("itEnddate").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.add("報名結束日-不可為空白");
				}
				
				
				String itText = req.getParameter("itText");
				if(itText == null || (itText.trim().length() == 0)) {
					errorMsgs.add("行程介紹-不可為空白");
				}
				
				ItVO itVO = new ItVO();
				itVO.setItName(itName);	
				itVO.setItcNo(itcNo);	
				itVO.setLdNo(ldNo);	
				itVO.setItPic(itPic);	
				itVO.setItPic2(itPic2);
				itVO.setItPic3(itPic3);
				itVO.setItPic4(itPic4);
				itVO.setItPic5(itPic5);
				itVO.setItDays(itDays);	
				itVO.setItPeolim(itPeolim);	
				itVO.setItPrice(itPrice);	
				itVO.setItDate(itDate);
				itVO.setItStartdate(itStartdate);
				itVO.setItEnddate(itEnddate);
				itVO.setItText(itText);

				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("itVO", itVO); 
					RequestDispatcher failView = req
							.getRequestDispatcher("/back-end/itinerary/addIt2.jsp");
					failView.forward(req, res);
					return;
				}
				
				ItService itSvc = new ItService();
				itVO = itSvc.addIt(itName, itcNo, ldNo, itPic, itPic2, itPic3, itPic4, itPic5, itDays, itPeolim, itPrice, itDate, itStartdate, itEnddate, itText);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/itinerary/calendar2.jsp"); 
				successView.forward(req, res);	
				
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failView = req
						.getRequestDispatcher("/back-end/itinerary/addIt2.jsp");
				failView.forward(req, res);
			}
		}
		
		
		
	}

}
