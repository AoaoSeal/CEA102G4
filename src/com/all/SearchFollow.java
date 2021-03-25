package com.all;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import com.google.gson.Gson;

@SuppressWarnings("serial")
public class SearchFollow extends HttpServlet {

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
	Gson gson = new Gson();

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

	public static List<String> stringToList(String str) {
		String arrstring = str.replaceFirst("\\[", "").replaceFirst("\\]", "").replaceAll("\"", "");
//		System.out.println(arrstring);
		return Arrays.asList(arrstring.split(","));
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

			List<String> array_ids = stringToList(_id);
			List<String> follow_ids = new ArrayList();
			Map<String, Object> map = new HashMap<>();
//			System.out.println(mem_id + _id + where + "xx");
//			System.out.println("換愛心這" + array_ids);
//			System.out.println("換愛心這" + mem_id);

			rs = stmt.executeQuery("SELECT  followed_menid _id FROM member_follow WHERE follower_menid = " + mem_id
					+ " union " + "SELECT  it_no _id FROM followinglist WHERE mem_id = " + mem_id + " union "
					+ "SELECT bid_no _id FROM bid_follow WHERE mem_id = " + mem_id + " union "
					+ "SELECT  gd_no _id FROM goods_detail WHERE mem_id = " + mem_id + " union "
					+ "SELECT  art_no _id FROM article_save WHERE mem_id = " + mem_id);

			boolean tf = false;
			while (rs.next()) {

				follow_ids.add(rs.getString("_id"));

			}
			for (String array_id : array_ids) {
				
				map.put(array_id, false);
				
			}
						
			
			for (String array_id : array_ids) {

				for (String follow_id : follow_ids) {
					
					if (follow_id.equals(array_id)) {

						map.put(array_id, true);
					} 

				}

			}

//			System.out.println(map.size());
			
			String jsonStr = gson.toJson(map);
//			System.out.println(jsonStr);
			out.print(jsonStr);

			// ===============
			out.flush();
			out.close();

			rs.close();
			stmt.close();

		} catch (Exception e) {

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
