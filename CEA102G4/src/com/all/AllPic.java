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
public class AllPic extends HttpServlet {
	
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

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			
	    	con = ds.getConnection();
			
			Statement stmt = con.createStatement();
			String table = req.getParameter("table").trim();
			String picColumn = req.getParameter("picColumn").trim();
			String idColumn = req.getParameter("idColumn").trim();
			String id = req.getParameter("id").trim();

			ResultSet rs = stmt
					.executeQuery("SELECT " + picColumn + " FROM " + table + " WHERE " + idColumn + " = " + id);

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(picColumn));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {

				InputStream in = getServletContext().getResourceAsStream("/resource/images/NoData/null2.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
				in.close();
			}
			rs.close();
			stmt.close();
			
		} catch (Exception e) {

			InputStream in = getServletContext().getResourceAsStream("/resource/images/NoData/null2.jpg");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
			//===============
			out.flush();
			out.close();
		}
		finally {
		      // Always close the database connection.
		      try {
		        if (con != null) con.close();
		      }
		      catch (SQLException ignored) { }
		    }
	}

	public void init() throws ServletException {
		try {

			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
			con = ds.getConnection();
		}

		catch (Exception e) {

			throw new UnavailableException("Couldn't get db connection");
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
