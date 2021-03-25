package com.itinerary.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


public class PicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    
	Connection con;
	
	public PicServlet() {
		super();

	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {


		res.setContentType("image/jpeg");
		ServletOutputStream out = res.getOutputStream();

		
//		SELECT it_pic FROM itinerary WHERE it_no =? (+itNo)
//             column         table	       idname    13007
		try {
			String pic = req.getParameter("pic").trim();			
			if("1".equals(pic)) {
//System.out.println("pic=1");				
				int PK = Integer.parseInt(req.getParameter("itNo").trim());
//System.out.println("PK1"+PK);					
				String table = req.getParameter("table");
				String column = req.getParameter("column");
				String idName = req.getParameter("idname");
				String sql = "SELECT " + column + " FROM " + table +" WHERE "+ idName+"=?";			
				PreparedStatement pstmt =con.prepareStatement(sql);
//System.out.println(sql);				
				pstmt.setInt(1, PK);
				ResultSet rs = pstmt.executeQuery();
	
					if (rs.next()) {
						BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("it_pic"));				
						byte[] buf = new byte[4 * 1024]; // 4K buffer
						//System.out.println("有抓到圖片");
						int len;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
					}
					in.close();
					rs.close();
					pstmt.close();
				}
			}else if("2".equals(pic)) {
//System.out.println("pic=2");				
				int PK = Integer.parseInt(req.getParameter("itNo").trim());
//System.out.println("PK2"+PK);					
				String table = req.getParameter("table");
				String column = req.getParameter("column");
				String idName = req.getParameter("idname");
				String sql = "SELECT " + column + " FROM " + table +" WHERE "+ idName+"=?";
//System.out.println(sql);				
				PreparedStatement pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, PK);
				ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
						BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("it_pic2"));				
						byte[] buf = new byte[4 * 1024]; // 4K buffer
						//System.out.println("有抓到圖片");
						int len;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
						}
						in.close();
						rs.close();
						pstmt.close();
					}
			}else if("3".equals(pic)) {
//System.out.println("pic=3");				
				int PK = Integer.parseInt(req.getParameter("itNo").trim());
//System.out.println("PK3"+PK);					
				String table = req.getParameter("table");
				String column = req.getParameter("column");
				String idName = req.getParameter("idname");
				String sql = "SELECT " + column + " FROM " + table +" WHERE "+ idName+"=?";
//System.out.println(sql);				
				PreparedStatement pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, PK);
				ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
						BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("it_pic3"));				
						byte[] buf = new byte[4 * 1024]; // 4K buffer
						//System.out.println("有抓到圖片");
						int len;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
						}
						in.close();
						rs.close();
						pstmt.close();
					}	
			}else if("4".equals(pic)) {
//System.out.println("pic=4");				
				int PK = Integer.parseInt(req.getParameter("itNo").trim());
//System.out.println("PK4"+PK);					
				String table = req.getParameter("table");
				String column = req.getParameter("column");
				String idName = req.getParameter("idname");
				String sql = "SELECT " + column + " FROM " + table +" WHERE "+ idName+"=?";
//System.out.println(sql);				
				PreparedStatement pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, PK);
				ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
						BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("it_pic4"));				
						byte[] buf = new byte[4 * 1024]; // 4K buffer
						//System.out.println("有抓到圖片");
						int len;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
						}
						in.close();
						rs.close();
						pstmt.close();
					}	
			}else if("5".equals(pic)) {
//System.out.println("pic=5");				
				int PK = Integer.parseInt(req.getParameter("itNo").trim());
//System.out.println("PK5"+PK);					
				String table = req.getParameter("table");
				String column = req.getParameter("column");
				String idName = req.getParameter("idname");
				String sql = "SELECT " + column + " FROM " + table +" WHERE "+ idName+"=?";
//System.out.println(sql);				
				PreparedStatement pstmt =con.prepareStatement(sql);
				pstmt.setInt(1, PK);
				ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {
						BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("it_pic5"));				
						byte[] buf = new byte[4 * 1024]; // 4K buffer
						//System.out.println("有抓到圖片");
						int len;
						while ((len = in.read(buf)) != -1) {
							out.write(buf, 0, len);
						}
						in.close();
						rs.close();
						pstmt.close();
					}					
			} else {
				//res.sendError(HttpServletResponse.SC_NOT_FOUND);
				InputStream is = getServletContext().getResourceAsStream("/resource/images/noPic.jpg");
				byte[]buff = new byte[is.available()];
				is.read(buff);
				out.write(buff);
				is.close();
			}
			
		} catch (Exception e) {
			//System.out.println(e);
			InputStream in = getServletContext().getResourceAsStream("/resource/images/noPic.jpg");
			byte[]b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}
	}

	public void init() throws ServletException {
		
	    	try {
				Context ctx = new javax.naming.InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
				con = ds.getConnection();
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	
	}
	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);
	}
}
