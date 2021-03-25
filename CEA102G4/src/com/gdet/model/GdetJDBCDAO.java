package com.gdet.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.gdet.model.GdetVO;
import com.goods.model.GoodsVO;

public class GdetJDBCDAO implements GdetDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO goods_detail (mem_id,gd_no) VALUES (?,?)";
	private static final String GET_ALL_STMT = "SELECT mem_id,gd_no FROM goods_detail";
	private static final String GET_ONE_STMT = "SELECT mem_id,gd_no FROM goods_detail where mem_id=?,gd_no=?";
	private static final String GET_Gdet_ByMem_Gd_STMT = "SELECT mem_id,gc_no FROM goods_detail where mem_id = ?, gd_no=? order by gd_no ";
	private static final String UPDATE = "UPDATE goods_detail set gd_no=? where mem_id = ?";

	@Override
	public void insert(GdetVO gdetVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, gdetVO.getMem_id());
			pstmt.setInt(2, gdetVO.getGd_no());

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
	public void update(GdetVO gdetVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, gdetVO.getMem_id());
			pstmt.setInt(2, gdetVO.getGd_no());

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
	public GdetVO findByPrimaryKey(Integer mem_id,Integer gd_no) {

		GdetVO gdetVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, mem_id);
			pstmt.setInt(2, gd_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// deptVO 也稱為 Domain objects
				gdetVO = new GdetVO();
				gdetVO.setMem_id(rs.getInt("mem_id"));
				gdetVO.setGd_no(rs.getInt("gd_no"));
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
		return gdetVO;
	}

	@Override
	public List<GdetVO> getAll() {
		List<GdetVO> list = new ArrayList<GdetVO>();
		GdetVO gdetVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				gdetVO = new GdetVO();
				gdetVO.setMem_id(rs.getInt("mem_id"));
				gdetVO.setGd_no(rs.getInt("gd_no"));
				list.add(gdetVO); // Store the row in the list
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
	public Set<GoodsVO> getGoodsByGdet_no(Integer mem_id, Integer gd_no) {
		Set<GoodsVO> set = new LinkedHashSet<GoodsVO>();
		GoodsVO goodsVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_Gdet_ByMem_Gd_STMT);
			pstmt.setInt(1, mem_id);
			pstmt.setInt(1, gd_no);
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
