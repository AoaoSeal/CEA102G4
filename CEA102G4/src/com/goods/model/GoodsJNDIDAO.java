package com.goods.model;

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

import com.goods.model.GoodsVO;

import jdbc.util.CompositeQuery.jdbcUtil_CompositeQuery_Goods;

public class GoodsJNDIDAO implements GoodsDAO_interface {

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
			"INSERT INTO goods (gc_no,mem_id,gd_name,gd_price,gd_qty,gd_text,gd_mediumblob,gd_status,gd_shelf) VALUES (?, ?, ?, ?, ?, ?,?,?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT gd_no,gc_no,mem_id,gd_name,gd_price,gd_date,gd_qty,gd_text,gd_mediumblob,gd_status,gd_shelf FROM goods order by gd_no desc";
		private static final String GET_ALL_STMT2 = 
			"SELECT gd_no,gc_no,mem_id,gd_name,gd_price,gd_date,gd_qty,gd_text,gd_mediumblob,gd_status,gd_shelf FROM goods where mem_id = ? order by gd_no desc";
		private static final String GET_ONE_STMT = 
			"SELECT gd_no,gc_no,mem_id,gd_name,gd_price,gd_date,gd_qty,gd_text,gd_mediumblob,gd_status,gd_shelf FROM goods where gd_no = ?";
		private static final String DELETE = 
			"UPDATE goods set  gd_shelf=3 where gd_no = ?";
		private static final String UPDATE = 
			"UPDATE goods set gc_no=?, mem_id=?, gd_name=?, gd_price=?,  gd_qty=?, gd_text=?, gd_mediumblob=?, gd_status=?, gd_shelf=? where gd_no = ?";
	@Override
	public void insert(GoodsVO goodsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, goodsVO.getGc_no());
			pstmt.setInt(2, goodsVO.getMem_id());
			pstmt.setString(3, goodsVO.getGd_name());
			pstmt.setInt(4, goodsVO.getGd_price());
			pstmt.setInt(5, goodsVO.getGd_qty());
			pstmt.setString(6, goodsVO.getGd_text());
			pstmt.setString(7, goodsVO.getGd_mediumblob());
			pstmt.setInt(8, goodsVO.getGd_status());
			pstmt.setInt(9, goodsVO.getGd_shelf());

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
	public void update(GoodsVO goodsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, goodsVO.getGc_no());
			pstmt.setInt(2, goodsVO.getMem_id());
			pstmt.setString(3, goodsVO.getGd_name());
			pstmt.setInt(4, goodsVO.getGd_price());
			pstmt.setInt(5, goodsVO.getGd_qty());
			pstmt.setString(6, goodsVO.getGd_text());
			pstmt.setString(7, goodsVO.getGd_mediumblob());
			pstmt.setInt(8, goodsVO.getGd_status());
			pstmt.setInt(9, goodsVO.getGd_shelf());
			pstmt.setInt(10, goodsVO.getGd_no());

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
	public void delete(Integer gd_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, gd_no);

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
	public GoodsVO findByPrimaryKey(Integer gd_no) {
		GoodsVO goodsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, gd_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				goodsVO = new GoodsVO();
				goodsVO.setGd_no(rs.getInt("gd_no"));
				goodsVO.setGc_no(rs.getInt("gc_no"));
				goodsVO.setMem_id(rs.getInt("mem_id"));
				goodsVO.setGd_name(rs.getString("gd_name"));
				goodsVO.setGd_price(rs.getInt("gd_price"));
				goodsVO.setGd_date(rs.getTimestamp("gd_date"));
				goodsVO.setGd_qty(rs.getInt("gd_qty"));
				goodsVO.setGd_text(rs.getString("gd_text"));
				goodsVO.setGd_mediumblob(rs.getString("gd_mediumblob"));
				goodsVO.setGd_status(rs.getInt("gd_status"));
				goodsVO.setGd_shelf(rs.getInt("gd_shelf"));
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
		return goodsVO;
	}

