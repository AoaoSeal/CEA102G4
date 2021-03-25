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
public class OpenBid extends HttpServlet {

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
		String bid_no = req.getParameter("bid_no").trim();
		String endtime = req.getParameter("endtime").trim();
		System.out.println(endtime);
		
		
		try {
			if("true".equals(endtime)) {
			con = ds.getConnection();

			Statement stat1 = con.createStatement();
	
			
			

			String sql1 = "SELECT * FROM bid WHERE bid_no =" + bid_no;

			ResultSet rs1 = stat1.executeQuery(sql1);

			String bid_status = "";

			while (rs1.next()) {

				bid_status = rs1.getString("bid_status");

			}
			rs1.close();
			stat1.close();

			if ("1".equals(bid_status)) {

				String sql4 = "UPDATE bid SET bid_status = 2 where bid_no =" + bid_no;

				java.sql.PreparedStatement stat4 = con.prepareStatement(sql4);

				stat4.executeUpdate();
				stat4.close();
//				System.out.println("67openbid有經過1");
			}
			}else {
				con = ds.getConnection();

				Statement stat1 = con.createStatement();
		
				
				

				String sql1 = "SELECT * FROM bid WHERE bid_no =" + bid_no;

				ResultSet rs1 = stat1.executeQuery(sql1);

				String bid_status = "";

				while (rs1.next()) {

					bid_status = rs1.getString("bid_status");

				}
				rs1.close();
				stat1.close();

//				if ("2".equals(bid_status)) {

					String sql4 = "UPDATE bid SET bid_status = 3 where bid_no =" + bid_no;

					java.sql.PreparedStatement stat4 = con.prepareStatement(sql4);

					stat4.executeUpdate();
					stat4.close();
//					System.out.println("67openbid有經過1");
//				}
			}


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
