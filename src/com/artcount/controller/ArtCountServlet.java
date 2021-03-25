package com.artcount.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.artcount.model.ArtCountService;

@WebServlet("/ArtcountController")
public class ArtCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArtCountServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		Integer artNo = new Integer(request.getParameter("artNo"));
		Integer memId = null;
		if(request.getParameter("memId")!=null) {
		 memId = new Integer(request.getParameter("memId"));}
		List<String> errorMsgs = new LinkedList<String>();

		request.setAttribute("errorMsgs", errorMsgs);
		
//
		try {
			if ("like".equals(action)) {
			
				ArtCountService artCountSvc = new ArtCountService();
				artCountSvc.add(memId, artNo);
				
				Integer artCount = artCountSvc.getArtCount(artNo);
				String jsonStr = artCount.toString();
				PrintWriter out = response.getWriter();
				out.println(jsonStr);
				out.flush();
				out.close();
				
				

			}
			if ("unlike".equals(action)) {
			
				
				ArtCountService artCountSvc = new ArtCountService();
				artCountSvc.delete(memId, artNo);
				Integer artCount = artCountSvc.getArtCount(artNo);
				String jsonStr = artCount.toString();
				PrintWriter out = response.getWriter();
				out.println(jsonStr);
				out.flush();
				out.close();
				
				

			}
			if ("getArtCount".equals(action)) {
				ArtCountService artCountSvc = new ArtCountService();
				artCountSvc.getArtCount(artNo);
				
				Integer artCount = artCountSvc.getArtCount(artNo);
				String jsonStr = artCount.toString();
				PrintWriter out = response.getWriter();
				out.println(jsonStr);
				out.flush();
				out.close();
			}
	
			
		} catch (Exception e) {
			errorMsgs.add(e.getMessage());
//			RequestDispatcher failureView = request.getRequestDispatcher("/front_end/article/viewOneArtPage.jsp");
//			failureView.forward(request, response);
		}
	}

}
