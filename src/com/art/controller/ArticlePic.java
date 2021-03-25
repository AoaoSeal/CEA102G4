package com.art.controller;

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

/**
 * Servlet implementation class ArticlePic
 */
@WebServlet("/ArticlePic")
public class ArticlePic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticlePic() {
		super();
		// TODO Auto-generated constructor stub
	}

	Connection con;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		res.setContentType("image/gif");  
		ServletOutputStream out = res.getOutputStream(); //印出
	

		
		try {
			Integer id = new Integer(req.getParameter("id").trim());
			String column = new String(req.getParameter("column").trim());
			String table = new String(req.getParameter("table").trim());
			String idName = new String(req.getParameter("idName").trim());
			String FINDPIC = "SELECT * FROM "+table+" WHERE "+idName+" =?";
			
			PreparedStatement pstmt = con.prepareStatement(FINDPIC);
			pstmt.setInt(1, id);
			
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(column)); //不是整個檔案
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len); // 陣列,初始,結束
				}
				in.close();
			} else {
				InputStream in = getServletContext().getResourceAsStream(req.getContextPath()+"/resource/images/tibalogo.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();		
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			InputStream in = getServletContext().getResourceAsStream(req.getContextPath()+"/resource/images/tibalogo.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();	
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
