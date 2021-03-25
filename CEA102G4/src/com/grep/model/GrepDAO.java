package com.grep.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.grep.model.GrepDAO;
import com.grep.model.GrepVO;

public class GrepDAO implements GrepDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";
	
	private static final String INSERT_STMT = 
			"INSERT INTO goods_report (gd_no,mem_id,grep_text,grep_status) VALUES (?, ?, ?, ?)";
		private static final String GET_ALL_STMT = 
			"SELECT grep_no,gd_no,mem_id,grep_time,grep_text,grep_status FROM goods_report order by grep_no";
		private static final String GET_ALL_STMTBYMEMID = 
				"SELECT grep_no,gd_no,mem_id,grep_time,grep_text,grep_status FROM goods_report where mem_id=? order by grep_no";
		private static final String GET_ONE_STMT = 
			"SELECT grep_no,gd_no,mem_id,grep_time,grep_text,grep_status FROM goods_report where grep_no = ?";
		private static final String DELETE = 
			"DELETE FROM goods_report where grep_no = ?";
		private static final String UPDATE = 
			"UPDATE goods_report set gd_no=?, mem_id=?, grep_text=?, grep_status=? where grep_no = ?";
	
	@Override
	public void insert(GrepVO grepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, grepVO.getGd_no());
			pstmt.setInt(2, grepVO.getMem_id());
			pstmt.setString(3, grepVO.getGrep_text());
			pstmt.setInt(4, grepVO.getGrep_status());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
	public void update(GrepVO grepVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, grepVO.getGd_no());
			pstmt.setInt(2, grepVO.getMem_id());
			pstmt.setString(3, grepVO.getGrep_text());
			pstmt.setInt(4, grepVO.getGrep_status());
			pstmt.setInt(5, grepVO.getGrep_no());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
	public void delete(Integer grep_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, grep_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
	public GrepVO findByPrimaryKey(Integer grep_no) {
		GrepVO grepVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, grep_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				grepVO = new GrepVO();
				grepVO.setGrep_no(rs.getInt("grep_no"));
				grepVO.setGd_no(rs.getInt("gd_no"));
				grepVO.setMem_id(rs.getInt("mem_id"));
				grepVO.setGrep_time(rs.getDate("grep_time"));
				grepVO.setGrep_text(rs.getString("grep_text"));
				grepVO.setGrep_status(rs.getInt("grep_status"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return grepVO;
	}

	@Override
	public List<GrepVO> getAll() {
		List<GrepVO> list = new ArrayList<GrepVO>();
		GrepVO grepVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				grepVO = new GrepVO();
				grepVO.setGrep_no(rs.getInt("grep_no"));
				grepVO.setGd_no(rs.getInt("gd_no"));
				grepVO.setMem_id(rs.getInt("mem_id"));
				grepVO.setGrep_time(rs.getDate("grep_time"));
				grepVO.setGrep_text(rs.getString("grep_text"));
				grepVO.setGrep_status(rs.getInt("grep_status"));
				list.add(grepVO);
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
	
	
	
	@Override
	public List<GrepVO> getAll1(Integer mem_id) {
		List<GrepVO> list = new ArrayList<GrepVO>();
		GrepVO grepVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMTBYMEMID);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				grepVO = new GrepVO();
				grepVO.setGrep_no(rs.getInt("grep_no"));
				grepVO.setGd_no(rs.getInt("gd_no"));
				grepVO.setMem_id(rs.getInt("mem_id"));
				grepVO.setGrep_time(rs.getDate("grep_time"));
				grepVO.setGrep_text(rs.getString("grep_text"));
				grepVO.setGrep_status(rs.getInt("grep_status"));
				list.add(grepVO);
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
//
//	public static void main(String[] args) {
//
//		GrepDAO dao = new GrepDAO();
//
//		GrepVO grepVO1 = new GrepVO();
//		grepVO1.setGd_no(new Integer(1));
//		grepVO1.setMem_id(new Integer(1));
//		grepVO1.setGrep_time(java.sql.Date.valueOf("2021-01-01"));
//		grepVO1.setGrep_text("Hehe");
//		grepVO1.setGrep_status(new Integer(1));
//		dao.insert(grepVO1);
//
//		GrepVO grepVO2 = new GrepVO();
//		grepVO2.setGrep_no(3);
//		grepVO2.setGd_no(new Integer(2));
//		grepVO2.setMem_id(new Integer(2));
//		grepVO2.setGrep_time(java.sql.Date.valueOf("2021-01-01"));
//		grepVO2.setGrep_text("Hehe2");
//		grepVO2.setGrep_status(new Integer(2));
//		dao.update(grepVO2);
//
//		dao.delete(3);
//
//		GrepVO grepVO3 = dao.findByPrimaryKey(25001);
//		System.out.print(grepVO3.getGrep_no() + ",");
//		System.out.print(grepVO3.getGd_no() + ",");
//		System.out.print(grepVO3.getMem_id() + ",");
//		System.out.print(grepVO3.getGrep_time() + ",");
//		System.out.print(grepVO3.getGrep_text() + ",");
//		System.out.print(grepVO3.getGrep_status() + ",");
//		System.out.println("---------------------");
//
//		List<GrepVO> list = dao.getAll();
//		for (GrepVO aGrep : list) {
//			System.out.print(aGrep.getGrep_no() + ",");
//			System.out.print(aGrep.getGd_no() + ",");
//			System.out.print(aGrep.getMem_id() + ",");
//			System.out.print(aGrep.getGrep_time() + ",");
//			System.out.print(aGrep.getGrep_text() + ",");
//			System.out.print(aGrep.getGrep_status() + ",");
//			System.out.println();
//		}
//	}

}
