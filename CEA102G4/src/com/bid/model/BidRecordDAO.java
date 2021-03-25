package com.bid.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.itinerary.model.ItVO;

public class BidRecordDAO implements BidRecordDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	private static final String GET_ONE_STMT_BY_ITNO = "SELECT * FROM bid_record WHERE bid_no = ? ORDER BY bid_price DESC";
	private static final String SET_BID = "SELECT * FROM bid_record WHERE bid_no = ? ORDER BY bid_price DESC";

	@Override
	public void insert(BidRecordVO bidrecordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SET_BID);

			pstmt.setInt(1, bidrecordVO.getMemId());   //這個輸入得從已存在行程去撈
			pstmt.setInt(2, bidrecordVO.getBidNo());
			pstmt.setInt(3, bidrecordVO.getBidPrice());
		
			pstmt.executeUpdate();
			
								

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
	public BidRecordVO findByPrimaryKey(Integer bidrecNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BidRecordVO findBymemId(Integer memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BidRecordVO> findBybidNo(Integer bidNo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BidRecordVO> list = new ArrayList<BidRecordVO>();
		BidRecordVO bidrVO = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_ITNO);

			pstmt.setInt(1, bidNo);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bidrVO = new BidRecordVO();
				bidrVO.setBidNo(bidNo);
				bidrVO.setBidrecNo(rs.getInt("bidrec_no"));
				bidrVO.setMemId(rs.getInt("mem_id"));
				bidrVO.setBidPrice(rs.getInt("bid_price"));
				bidrVO.setBidTime(rs.getTimestamp("bid_time"));			
			
				list.add(bidrVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	
	}

	@Override
	public List<BidRecordVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
