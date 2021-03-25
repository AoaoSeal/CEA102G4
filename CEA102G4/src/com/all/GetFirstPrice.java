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
public class GetFirstPrice extends HttpServlet {

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

			String bid_no = req.getParameter("bid_no").trim();// id

			Statement stat2 = con.createStatement();

			String sql2 = "SELECT * FROM bid_record WHERE bid_no =" + bid_no + " ORDER BY bid_price DESC LIMIT 1";

			ResultSet rs2 = stat2.executeQuery(sql2);

			String first_bid_price = "";

			while (rs2.next()) {
//	        	 
				first_bid_price = rs2.getString("bid_price");

			}
			out.print(first_bid_price);
			//===============
			out.flush();
			out.close();
			
			rs2.close();

			stat2.close();


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


}
