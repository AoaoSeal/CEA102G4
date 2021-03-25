package com.or.model;

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

import com.goods.model.GoodsVO;
import com.member.model.MemberVO;
import com.or.model.OrDAO;
import com.or.model.OrVO;

public class OrDAO implements OrDAO_interface {
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
			"INSERT INTO order_master (mem_id,gd_no,or_name,or_price,or_phone,or_address,or_status) VALUES (?, ?, ?, ?,?, ?, ?)";
		private static final String SALE=
			"UPDATE goods set gd_qty=? where gd_no=?";
		private static final String PAY=
			"UPDATE member_list set tra_bal=? where mem_id=?";
		private static final String GET_ALL_STMT = 
			"SELECT or_no,mem_id,gd_no,or_name,or_price,or_phone,or_address,or_time,or_status FROM order_master order by or_no desc";
		private static final String GET_ALL_STMT2 = 
			"SELECT or_no,mem_id,gd_no,or_name,or_price,or_phone,or_address,or_time,or_status FROM order_master where mem_id=? order by or_no desc";
		private static final String GET_ALL_STMT3 = 
			"SELECT G.MEM_ID AS SELLER,OR_NO, M.GD_NO , OR_NAME,M.MEM_ID AS BUYER ,OR_PRICE,OR_PHONE,OR_ADDRESS,OR_TIME,OR_STATUS FROM ORDER_MASTER M LEFT JOIN GOODS G ON M.GD_NO = G.GD_NO WHERE G.MEM_ID = ?  order by or_no desc";
		private static final String GET_ONE_STMT = 
			"SELECT or_no,mem_id,gd_no,or_name,or_price,or_phone,or_address,or_time,or_status FROM order_master where or_no = ?";
		private static final String UPDATE = 
			"UPDATE order_master set mem_id=?, gd_no=?, or_name=?, or_price=?,or_phone=?, or_address=?, or_status=? where or_no = ?";
		private static final String SHIP= 
			"UPDATE order_master set mem_id=?, gd_no=?, or_name=?, or_price=?,or_phone=?, or_address=?, or_status=? where or_no = ?";
		
		
	@Override
	public void insert(OrVO orVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, orVO.getMem_id());
			pstmt.setInt(2, orVO.getGd_no());
			pstmt.setString(3, orVO.getOr_name());
			pstmt.setInt(4, orVO.getOr_price());
			pstmt.setString(5, orVO.getOr_phone());
			pstmt.setString(6, orVO.getOr_address());
			pstmt.setInt(7, orVO.getOr_status());
			
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
	public void sale(GoodsVO goodsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SALE);
			
