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
public class ConfirmBal extends HttpServlet {

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

			rs = stmt.executeQuery("SELECT tra_bal FROM member_list WHERE mem_id = " + mem_id);

			String tra_bal = null;
			while (rs.next()) {

				 tra_bal = rs.getString("tra_bal");

			}

			out.print(tra_bal);
			//===============
			out.flush();
			out.close();

			stmt.close();
			rs.close();


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
