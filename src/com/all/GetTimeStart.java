package com.all;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

@SuppressWarnings("serial")
public class GetTimeStart extends HttpServlet {

//	private static DataSource ds = null;
//	static {
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
//	Connection con;
	private static final String GET_TIME_START = "SELECT * FROM bid";
	ScheduledExecutorService service = null;
	Runnable runnable = null;

	@Override
	public void destroy() {
		service.shutdown();
		super.destroy();
	}

	public void init() throws ServletException {

//	public static void main(String[] args) {
		runnable = new Runnable() {
			Connection con = null;

			public void run() {
				// 宣告Connection物件

				// 驅動程式名
				String driver1 = "com.mysql.cj.jdbc.Driver";
				// URL指向要訪問的資料庫名
				String url1 = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
				// MySQL配置時的使用者名稱
				String user1 = "root";
				// MySQL配置時的密碼
				String password1 = "123456";

				ArrayList bid_nostart = new ArrayList();
				ArrayList bid_noend = new ArrayList();
				ArrayList bid_noto0 = new ArrayList();
				Timestamp d = new Timestamp(System.currentTimeMillis());
				try {
					// 載入驅動程式
					Class.forName(driver1);
					// 1.getConnection()方法,連線MySQL資料庫!!
					con = DriverManager.getConnection(url1, user1, password1);

					if (!con.isClosed())
						System.out.println("成功連線到資料庫!");

					try {

						// 2.建立statement類物件,用來執行SQL語句!!
						Statement statement = con.createStatement();
						// 要執行的SQL語句

						// 3.ResultSet類,用來存放獲取的結果集!!
						ResultSet rs = statement.executeQuery(GET_TIME_START);
						// 要執行的SQL語句
//       	              String sql1 = "use tiantiana insert into Table_1(tiantian,qiqi,yuyu)VALUES(?,?,?)";
						// 3.ResultSet類,用來存放獲取的結果集!!
//       	              PreparedStatement pst = con1.prepareStatement(sql1);

						while (rs.next()) {
//							System.out.println(rs.getInt("bid_no"));
							int bid_no = rs.getInt("bid_no");
							int bid_status = rs.getInt("bid_status");

//							System.out.println(rs.getTimestamp("bid_timestart"));
							Timestamp bid_timestart = rs.getTimestamp("bid_timestart");

//							System.out.println(rs.getTimestamp("bid_timeend"));
							Timestamp bid_timeend = rs.getTimestamp("bid_timeend");

//							System.out.println(d.after(bid_timestart));
//							System.out.println("=======================");
							if (d.after(bid_timestart) && bid_status == 1) {

								bid_nostart.add(bid_no);

							}

							if (d.after(bid_timeend) && bid_status == 2) {

								bid_noend.add(bid_no);

							}
							if (bid_timestart.after(d) && (bid_status == 2)) {

								bid_noto0.add(bid_no);

							}

						}
						statement.close();
						rs.close();


						System.out.println(d);
						if (bid_nostart.size() != 0) {

							String str = "UPDATE bid SET bid_status = CASE bid_no ";

							for (int i = 0; i < bid_nostart.size(); i++) {
								str += "WHEN " + bid_nostart.get(i) + " THEN 2 ";

							}
							str += " END WHERE bid_no IN (";
							for (int i = 0; i < bid_nostart.size(); i++) {
								str += bid_nostart.get(i);
								if (i != bid_nostart.size() - 1) {
									str += ",";
								}

							}
							str += ")";
//							System.out.println(str);

							PreparedStatement pstmt = con.prepareStatement(str);
							pstmt.executeUpdate();
							pstmt.close();
						}

						if (bid_noend.size() != 0) {

							String str = "UPDATE bid SET bid_status = CASE bid_no ";

							for (int i = 0; i < bid_noend.size(); i++) {
								str += "WHEN " + bid_noend.get(i) + " THEN 3 ";

							}
							str += " END WHERE bid_no IN (";
							for (int i = 0; i < bid_noend.size(); i++) {
								str += bid_noend.get(i);
								if (i != bid_noend.size() - 1) {
									str += ",";
								}

							}
							str += ")";
//							System.out.println(str);

							PreparedStatement pstmt = con.prepareStatement(str);
							pstmt.executeUpdate();
							pstmt.close();

//=================結標後撈出競標紀錄最高價格,寫入競標

							for (int i = 0; i < bid_noend.size(); i++) {
															
							Statement statement1 = con.createStatement();
							
							String str1 = "SELECT * FROM bid_record WHERE bid_no = " + bid_noend.get(i) + " ORDER BY bid_price DESC LIMIT 1";
							
							ResultSet rs1 = statement1.executeQuery(str1);
							int bidrec_no=0;
							int mem_id=0 ;
							int bid_price=0;
							int bid_no=0;
							while (rs1.next()) {
							 bidrec_no = rs1.getInt("bidrec_no");
							 mem_id = rs1.getInt("mem_id");
							 bid_price = rs1.getInt("bid_price");
							 bid_no = rs1.getInt("bid_no");
							}
							System.out.println(bid_no+"成功輸入價格"+bidrec_no+" "+mem_id+" "+bid_price);	
							String update_price = "UPDATE bid SET bidrec_no = ?,mem_id = ?,bid_price = ? WHERE bid_no = ?";
							
							PreparedStatement pstmt1 = con.prepareStatement(update_price);
							
							
							
							pstmt1.setInt(1, bidrec_no); 							
							pstmt1.setInt(2, mem_id); 
							pstmt1.setInt(3, bid_price); 
							pstmt1.setInt(4, bid_no); 							
							
							pstmt1.executeUpdate();
							
							System.out.println(bid_no+"成功輸入價格");
							pstmt1.close();
							rs1.close();
							statement1.close();
														
							
							}
							
							
							
							
							
							
						}

						if (bid_noto0.size() != 0) {

							String str = "UPDATE bid SET bid_status = CASE bid_no ";

							for (int i = 0; i < bid_noto0.size(); i++) {
								str += "WHEN " + bid_noto0.get(i) + " THEN 0 ";

							}
							str += " END WHERE bid_no IN (";
							for (int i = 0; i < bid_noto0.size(); i++) {
								str += bid_noto0.get(i);
								if (i != bid_noto0.size() - 1) {
									str += ",";
								}

							}
							str += ")";
//							System.out.println(str);

							PreparedStatement pstmt = con.prepareStatement(str);
							pstmt.executeUpdate();
							pstmt.close();
						}

					} catch (Exception e) {
						// 資料庫驅動類異常處理
						System.out.println("對不起,找不到驅動程式!");
						e.printStackTrace();

					} finally {
						System.out.println("資料庫資料成功獲取!!");
					}

				} catch (ClassNotFoundException e) {
					// 資料庫驅動類異常處理
					System.out.println("對不起,找不到驅動程式!");
					e.printStackTrace();
				} catch (SQLException e) {
					// 資料庫連線失敗異常處理
					e.printStackTrace();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {

							e.printStackTrace();
						}
					}

//					System.out.println("資料庫資料成功獲取!!");
				}
			}
		};
//		
//		ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);  
//	    long oneDay = 24 * 60 * 60 * 1000;  
//	    long initDelay  = getTimeMillis("20:00:00") - System.currentTimeMillis();  
//	    initDelay = initDelay > 0 ? initDelay : oneDay + initDelay;  
//	  
//	    executor.scheduleAtFixedRate(  
//	            new Runnable(),  
//	            initDelay,  
//	            oneDay,  
//	            TimeUnit.MILLISECONDS);  
		
		service = Executors.newSingleThreadScheduledExecutor();
		// 第二個引數為首次執行的延時時間,第三個引數為定時執行的間隔時間
		service.scheduleAtFixedRate(runnable, 10, 60, TimeUnit.SECONDS);

	}

}
