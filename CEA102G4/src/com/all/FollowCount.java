package com.all;

import java.io.*;
import java.sql.*;
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
public class FollowCount extends HttpServlet {

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
	public static List<String> stringToList(String str){
		String arrstring = str.replaceFirst("\\[", "").replaceFirst("\\]", "").replaceAll("\"", "") ; 
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
		
//			String _id = req.getParameter("_id").trim();// class
			String mydata = req.getParameter("mydata");
			
			List<String> array = stringToList(mydata);
			Map<String, Object> map = new HashMap<>();
			
//			System.out.println(mydata);
//			System.out.println(array);
			for(String element : array) {
//		        System.out.println(element);
		        String where = element.substring(0,2);
				String count ="";

//				System.out.println("where="+where);
				
		
								
				if (where.equals("10")) {
					
//					System.out.println("10");
					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM member_follow WHERE followed_menid = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();
					
				} else if (where.equals("12")) {
//					System.out.println("12");
	
					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM member_follow WHERE followed_menid = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();

				}
				else if (where.equals("13")) {
//					System.out.println("13");
	
					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM followinglist WHERE it_no = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();

				} else if (where.equals("20")) {
//					System.out.println("20");

					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM bid_follow WHERE bid_no = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();

				} else if (where.equals("25")) {
//					System.out.println("25");
		
					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM goods_detail WHERE gd_no = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();

				} else if (where.equals("16")) {
//					System.out.println("16");
				
					rs = stmt.executeQuery(
							"SELECT COUNT(*) count FROM article_save WHERE art_no = " + element);
				
					while (rs.next()) {				
						 count = rs.getString("count");
//						System.out.println("count="+count);											
					}
//					out.print(count);
//					//===============
//					out.flush();
//					out.close();

				}
				
				
				map.put(element, Integer.parseInt(count));
				
				
//				System.out.println(map.size());
//				System.out.println(element+"=="+count);
				
				
			}	
//			System.out.println(map.size());
			String jsonStr = gson.toJson(map);
			out.print(jsonStr);
			//===============
			out.flush();
			out.close();
			rs.close();
			stmt.close();
			
		} catch (Exception e) {

//			e.getStackTrace();
		} finally {
			// Always close the database connection.
			try {
				if (con != null) {
					con.close();
				}
				

			} catch (SQLException ignored) {
			}
		}
	}


}
