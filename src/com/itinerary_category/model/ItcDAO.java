package com.itinerary_category.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.itinerary.model.ItVO;

public class ItcDAO implements ItcDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/tibamountain");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT= "INSERT INTO itinerary_category (itc_name) VALUES(?)";
	private static final String UPDATE = "UPDATE itinerary_category set itc_name=? where itc_no =?";
	private static final String GET_It_ByItcno_STMT = "SELECT it_no, ld_no, itc_no, it_name, it_text, it_textoth, it_pic, it_price, it_peolim, it_peocount, it_date, it_startdate, it_enddate, it_status FROM itinerary WHERE itc_no =? ORDER by it_no";
	private static final String GET_ALL_STMT = "SELECT itc_no, itc_name FROM itinerary_category order by itc_no";
	private static final String GET_ONE_STMT = "SELECT itc_no, itc_name FROM itinerary_category where itc_no = ?";
	@Override
	public void insert(ItcVO itcVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setString(1, itcVO.getItcName());
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured." 
					+ se.getMessage());
		}finally {
			if(pstmt != null) {
				try{
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(ItcVO itcVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, itcVO.getItcName());
			pstmt.setInt(2, itcVO.getItcNo());
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."
		+ se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
				se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(Integer itcNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ItcVO findByPrimaryKey(Integer itcNo) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItcVO itcVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setInt(1, itcNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				itcVO = new ItcVO();
				itcVO.setItcNo(rs.getInt("itc_no"));
				itcVO.setItcName(rs.getString("itc_name"));
			}
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
		
		return itcVO;
	}

	@Override
	public List<ItcVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItcVO> list = new ArrayList<ItcVO>();
		ItcVO itcVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				itcVO = new ItcVO();
				itcVO.setItcNo(rs.getInt("itc_no"));
				itcVO.setItcName(rs.getString("itc_name"));

				list.add(itcVO); 
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
	public Set<ItVO> getItsByItcno(Integer itcNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Set<ItVO> set = new LinkedHashSet<ItVO>();
		ItVO itVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_It_ByItcno_STMT);
			pstmt.setInt(1, itcNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				itVO = new ItVO();
				itVO.setItNo(rs.getInt("it_no"));
				itVO.setLdNo(rs.getInt("ld_no"));
				itVO.setItcNo(rs.getInt("itc_no"));
				itVO.setItName(rs.getString("it_name"));
				itVO.setItText(rs.getString("it_text"));
				itVO.setItTextoth(rs.getString("it_textoth"));
				itVO.setItPic(rs.getBytes("it_pic"));
				itVO.setItPrice(rs.getInt("it_price"));
				itVO.setItPeolim(rs.getInt("it_peolim"));
				itVO.setItPeocount(rs.getInt("it_peocount"));
				itVO.setItDate(rs.getDate("it_date"));
				itVO.setItStartdate(rs.getDate("it_startdate"));
				itVO.setItEnddate(rs.getDate("it_enddate"));
				itVO.setItStatus(rs.getInt("it_status"));
				set.add(itVO);
				
			}
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured." 
					+ se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return set;
	}
}
