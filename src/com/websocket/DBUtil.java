package com.websocket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;
import javax.websocket.Session;

import com.mysql.jdbc.PreparedStatement;

public class DBUtil extends HttpServlet {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final long serialVersionUID = 1L;

	public Map<String, String> endingBid(String bid_no)
			throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
		
		Map<String, String> winMap = new ConcurrentHashMap<>();
		
		Connection conn = ds.getConnection();

		Statement stat1 = conn.createStatement();
//(1)先確認此競標的狀態
		String sql1 = "SELECT * FROM bid WHERE bid_no =" + bid_no;

		ResultSet rs1 = stat1.executeQuery(sql1);
		String it_no = "";
		String it_name = "";

		String bid_status = "";

		String mem_id = "";
		String mem_nick = "";
		String bid_price = "";
		String bidrec_no = "";
		String tra_bal = "";

		while (rs1.next()) {

			it_no = rs1.getString("it_no");
			bid_status = rs1.getString("bid_status");

		}
		rs1.close();
		stat1.close();
		// (2)如果還沒轉為結標就進入撈出最高得標者
		if ("2".equals(bid_status)) {
			Statement stat2 = conn.createStatement();

			String sql2 = "SELECT * FROM bid_record A JOIN bid B ON A.bid_no = B.bid_no "
					+ " JOIN member_list T ON T.mem_id = A.mem_id and A.bid_no = " + bid_no
					+ " JOIN itinerary Y ON Y.it_no = B.it_no " + " ORDER BY A.bid_price DESC LIMIT 1";
			ResultSet rs2 = stat2.executeQuery(sql2);

			while (rs2.next()) {

				mem_id = rs2.getString("mem_id");
				mem_nick = rs2.getString("mem_nick");
				bid_price = rs2.getString("bid_price");
				bidrec_no = rs2.getString("bidrec_no");
				tra_bal = rs2.getString("tra_bal");
				it_name = rs2.getString("it_name");
//				System.out.println(mem_nick);
			}
			rs2.close();
			stat2.close();

			int newtra_bal = Integer.parseInt(tra_bal) - Integer.parseInt(bid_price);
			// (3)扣除得標者會員的錢包
			String sql3 = "UPDATE member_list SET tra_bal = ? where mem_id =" + mem_id;

			java.sql.PreparedStatement stat3 = conn.prepareStatement(sql3);

			stat3.setInt(1, newtra_bal);

			stat3.executeUpdate();
			stat3.close();

			// (4)更新競標得標者 以及更改成結標狀態
			String sql4 = "UPDATE bid SET mem_id = ?,bidrec_no = ?,bid_price = ? ,bid_status = 3 where bid_no ="
					+ bid_no;

			java.sql.PreparedStatement stat4 = conn.prepareStatement(sql4);

			stat4.setInt(1, Integer.parseInt(mem_id)); // 這個輸入得從已存在行程去撈
			stat4.setInt(2, Integer.parseInt(bidrec_no));
			stat4.setInt(3, Integer.parseInt(bid_price));

			stat4.executeUpdate();
			stat4.close();

			// (5)更新行程的競標佔位
			String sql5 = "UPDATE registration_master A INNER JOIN registration_detail B ON A.rm_no=B.rm_no "
					+ " SET A.mem_id= ?" + ",A.rm_status=0 " + " WHERE A.mem_id=1001 AND A.it_no= ? ";

			java.sql.PreparedStatement stat5 = conn.prepareStatement(sql5);

			stat5.setInt(1, Integer.parseInt(mem_id)); // 這個輸入得從已存在行程去撈
			stat5.setInt(2, Integer.parseInt(it_no));

			stat5.executeUpdate();
			stat5.close();
			
			// (6)發送訊息至得標會員
			String sql6 = "INSERT INTO message (mem_id, message_c, message_contain)  VALUES (?,?,?)";
			String win = "<h3>恭喜  " + mem_nick + "  競標得標!!<br> < " + it_name + " > 行程名額乙位<br>" + "得標金額為:  TWD$  " + bid_price
					+ " 已從錢包扣款</h3>"
					+"<button class=\"pricebarbtn\"><a class=\"btna\" href=\"/CEA102G4/front-end/bid/bid_select_page.jsp?itNo="+it_no+"\">填寫行程報名資料</a></button>";
			java.sql.PreparedStatement stat6 = conn.prepareStatement(sql6);

			stat6.setInt(1, Integer.parseInt(mem_id)); // 這個輸入得從已存在行程去撈
			stat6.setInt(2, Integer.parseInt(bid_no));
			stat6.setString(3, win);
			stat6.executeUpdate();
			stat6.close();
			winMap.put("mem_nick", mem_nick);
			winMap.put("it_name", it_name);
			winMap.put("mem_id", mem_id);
			winMap.put("bid_price", bid_price);
			
			
			// (7)發送訊息至未得標會員
			Set<Integer> othermemid = new HashSet<Integer>();

			Statement stat7 = conn.createStatement();

			String sql7 = "SELECT mem_id FROM bid_record WHERE bid_no =" + bid_no;

			ResultSet rs7 = stat7.executeQuery(sql7);

			while (rs7.next()) {
				othermemid.add(rs7.getInt("mem_id"));
			}
			System.out.println("othermemid.size()=" + othermemid.size());

			rs7.close();
			stat7.close();

			String other = "競標 < " + it_name + " > 已結束  ，感謝會員參加競標 。";
//			String sql8 = "INSERT INTO message (mem_id, message_c, message_contain)  VALUES ";
			
			if (othermemid.size() != 1) {
				int count = 1;
				for (Integer s : othermemid) {

					if (s != Integer.parseInt(mem_id)) {

//						sql8 += "(" + s + "," + Integer.parseInt(it_no) + ",\"" + other + "\")";
						System.out.println("167=" + count + "==" + othermemid.size()+"-1");
//						System.out.println(!(count == othermemid.size() - 1));
						if (!(count == othermemid.size() - 1)) {
//							System.out.println(count +"  "+(othermemid.size() - 1));
//							sql8 += ",";
//							System.out.println("161=" + count + "==" + othermemid.size());
						}
						++count;
					}
					
				}
			}
//			System.out.println("170=" + sql8);

//			java.sql.PreparedStatement stat8 = conn.prepareStatement(sql8);

//			stat8.executeUpdate();
//			stat8.close();
			winMap.put("other", other);
		}

