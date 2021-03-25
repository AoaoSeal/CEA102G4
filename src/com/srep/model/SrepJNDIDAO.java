package com.srep.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SrepJNDIDAO implements SrepDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = 
			"INSERT INTO seller_report (or_no,mem_id,srep_time,srep_text,srep_mediumblob,srep_status) VALUES (?, ?, ?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT srep_no,or_no,mem_id,srep_time,srep_text,srep_mediumblob,srep_status FROM seller_report order by srep_no";
		private static final String GET_ONE_STMT = 
			"SELECT srep_no,or_no,mem_id,srep_time,srep_text,srep_mediumblob,srep_status FROM seller_report where srep_no = ?";
		private static final String DELETE = 
			"DELETE FROM seller_report where srep_no = ?";
		private static final String UPDATE = 
			"UPDATE seller_report set or_no=?, mem_id=?,srep_time=?, srep_text=?, srep_mediumblob=?, srep_status=? where srep_no = ?";
	
	
	@Override
	public void insert(SrepVO srepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, srepVO.getOr_no());
			pstmt.setInt(2, srepVO.getMem_id());
			pstmt.setDate(3, srepVO.getSrep_time());
			pstmt.setString(4, srepVO.getSrep_text());
			pstmt.setString(5, srepVO.getSrep_mediumblob());
			pstmt.setInt(6, srepVO.getSrep_status());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void update(SrepVO srepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, srepVO.getOr_no());
			pstmt.setInt(2, srepVO.getMem_id());
			pstmt.setDate(5, srepVO.getSrep_time());
			pstmt.setString(7, srepVO.getSrep_text());
			pstmt.setString(8, srepVO.getSrep_mediumblob());
			pstmt.setInt(9, srepVO.getSrep_status());
			pstmt.setInt(11, srepVO.getSrep_no());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public void delete(Integer srep_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, srep_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public SrepVO findByPrimaryKey(Integer srep_no) {
		SrepVO srepVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, srep_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				srepVO = new SrepVO();
				srepVO.setSrep_no(rs.getInt("srep_no"));
				srepVO.setOr_no(rs.getInt("or_no"));
				srepVO.setMem_id(rs.getInt("mem_id"));
				srepVO.setSrep_time(rs.getDate("srep_time"));
				srepVO.setSrep_text(rs.getString("srep_text"));
				srepVO.setSrep_mediumblob(rs.getString("srep_mediumblob"));
				srepVO.setSrep_status(rs.getInt("srep_status"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
		return srepVO;
	}

	@Override
	public List<SrepVO> getAll() {
		List<SrepVO> list = new ArrayList<SrepVO>();
		SrepVO srepVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();;

			while (rs.next()) {
				
				srepVO = new SrepVO();
				srepVO.setSrep_no(rs.getInt("srep_no"));
				srepVO.setOr_no(rs.getInt("or_no"));
				srepVO.setMem_id(rs.getInt("mem_id"));
				srepVO.setSrep_time(rs.getDate("srep_time"));
				srepVO.setSrep_text(rs.getString("srep_text"));
				srepVO.setSrep_mediumblob(rs.getString("srep_mediumblob"));
				srepVO.setSrep_status(rs.getInt("srep_status"));
				list.add(srepVO);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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

	public static void main(String[] args) {

		SrepDAO dao = new SrepDAO();

		SrepVO srepVO1 = new SrepVO();
		srepVO1.setOr_no(new Integer(1));
		srepVO1.setMem_id(new Integer(1));
		srepVO1.setSrep_time(java.sql.Date.valueOf("2021-01-01"));
		srepVO1.setSrep_text("Hehe");
		srepVO1.setSrep_status(new Integer(1));
		dao.insert(srepVO1);

		SrepVO srepVO2 = new SrepVO();
		srepVO2.setSrep_no(3);
		srepVO2.setOr_no(new Integer(2));
		srepVO2.setMem_id(new Integer(2));
		srepVO2.setSrep_time(java.sql.Date.valueOf("2021-01-01"));
		srepVO2.setSrep_text("Hehe2");
		srepVO2.setSrep_status(new Integer(2));
		dao.update(srepVO2);

		dao.delete(3);

		SrepVO srepVO3 = dao.findByPrimaryKey(25001);
		System.out.print(srepVO3.getSrep_no() + ",");
		System.out.print(srepVO3.getOr_no() + ",");
		System.out.print(srepVO3.getMem_id() + ",");
		System.out.print(srepVO3.getSrep_time() + ",");
		System.out.print(srepVO3.getSrep_text() + ",");
		System.out.print(srepVO3.getSrep_status() + ",");
		System.out.println("---------------------");

		List<SrepVO> list = dao.getAll();
		for (SrepVO aSrep : list) {
			System.out.print(aSrep.getSrep_no() + ",");
			System.out.print(aSrep.getOr_no() + ",");
			System.out.print(aSrep.getMem_id() + ",");
			System.out.print(aSrep.getSrep_time() + ",");
			System.out.print(aSrep.getSrep_text() + ",");
			System.out.print(aSrep.getSrep_status() + ",");
			System.out.println();
		}
	}
}
