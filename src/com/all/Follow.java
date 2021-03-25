package com.all;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

@SuppressWarnings("serial")
public class Follow extends HttpServlet {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	Connection con;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ServletOutputStream out = res.getOutputStream();

		try {

			con = ds.getConnection();

			Statement stmt = con.createStatement();
			ResultSet rs = null;
			PreparedStatement pstmt = null;

			String mem_id = req.getParameter("mem_id").trim();// id
			String _id = req.getParameter("_id").trim();// class
			String where = _id.substring(0, 2);

//			System.out.println(mem_id + " "+_id  + " "+ where + "xx");

			if (mem_id == _id) {
				out.print("self");
				//===============
				out.flush();
				out.close();
				return;
			}
			String a = "";
			String b = "";
			String table = "";

			if (where.equals("10")) {
//				System.out.println("10");
				a = "followed_menid";
				b = "follower_menid";
				table = "member_follow";
			} else if (where.equals("12")) {
//				System.out.println("12");
				a = "followed_menid";
				b = "follower_menid";
				table = "member_follow";
			}else if (where.equals("13")) {
//				System.out.println("13");
				a = "it_no";
				b = "mem_id";
				table = "followinglist";
			} else if (where.equals("20")) {
//				System.out.println("20");
				a = "bid_no";
				b = "mem_id";
				table = "bid_follow";
			} else if (where.equals("25")) {
//				System.out.println("25");
				a = "gd_no";
				b = "mem_id";
				table = "goods_detail";
			} else if (where.equals("16")) {
//				System.out.println("16");
				a = "art_no";
				b = "mem_id";
				table = "article_save";
			}
			System.out.println("92="+mem_id);
			rs = stmt.executeQuery("SELECT " + a + " _id FROM " + table + " WHERE " + b + " = " + mem_id);

			boolean tf = false;
			while (rs.next()) {

				String _ids = rs.getString("_id");
				System.out.println("99="+_ids);
				if (_id.equals(_ids)) {
					System.out.println(_id+"=="+_ids);
					tf = true;
				}
				
			}
			
			if (tf) {
//				System.out.println("delete");
				pstmt = con.prepareStatement(
						"DELETE FROM " + table + " WHERE (" + b + " = " + mem_id + ") and (" + a + " = " + _id + ")");
				pstmt.executeUpdate();
				pstmt.close();
				out.print(false);
				//===============
				out.flush();
				out.close();
			} else {
//				System.out.println("INSERT");
				pstmt = con.prepareStatement(
						"INSERT INTO  " + table + " (" + b + "," + a + ") VALUE (" + mem_id + "," + _id + ")");
				pstmt.executeUpdate();
				pstmt.close();
				out.print(true);
				//===============
				out.flush();
				out.close();
			}
			rs.close();
			// follower_menid==10
			// it_no==13
			// bid_no==20
			// gd_no==25
			// art_no==16

		} catch (

		Exception e) {

			e.getStackTrace();
		} finally {
			// Always close the database connection.
			try {
				if (con != null)
					con.close();

			} catch (SQLException ignored) {
			}
		}
	}

//	public void init() throws ServletException {
//		try {
//
//			Context ctx = new javax.naming.InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
//			con = ds.getConnection();
//		}
//
//		catch (Exception e) {
//
//			throw new UnavailableException("Couldn't get db connection");
//		}
//	}
//
//	public void destroy() {
//		try {
//			if (con != null) {
//				con.close();
//				
//			}
//				
//		} catch (SQLException e) {
//			System.out.println(e);
//		}
//	}

}
