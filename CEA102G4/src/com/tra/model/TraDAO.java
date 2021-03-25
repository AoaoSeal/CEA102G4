package com.tra.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.member.model.MemberVO;


public class TraDAO implements TraDAO_interface {
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
			"INSERT INTO transaction_record (mem_id,tra_action,tra_price,tra_status) VALUES (?, ?, ?, ?)";
		private static final String SAVE_PICK=
			"UPDATE member_list set tra_bal=? where mem_id=?";
		private static final String GET_ALL_STMT = 
			"SELECT tra_no,mem_id,tra_action,tra_price,tra_status,tra_time FROM transaction_record order by tra_time desc";
		private static final String GET_ALL_STMT2 = 
			"SELECT tra_no,mem_id,tra_action,tra_price,tra_status,tra_time FROM transaction_record where mem_id=? order by tra_time desc";
		private static final String GET_ONE_STMT = 
			"SELECT tra_no,mem_id,tra_action,tra_price,tra_status,tra_time  FROM transaction_record where tra_no = ?";
		private static final String UPDATE = 
			"UPDATE transaction_record set  mem_id=?, tra_action=?, tra_price=?, tra_status=? where tra_no = ?";
	
	@Override
	public void insert(TraVO traVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, traVO.getMem_id());
			pstmt.setInt(2, traVO.getTra_action());
			pstmt.setInt(3, traVO.getTra_price());
			pstmt.setInt(4, traVO.getTra_status());

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
	public void update(TraVO traVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, traVO.getMem_id());
			pstmt.setInt(2, traVO.getTra_action());
			pstmt.setInt(3, traVO.getTra_price());
			pstmt.setInt(4, traVO.getTra_status());
			pstmt.setInt(5, traVO.getTra_no());

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
	public TraVO findByPrimaryKey(Integer tra_no) {
		TraVO traVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, tra_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				traVO = new TraVO();
				traVO.setTra_no(rs.getInt("tra_no"));
				traVO.setMem_id(rs.getInt("mem_id"));
				traVO.setTra_action(rs.getInt("tra_action"));
				traVO.setTra_price(rs.getInt("tra_price"));
				traVO.setTra_status(rs.getInt("tra_status"));
				traVO.setTra_time(rs.getTimestamp("tra_time"));
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
		return traVO;
	}

	@Override
	public List<TraVO> getAll() {
		List<TraVO> list = new ArrayList<TraVO>();
		TraVO traVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				traVO = new TraVO();
				traVO.setTra_no(rs.getInt("tra_no"));
				traVO.setMem_id(rs.getInt("mem_id"));
				traVO.setTra_action(rs.getInt("tra_action"));
				traVO.setTra_price(rs.getInt("tra_price"));
				traVO.setTra_status(rs.getInt("tra_status"));
				traVO.setTra_time(rs.getTimestamp("tra_time"));
				list.add(traVO);
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
	
	@Override
	public List<TraVO> getAll3(Integer mem_id) {
		List<TraVO> list = new ArrayList<TraVO>();
		TraVO traVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT2);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				traVO = new TraVO();
				traVO.setTra_no(rs.getInt("tra_no"));
				traVO.setMem_id(rs.getInt("mem_id"));
				traVO.setTra_action(rs.getInt("tra_action"));
				traVO.setTra_price(rs.getInt("tra_price"));
				traVO.setTra_status(rs.getInt("tra_status"));
				traVO.setTra_time(rs.getTimestamp("tra_time"));
				list.add(traVO);
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

	@Override
	public void savePick(MemberVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SAVE_PICK);
			
			pstmt.setInt(1, memVO.getTraBal());
			pstmt.setInt(2, memVO.getMemId());
			
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
	
	public static void main(String[] args) {

//		TraDAO dao = new TraDAO();
//
//		TraVO traVO1 = new TraVO();
//		traVO1.setTra_no(new Integer(4001));
//		traVO1.setMem_id(new Integer(1001));
//		traVO1.setTra_action(new Integer(1));
//		traVO1.setTra_price(new Integer(100));
//		traVO1.setTra_status(new Integer(1));
//		traVO1.setTra_time(java.sql.Date.valueOf("2021-01-01"));
//		dao.insert(traVO1);
//
//		TraVO traVO2 = new TraVO();
//		traVO2.setTra_no(new Integer(4002));
//		traVO2.setMem_id(new Integer(1002));
//		traVO2.setTra_action(new Integer(1));
//		traVO2.setTra_price(new Integer(100));
//		traVO2.setTra_status(new Integer(1));
//		traVO2.setTra_time(java.sql.Date.valueOf("2021-01-01"));
//		dao.update(traVO2);
//
//
//		TraVO traVO3 = dao.findByPrimaryKey(4001);
//		System.out.print(traVO3.getTra_no() + ",");
//		System.out.print(traVO3.getMem_id() + ",");
//		System.out.print(traVO3.getTra_action() + ",");
//		System.out.print(traVO3.getTra_price() + ",");
//		System.out.print(traVO3.getTra_time() + ",");
//		System.out.print(traVO3.getTra_status());
//		System.out.println("---------------------");
//
//		List<TraVO> list = dao.getAll();
//		for (TraVO aTra : list) {
//			System.out.print(aTra.getTra_no() + ",");
//			System.out.print(aTra.getMem_id() + ",");
//			System.out.print(aTra.getTra_action() + ",");
//			System.out.print(aTra.getTra_price() + ",");
//			System.out.print(aTra.getTra_time() + ",");
//			System.out.println(aTra.getTra_status());
//			System.out.println();
//		}
	}

	
}