			pstmt.setInt(1, goodsVO.getGd_qty());
			pstmt.setInt(2, goodsVO.getGd_no());
			
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
	public void pay(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(PAY);
			
			pstmt.setInt(1, memberVO.getTraBal());
			pstmt.setInt(2, memberVO.getMemId());
			
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
	public void update(OrVO orVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, orVO.getMem_id());
			pstmt.setInt(2, orVO.getGd_no());
			pstmt.setString(3, orVO.getOr_name());
			pstmt.setInt(4, orVO.getOr_price());
			pstmt.setString(5, orVO.getOr_phone());
			pstmt.setString(6, orVO.getOr_address());
			pstmt.setInt(7, orVO.getOr_status());
			pstmt.setInt(8, orVO.getOr_no());

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
	public void ship(OrVO orVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(SHIP);
			
			pstmt.setInt(1, orVO.getMem_id());
			pstmt.setInt(2, orVO.getGd_no());
			pstmt.setString(3, orVO.getOr_name());
			pstmt.setInt(4, orVO.getOr_price());
			pstmt.setString(5, orVO.getOr_phone());
			pstmt.setString(6, orVO.getOr_address());
			pstmt.setInt(7, orVO.getOr_status());
			pstmt.setInt(8, orVO.getOr_no());
			
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
	public OrVO findByPrimaryKey(Integer or_no) {
		OrVO orVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, or_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				orVO = new OrVO();
				orVO.setOr_no(rs.getInt("or_no"));
				orVO.setMem_id(rs.getInt("mem_id"));
				orVO.setGd_no(rs.getInt("gd_no"));
				orVO.setOr_name(rs.getString("or_name"));
				orVO.setOr_price(rs.getInt("or_price"));
				orVO.setOr_phone(rs.getString("or_phone"));
				orVO.setOr_address(rs.getString("or_address"));
				orVO.setOr_time(rs.getTimestamp("or_time"));
				orVO.setOr_status(rs.getInt("or_status"));
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
		return orVO;
	}

	@Override
	public List<OrVO> getAll() {
		List<OrVO> list = new ArrayList<OrVO>();
		OrVO orVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				orVO = new OrVO();
				orVO.setOr_no(rs.getInt("or_no"));
				orVO.setMem_id(rs.getInt("mem_id"));
				orVO.setGd_no(rs.getInt("gd_no"));
				orVO.setOr_name(rs.getString("or_name"));
				orVO.setOr_price(rs.getInt("or_price"));
				orVO.setOr_phone(rs.getString("or_phone"));
				orVO.setOr_address(rs.getString("or_address"));
				orVO.setOr_time(rs.getTimestamp("or_time"));
				orVO.setOr_status(rs.getInt("or_status"));
				list.add(orVO);
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
	public List<OrVO> getAll3(Integer mem_id) {
		List<OrVO> list = new ArrayList<OrVO>();
		OrVO orVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT2);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				orVO = new OrVO();
				orVO.setOr_no(rs.getInt("or_no"));
				orVO.setMem_id(rs.getInt("mem_id"));
				orVO.setGd_no(rs.getInt("gd_no"));
				orVO.setOr_name(rs.getString("or_name"));
				orVO.setOr_price(rs.getInt("or_price"));
				orVO.setOr_phone(rs.getString("or_phone"));
				orVO.setOr_address(rs.getString("or_address"));
				orVO.setOr_time(rs.getTimestamp("or_time"));
				orVO.setOr_status(rs.getInt("or_status"));
				list.add(orVO);
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
		public List<OrVO2> getAllSeller(Integer mem_id) {
			List<OrVO2> list = new ArrayList<OrVO2>();
			OrVO2 orVO2 = null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT3);
				pstmt.setInt(1, mem_id);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					orVO2 = new OrVO2();
					orVO2.setSeller(rs.getInt("SELLER"));
					orVO2.setOr_no(rs.getInt("OR_NO"));
					orVO2.setBuyer(rs.getInt("BUYER"));
					orVO2.setGd_no(rs.getInt("GD_NO"));
					orVO2.setOr_name(rs.getString("or_name"));
					orVO2.setOr_price(rs.getInt("or_price"));
					orVO2.setOr_phone(rs.getString("or_phone"));
					orVO2.setOr_address(rs.getString("or_address"));
					orVO2.setOr_time(rs.getTimestamp("or_time"));
					orVO2.setOr_status(rs.getInt("or_status"));
					list.add(orVO2);
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

//		OrDAO dao = new OrDAO();
//
//		OrVO orVO1 = new OrVO();
//		orVO1.setMem_id(new Integer(1001));
//		orVO1.setGd_no(new Integer(25001));
//		orVO1.setOr_name("Hehe");
//		orVO1.setOr_price(new Integer(100));
//		orVO1.setOr_phone("0988888888");
//		orVO1.setOr_address("hehs");
//		orVO1.setOr_status(new Integer(0));
//		orVO1.setOr_time(java.sql.Date.valueOf("2021-01-01"));
//		dao.insert(orVO1);
//
//		OrVO orVO2 = new OrVO();
//		orVO2.setOr_no(21001);
//		orVO2.setMem_id(new Integer(1002));
//		orVO2.setGd_no(new Integer(25001));
//		orVO2.setOr_name("Hehe");
//		orVO2.setOr_price(new Integer(100));
//		orVO2.setOr_phone("0988888888");
//		orVO2.setOr_address("hehs");
//		orVO2.setOr_status(new Integer(0));
//		orVO2.setOr_time(java.sql.Date.valueOf("2021-01-01"));
//		dao.update(orVO2);
//
//
//		OrVO orVO3 = dao.findByPrimaryKey(25001);
//		System.out.print(orVO3.getOr_no() + ",");
//		System.out.print(orVO3.getMem_id() + ",");
//		System.out.print(orVO3.getGd_no() + ",");
//		System.out.print(orVO3.getOr_name() + ",");
//		System.out.print(orVO3.getOr_price() + ",");
//		System.out.print(orVO3.getOr_phone() + ",");
//		System.out.print(orVO3.getOr_address() + ",");
//		System.out.print(orVO3.getOr_time() + ",");
//		System.out.print(orVO3.getOr_status());
//		System.out.println("---------------------");
//
//		List<OrVO> list = dao.getAll();
//		for (OrVO aOr : list) {
//			System.out.print(aOr.getOr_no() + ",");
//			System.out.print(aOr.getMem_id() + ",");
//			System.out.print(aOr.getGd_no() + ",");
//			System.out.print(aOr.getOr_name() + ",");
//			System.out.print(aOr.getOr_price() + ",");
//			System.out.print(aOr.getOr_phone() + ",");
//			System.out.print(aOr.getOr_address() + ",");
//			System.out.print(aOr.getOr_time() + ",");
//			System.out.println(aOr.getOr_status());
//			System.out.println();
//		}
	}
}