		conn.close();
		return winMap;

	}

	public void startBid(String bid_no)
			throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {

		Connection conn = ds.getConnection();

		Statement stat1 = conn.createStatement();

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

			java.sql.PreparedStatement stat4 = conn.prepareStatement(sql4);

			stat4.executeUpdate();
			stat4.close();

		}
		conn.close();
	}

	public synchronized List<AlarmMessage> setBiding(String bid_no, String mem_id, String bid_price)
			throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {
		Connection conn = ds.getConnection();

		Statement stat2 = conn.createStatement();

		String sql2 = "SELECT * FROM bid_record WHERE bid_no =" + bid_no + " ORDER BY bid_price DESC LIMIT 1";

		ResultSet rs2 = stat2.executeQuery(sql2);

		int new_bid_price = Integer.parseInt(bid_price);
		int first_bid_price = 0;

		while (rs2.next()) {
//        	 
			first_bid_price = Integer.parseInt(rs2.getString("bid_price"));

		}

		rs2.close();

		stat2.close();

		if (new_bid_price > first_bid_price) {

			String sql = "INSERT INTO bid_record (mem_id, bid_no, bid_price)  VALUES (?,?,?)";

			java.sql.PreparedStatement stat = conn.prepareStatement(sql);

			stat.setInt(1, Integer.parseInt(mem_id)); // 這個輸入得從已存在行程去撈
			stat.setInt(2, Integer.parseInt(bid_no));
			stat.setInt(3, new_bid_price);

			stat.executeUpdate();

			stat.close();

		}

		List<AlarmMessage> list = new ArrayList<AlarmMessage>();

		Statement stat1 = conn.createStatement();

		String sql1 = "SELECT * FROM bid_record A JOIN bid B ON A.bid_no = B.bid_no "
				+ "JOIN member_list T ON T.mem_id = A.mem_id and A.bid_no =" + bid_no
				+ " ORDER BY A.bid_price DESC LIMIT 9";

		ResultSet rs = stat1.executeQuery(sql1);

		while (rs.next()) {
			AlarmMessage alarmMessage = new AlarmMessage(rs.getString("mem_id"), rs.getString("bid_no"),
					rs.getString("bid_price"), rs.getString("bid_time"), rs.getString("mem_nick"));

			list.add(alarmMessage);

		}

		rs.close();

		stat1.close();

		conn.close();

		return list;

	}

	public List<AlarmMessage> getFromDB(String bid_no)
			throws SQLException, ClassNotFoundException, IllegalAccessException, InstantiationException {

		List<AlarmMessage> list = new ArrayList<AlarmMessage>();

		Connection conn = ds.getConnection();

		Statement stat = conn.createStatement();
System.out.println("有經過306");
		String sql = "SELECT * FROM bid_record A JOIN bid B ON A.bid_no = B.bid_no "
				+ "JOIN member_list T ON T.mem_id = A.mem_id and A.bid_no =" + bid_no
				+ " ORDER BY A.bid_price DESC LIMIT 9";

		ResultSet rs = stat.executeQuery(sql);

		while (rs.next()) {
			AlarmMessage alarmMessage = new AlarmMessage(rs.getString("mem_id"), rs.getString("bid_no"),
					rs.getString("bid_price"), rs.getString("bid_time"), rs.getString("mem_nick"));

			list.add(alarmMessage);

		}

		rs.close();

		stat.close();

		conn.close();

		return list;

	}

}