	@Override
	public List<GoodsVO> getAll() {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if(rs.getInt("gd_shelf")!=3) {
							goodsVO = new GoodsVO();
							goodsVO.setGd_no(rs.getInt("gd_no"));
							goodsVO.setGc_no(rs.getInt("gc_no"));
							goodsVO.setMem_id(rs.getInt("mem_id"));
							goodsVO.setGd_name(rs.getString("gd_name"));
							goodsVO.setGd_price(rs.getInt("gd_price"));
							goodsVO.setGd_date(rs.getTimestamp("gd_date"));
							goodsVO.setGd_qty(rs.getInt("gd_qty"));
							goodsVO.setGd_text(rs.getString("gd_text"));
							goodsVO.setGd_mediumblob(rs.getString("gd_mediumblob"));
							goodsVO.setGd_status(rs.getInt("gd_status"));
							goodsVO.setGd_shelf(rs.getInt("gd_shelf"));
							
							list.add(goodsVO);
						}
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
	public List<GoodsVO> getAll2() {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if(rs.getInt("gd_shelf")!=3) {
					if(rs.getInt("gd_shelf")!=0) {
						if(rs.getInt("gd_qty")!=0) {
				goodsVO = new GoodsVO();
				goodsVO.setGd_no(rs.getInt("gd_no"));
				goodsVO.setGc_no(rs.getInt("gc_no"));
				goodsVO.setMem_id(rs.getInt("mem_id"));
				goodsVO.setGd_name(rs.getString("gd_name"));
				goodsVO.setGd_price(rs.getInt("gd_price"));
				goodsVO.setGd_date(rs.getTimestamp("gd_date"));
				goodsVO.setGd_qty(rs.getInt("gd_qty"));
				goodsVO.setGd_text(rs.getString("gd_text"));
				goodsVO.setGd_mediumblob(rs.getString("gd_mediumblob"));
				goodsVO.setGd_status(rs.getInt("gd_status"));
				goodsVO.setGd_shelf(rs.getInt("gd_shelf"));
				
				list.add(goodsVO);
						}
					}
				}
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
	public List<GoodsVO> getAll3(Integer mem_id) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT2);
			pstmt.setInt(1, mem_id);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if(rs.getInt("gd_shelf")!=3) {
					
					
					goodsVO = new GoodsVO();
					goodsVO.setGd_no(rs.getInt("gd_no"));
					goodsVO.setGc_no(rs.getInt("gc_no"));
					goodsVO.setMem_id(rs.getInt("mem_id"));
					goodsVO.setGd_name(rs.getString("gd_name"));
					goodsVO.setGd_price(rs.getInt("gd_price"));
					goodsVO.setGd_date(rs.getTimestamp("gd_date"));
					goodsVO.setGd_qty(rs.getInt("gd_qty"));
					goodsVO.setGd_text(rs.getString("gd_text"));
					goodsVO.setGd_mediumblob(rs.getString("gd_mediumblob"));
					goodsVO.setGd_status(rs.getInt("gd_status"));
					goodsVO.setGd_shelf(rs.getInt("gd_shelf"));
					
					list.add(goodsVO);
				}
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
	public List<GoodsVO> getAll(Map<String, String[]> map) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		GoodsVO goodsVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			con = ds.getConnection();
				String finalSQL = "select * from goods "
				          + jdbcUtil_CompositeQuery_Goods.get_WhereCondition(map)
				          + "order by gd_no desc";
					pstmt = con.prepareStatement(finalSQL);
					System.out.println("●●finalSQL(by DAO) = "+finalSQL);
					rs = pstmt.executeQuery();
		
				while (rs.next()) {
					if(rs.getInt("gd_shelf")!=3) {
						if(rs.getInt("gd_shelf")!=0) {
							if(rs.getInt("gd_qty")!=0) {
					goodsVO = new GoodsVO();
					goodsVO.setGd_no(rs.getInt("gd_no"));
					goodsVO.setGc_no(rs.getInt("gc_no"));
					goodsVO.setMem_id(rs.getInt("mem_id"));
					goodsVO.setGd_name(rs.getString("gd_name"));
					goodsVO.setGd_price(rs.getInt("gd_price"));
					goodsVO.setGd_date(rs.getTimestamp("gd_date"));
					goodsVO.setGd_qty(rs.getInt("gd_qty"));
					goodsVO.setGd_text(rs.getString("gd_text"));
					goodsVO.setGd_mediumblob(rs.getString("gd_mediumblob"));
					goodsVO.setGd_status(rs.getInt("gd_status"));
					goodsVO.setGd_shelf(rs.getInt("gd_shelf"));
					list.add(goodsVO); // Store the row in the List
							}
						}
					}
				}
			
			// Handle any SQL errors
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
	
	public static void main(String[] args) {

//		GoodsDAO dao = new GoodsDAO();
//
//		GoodsVO goodsVO1 = new GoodsVO();
//		goodsVO1.setGc_no(new Integer(1));
//		goodsVO1.setMem_id(new Integer(1));
//		goodsVO1.setGd_name("Haha");
//		goodsVO1.setGd_price(new Integer(100));
//		goodsVO1.setGd_date(java.sql.Date.valueOf("2021-01-01"));
//		goodsVO1.setGd_qty(new Integer(1));
//		goodsVO1.setGd_text("Hehe");
//		goodsVO1.setGd_status(new Integer(1));
//		goodsVO1.setGd_shelf(new Integer(1));
//		dao.insert(goodsVO1);
//
//		GoodsVO goodsVO2 = new GoodsVO();
//		goodsVO2.setGd_no(3);
//		goodsVO2.setGc_no(new Integer(2));
//		goodsVO2.setMem_id(new Integer(2));
//		goodsVO2.setGd_name("Haha2");
//		goodsVO2.setGd_price(new Integer(200));
//		goodsVO2.setGd_date(java.sql.Date.valueOf("2021-01-01"));
//		goodsVO2.setGd_qty(new Integer(2));
//		goodsVO2.setGd_text("Hehe2");
//		goodsVO2.setGd_status(new Integer(2));
//		goodsVO2.setGd_shelf(new Integer(2));
//		dao.update(goodsVO2);
//
//		dao.delete(3);
//
//		GoodsVO goodsVO3 = dao.findByPrimaryKey(25001);
//		System.out.print(goodsVO3.getGd_no() + ",");
//		System.out.print(goodsVO3.getGc_no() + ",");
//		System.out.print(goodsVO3.getMem_id() + ",");
//		System.out.print(goodsVO3.getGd_name() + ",");
//		System.out.print(goodsVO3.getGd_price() + ",");
//		System.out.print(goodsVO3.getGd_date() + ",");
//		System.out.print(goodsVO3.getGd_qty() + ",");
//		System.out.print(goodsVO3.getGd_text() + ",");
//		System.out.print(goodsVO3.getGd_status() + ",");
//		System.out.println(goodsVO3.getGd_shelf());
//		System.out.println("---------------------");
//
//		List<GoodsVO> list = dao.getAll();
//		for (GoodsVO aGoods : list) {
//			System.out.print(aGoods.getGd_no() + ",");
//			System.out.print(aGoods.getGc_no() + ",");
//			System.out.print(aGoods.getMem_id() + ",");
//			System.out.print(aGoods.getGd_name() + ",");
//			System.out.print(aGoods.getGd_price() + ",");
//			System.out.print(aGoods.getGd_date() + ",");
//			System.out.print(aGoods.getGd_qty() + ",");
//			System.out.print(aGoods.getGd_text() + ",");
//			System.out.print(aGoods.getGd_status() + ",");
//			System.out.println(aGoods.getGd_shelf());
//			System.out.println();
//		}
	}

}
