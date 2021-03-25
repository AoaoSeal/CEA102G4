package com.all;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;

@SuppressWarnings("serial")
public class SearchFollowByMemberID extends HttpServlet {

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

		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
//		ServletOutputStream out = res.getOutputStream();

		try {

			con = ds.getConnection();

			Statement stmt = con.createStatement();
			ResultSet rs = null;
			PreparedStatement pstmt = null;

			res.setContentType("text/html;charset=UTF-8");
			res.setCharacterEncoding("UTF-8");

			String mem_id = req.getParameter("mem_id").trim();// id
			String _id = req.getParameter("_id").trim();// class
			String where = _id.substring(0, 2);

//			System.out.println(mem_id + _id + where + "SearchFollowByMemberID");

//			if (mem_id == _id) {
//				out.print("self");
//				return;
//			}
//==================追蹤清單===================
			String a1 = "";
			String a2 = "";
			String atable = "";
//==================追蹤對象的資料=============
			String btable = "";
			String _id_Column = "";
			String btitle = "";
			String btext1 = "";
//			String btext2 = "";
			String picColumn = "";

			if (where.equals("10")) {
//				System.out.println("10=member");

//==================追蹤清單===================
				a1 = "followed_menid";
				a2 = "follower_menid";
				atable = "member_follow";
//==================追蹤對象的資料=============
				btable = "member_list";
				_id_Column = "mem_id";
				btitle = "mem_nick";
				btext1 = "mem_sex";
//				btext2 = "";
				picColumn = "mem_pic";

			} else if (where.equals("12")) {
//				System.out.println("12=leader");

//==================追蹤清單===================
				a1 = "followed_menid";
				a2 = "follower_menid";
				atable = "member_follow";
//==================追蹤對象的資料=============
				btable = "leader";
				_id_Column = "ld_no";
				btitle = "ld_name";
				btext1 = "ld_expr";
//				btext2 = "";
				picColumn = "ld_pic";

			} else if (where.equals("13")) {
//				System.out.println("13=itinerary");
//==================追蹤清單===================
				a1 = "it_no";
				a2 = "mem_id";
				atable = "followinglist";
				// ==================追蹤對象的資料=============
				btable = "itinerary";
				_id_Column = "it_no";
				btitle = "it_name";
				btext1 = "it_text";
//				btext2 = "";
				picColumn = "it_pic";
			} else if (where.equals("20")) {
//				System.out.println("20=`bid`");
				a1 = "bid_no";
				a2 = "mem_id";
				atable = "bid_follow";
				// ==================追蹤對象的資料=============
				btable = "itinerary";
				_id_Column = "it_no";
				btitle = "it_name";
				btext1 = "bid_price";
//				btext2 = "";
				picColumn = "it_pic";
			} else if (where.equals("25")) {
//				System.out.println("25=goods");
				a1 = "gd_no";
				a2 = "mem_id";
				atable = "goods_detail";
				// ==================追蹤對象的資料=============
				btable = "goods";
				_id_Column = "gd_no";
				btitle = "gd_name";
				btext1 = "gd_price";
//				btext2 = "";
				picColumn = "gd_mediumblob";
			} else if (where.equals("16")) {
//				System.out.println("16=article");
				a1 = "art_no";
				a2 = "mem_id";
				atable = "article_save";
				// ==================追蹤對象的資料=============
				btable = "article";
				_id_Column = "art_no";
				btitle = "art_title";
				btext1 = "art_text";
//				btext2 = "";
				picColumn = "art_pic";
			}

			if (where.equals("20")) {
				rs = stmt.executeQuery("SELECT * FROM bid_follow A JOIN bid B ON A.bid_no = B.bid_no "
						+ "JOIN itinerary T ON T.it_no = B.it_no and A.mem_id =" + mem_id);

			} else {
//				System.out.println("160");
				rs = stmt.executeQuery("SELECT * FROM " + atable + " A JOIN " + btable + " B ON A." + a1 + " = B."
						+ _id_Column + " and A." + a2 + " = " + mem_id );

			}
			String str = "";
			String pic = "";
			String jsno = "{";
			int jsoncount = 0;
			while (rs.next()) {
				
				String bt = rs.getString(btitle);
				String btx1 = rs.getString(btext1);
				int this_id =0;
				
				if (where.equals("20")) {
					 this_id = rs.getInt(_id_Column);
				}else {
					 this_id = rs.getInt(_id_Column);
//					 System.out.println(this_id);
				}
				
//				System.out.println("181");
				if (where.equals("10")) {
					if("1".equals(btx1)) {
						btx1="男";
					}else {
						btx1="女";
					}										
				}else if (where.equals("20")||where.equals("25")) {
					btx1="NT $ "+btx1;
				}
				
//				System.out.println("192");
				pic = "/AllPic.do?table=" + btable + "&picColumn=" + picColumn + "&idColumn=" + _id_Column + "&id="
						+ this_id;
				
				if (where.equals("20")) {
					 this_id = rs.getInt(a1);
				}else {
					 this_id = rs.getInt(_id_Column);
				}

				if (jsoncount != 0) {
					jsno += ",";
				}
//				System.out.println("205");
				jsno += "\"" + jsoncount + "\":[{" + "\"this_id\":\"" + this_id + "\"," + "\"bt\":\"" + bt + "\","
						+ "\"btx1\":\"" + btx1 + "\","

						+ "\"pic\":\"" + pic + "\"" + "}]";

				jsoncount++;

			}

			jsno += "}";
//			System.out.println("217="+jsno);
			JSONObject jsonObject = new JSONObject(jsno);
			PrintWriter out = res.getWriter();
//			System.out.println("220="+jsonObject.toString());
			 res.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
			    res.setCharacterEncoding("UTF-8"); // You want world domination, huh?
			
			out.print(jsonObject);
			//===============
			out.flush();
			out.close();
//			System.out.println("已out="+jsonObject.toString());
//			System.out.println("235");		
			rs.close();
			stmt.close();
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
