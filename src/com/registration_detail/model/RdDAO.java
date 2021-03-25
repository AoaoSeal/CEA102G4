package com.registration_detail.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.itinerary.model.ItVO;

public class RdDAO implements RdDAO_interface{
	
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
			"INSERT INTO registration_detail (rm_no, att_name, att_phone, att_birth, emer_name, emer_phone, it_no) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String FIND_ONE_STMT = 
			"SELECT rd_no, rm_no, att_name, att_phone, att_birth, emer_name, emer_phone, it_no where rm_no = ?";	
	private static final String GET_ALL = 
			"SELECT rd_no, rm_no, att_name, att_phone, DATE_FORMAT(att_birth, '%Y-%m-%d'), emer_name, emer_phone, it_no FROM registration_detail order by rd_no";		
	@Override
	public void insert(ItVO rdVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ItVO rdVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer rdNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RdVO findByRmNo(Integer rmNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RdVO rdVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_ONE_STMT);
			pstmt.setInt(1, rmNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rdVO = new RdVO();
				rdVO.setRdNo(rs.getInt("rd_no"));
				rdVO.setRmNo(rs.getInt("rm_no"));
				rdVO.setAttName(rs.getString("att_name"));
				rdVO.setAttPhone(rs.getString("att_phone"));
				rdVO.setAttBirth(rs.getString("att_birth"));
				rdVO.setEmerName(rs.getString("emer_name"));
				rdVO.setEmerPhone(rs.getString("emer_phone"));
				rdVO.setItNo(rs.getInt("it_no"));

				
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
		return rdVO;

	}

	@Override
	public List<RdVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RdVO> list = new ArrayList<RdVO>();
		RdVO rdVO = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				

				rdVO = new RdVO();
				rdVO.setRdNo(rs.getInt("rd_no"));
				rdVO.setRmNo(rs.getInt("rm_no"));
				rdVO.setAttName(rs.getString("att_name"));
				rdVO.setAttPhone(rs.getString("att_phone"));
				rdVO.setAttBirth(rs.getString("DATE_FORMAT(att_birth, '%Y-%m-%d')"));
				rdVO.setEmerName(rs.getString("emer_name"));
				rdVO.setEmerPhone(rs.getString("emer_phone"));
				rdVO.setItNo(rs.getInt("it_no"));
				
				list.add(rdVO); 
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
	public List<RdVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert2(RdVO rdVO, Connection con) {
		
		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(INSERT);
     		 
			pstmt.setInt(1, rdVO.getRmNo());
			pstmt.setString(2, rdVO.getAttName());
			pstmt.setString(3, rdVO.getAttPhone());
			pstmt.setString(4, rdVO.getAttBirth());
			pstmt.setString(5, rdVO.getEmerName());
			pstmt.setString(6, rdVO.getEmerPhone());
			pstmt.setInt(7, rdVO.getItNo());
		
			pstmt.executeUpdate();

			
		} catch (SQLException se) {
			if (con != null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-Rd丟出");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
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
		}

	}

	@Override
	public List<RdVO> getAllbyRmNo() {
		// TODO Auto-generated method stub
		return null;
	}

}
