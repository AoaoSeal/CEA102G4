package com.gc.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;



import com.goods.model.GoodsVO;

public class GcDAO implements GcDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO goods_category (gc_name) VALUES (?)";
	private static final String GET_ALL_STMT = "SELECT gc_no,gc_name FROM goods_category";
	private static final String GET_ONE_STMT = "SELECT gc_name FROM goods_category where gc_no = ?";
	private static final String GET_Goods_ByGc_no_STMT = "SELECT gc_no,mem_id,gd_name,gd_price,gd_date,gd_qty,gd_text,gd_mediumblob,gd_status,gd_shelf FROM goods where gc_no = ? order by gd_name";
	private static final String UPDATE = "UPDATE goods_category set gc_name=? where gc_no = ?";

	@Override
	public void insert(GcVO gcVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, gcVO.getGc_no());
			pstmt.setString(2, gcVO.getGc_name());

			pstmt.executeUpdate("set auto_increment_offset=24001;");
			pstmt.executeUpdate("set auto_increment_increment=1;");
			pstmt.executeUpdate();

			// Handle any SQL errors
		}	catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		}  catch (SQLException se) {
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
	public void update(GcVO gcVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, gcVO.getGc_no());
			pstmt.setString(2, gcVO.getGc_name());

			pstmt.executeUpdate();

			// Handle any SQL errors
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
	public GcVO findByPrimaryKey(Integer gc_no) {

		GcVO gcVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, gc_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				gcVO = new GcVO();
				gcVO.setGc_no(rs.getInt("gc_no"));
				gcVO.setGc_name(rs.getString("gc_name"));
			}

			// Handle any SQL errors
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
		return gcVO;
	}

	@Override
	public List<GcVO> getAll() {
		List<GcVO> list = new ArrayList<GcVO>();
		GcVO gcVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				gcVO = new GcVO();
				gcVO.setGc_no(rs.getInt("gc_no"));
				gcVO.setGc_name(rs.getString("gc_name"));
				list.add(gcVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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

	@Override
	public Set<GoodsVO> getGoodsByGc_no(Integer gc_no) {
		Set<GoodsVO> set = new LinkedHashSet<GoodsVO>();
		GoodsVO goodsVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_Goods_ByGc_no_STMT);
			pstmt.setInt(1, gc_no);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
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
				goodsVO.setGd_shelf(rs.getInt("gd_shelf"));;
				set.add(goodsVO); // Store the row in the vector
			}
	
			// Handle any SQL errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
		return set;
	}
}
