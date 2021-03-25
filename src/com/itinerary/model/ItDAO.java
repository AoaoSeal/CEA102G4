package com.itinerary.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.it.CompositeQuery_It;

public class ItDAO implements ItDAO_interface{
	private static DataSource ds;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT = 
			"INSERT INTO itinerary (ld_no, itc_no, it_name, it_text, it_pic, it_pic2, it_pic3, it_pic4, it_pic5, it_days, it_price, it_peolim, it_date, it_startdate, it_enddate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = 
			"UPDATE itinerary set ld_no=?, itc_no=?, it_name=?, it_text=?, it_pic=?, it_pic2=?, it_pic3=?, it_pic4=?, it_pic5=?, it_days=?, it_price=?, it_peolim=?, it_date=?, it_startdate=?, it_enddate=? where it_no = ?";
	private static final String UPDATE_STATUS = 
			"UPDATE itinerary set it_status=? where it_no = ?";
	private static final String UPDATE_PeoCount = 
			"UPDATE itinerary set it_peocount = ? where it_no = ?";
	private static final String GET_ONE_STMT = 
			"SELECT it_no, ld_no, itc_no, it_name, it_text, it_textoth, it_pic, it_pic2, it_pic3, it_pic4, it_pic5, it_days, it_price, it_peolim, it_peocount, it_date, it_startdate, it_enddate, it_status FROM itinerary where it_no = ?";
	private static final String GET_ALL_STMT = 
			"SELECT it_no, ld_no, itc_no, it_name, it_text, it_textoth, it_pic, it_pic2, it_pic3, it_pic4, it_pic5, it_days, it_price, it_peolim, it_peocount, it_date, it_startdate, it_enddate, it_status FROM itinerary order by it_no";	
	private static final String GET_STATUS0 = 
			"SELECT it_no, ld_no, itc_no, it_name, it_text, it_textoth, it_pic, it_pic2, it_pic3, it_pic4, it_pic5, it_days, it_price, it_peolim, it_peocount, it_date, it_startdate, it_enddate, it_status FROM itinerary where it_status = 0";
	private static final String GET_Its_By_Ldno = 
			"SELECT it_no, ld_no, itc_no, it_name, it_text, it_textoth, it_pic, it_pic2, it_pic3, it_pic4, it_pic5, it_days, it_price, it_peolim, it_peocount, it_date, it_startdate, it_enddate, it_status FROM itinerary where it_status = 1";	
	
	
	
	@Override
	public void insert(ItVO itVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			 
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setInt(1, itVO.getLdNo());
			pstmt.setInt(2, itVO.getItcNo());
			pstmt.setString(3, itVO.getItName());
			pstmt.setString(4, itVO.getItText());
			pstmt.setBytes(5, itVO.getItPic());
			pstmt.setBytes(6, itVO.getItPic2());
			pstmt.setBytes(7, itVO.getItPic3());
			pstmt.setBytes(8, itVO.getItPic4());
			pstmt.setBytes(9, itVO.getItPic5());
			pstmt.setInt(10, itVO.getItDays());
			pstmt.setInt(11, itVO.getItPrice());
			pstmt.setInt(12, itVO.getItPeolim());
			pstmt.setDate(13, itVO.getItDate());
			pstmt.setDate(14, itVO.getItStartdate());
			pstmt.setDate(15, itVO.getItEnddate());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(ItVO itVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, itVO.getLdNo());
			pstmt.setInt(2, itVO.getItcNo());
			pstmt.setString(3, itVO.getItName());
			pstmt.setString(4, itVO.getItText());
			pstmt.setBytes(5, itVO.getItPic());
			pstmt.setBytes(6, itVO.getItPic2());
			pstmt.setBytes(7, itVO.getItPic3());
			pstmt.setBytes(8, itVO.getItPic4());
			pstmt.setBytes(9, itVO.getItPic5());
			pstmt.setInt(10, itVO.getItDays());
			pstmt.setInt(11, itVO.getItPrice());
			pstmt.setInt(12, itVO.getItPeolim());
			pstmt.setDate(13, itVO.getItDate());
			pstmt.setDate(14, itVO.getItStartdate());
			pstmt.setDate(15, itVO.getItEnddate());
			pstmt.setInt(16, itVO.getItNo());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public ItVO findByPrimaryKey(Integer itNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItVO itVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, itNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPic2(rs.getBytes("it_pic2"));
				itVO.setItPic3(rs.getBytes("it_pic3"));
				itVO.setItPic4(rs.getBytes("it_pic4"));
				itVO.setItPic5(rs.getBytes("it_pic5"));
				itVO.setItDays(rs.getInt("it_days"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return itVO;
	}

	@Override
	public List<ItVO> getAll() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItVO> list = new ArrayList<ItVO>();
		ItVO itVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPic2(rs.getBytes("it_pic2"));
				itVO.setItPic3(rs.getBytes("it_pic3"));
				itVO.setItPic4(rs.getBytes("it_pic4"));
				itVO.setItPic5(rs.getBytes("it_pic5"));
				itVO.setItDays(rs.getInt("it_days"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				
				list.add(itVO); 
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}

	@Override
	public List<ItVO> getAll(Map<String, String[]> map) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItVO> list = new ArrayList<ItVO>();
		ItVO itVO = null;
		
		try {
			
			con = ds.getConnection();
			String finalSQL = "select * from itinerary "
		          + CompositeQuery_It.getCondition(map)
		          + "order by it_no";
			pstmt = con.prepareStatement(finalSQL);
System.out.println("●●finalSQL(by DAO) = "+finalSQL);
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPic2(rs.getBytes("it_pic2"));
				itVO.setItPic3(rs.getBytes("it_pic3"));
				itVO.setItPic4(rs.getBytes("it_pic4"));
				itVO.setItPic5(rs.getBytes("it_pic5"));
				itVO.setItDays(rs.getInt("it_days"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				
				list.add(itVO); 
			}
	
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public void updateStatus(ItVO itVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			
			pstmt.setInt(1, itVO.getItStatus());
			pstmt.setInt(2, itVO.getItNo());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());			
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public List<ItVO> getAllbyStatus0() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItVO> list = new ArrayList<ItVO>();
		ItVO itVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STATUS0);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPic2(rs.getBytes("it_pic2"));
				itVO.setItPic3(rs.getBytes("it_pic3"));
				itVO.setItPic4(rs.getBytes("it_pic4"));
				itVO.setItPic5(rs.getBytes("it_pic5"));
				itVO.setItDays(rs.getInt("it_days"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				
				list.add(itVO); 
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}

	@Override
	public List<ItVO> getAllbyLdNo() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItVO> list = new ArrayList<ItVO>();
		ItVO itVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_Its_By_Ldno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPic2(rs.getBytes("it_pic2"));
				itVO.setItPic3(rs.getBytes("it_pic3"));
				itVO.setItPic4(rs.getBytes("it_pic4"));
				itVO.setItPic5(rs.getBytes("it_pic5"));
				itVO.setItDays(rs.getInt("it_days"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				
				list.add(itVO); 
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return list;
	}

	@Override
	public void updatePeoCount(ItVO itVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE_PeoCount);
				
				pstmt.setInt(1, itVO.getItPeocount());
				pstmt.setInt(2, itVO.getItNo());
				pstmt.executeUpdate();
				
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());			
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			
		
		
	}

}
