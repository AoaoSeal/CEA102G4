package com.artcount.model;

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

public class ArtCountDAO implements ArtCountDAO_interface {
	private static final String INSERT = "INSERT INTO ARTICLE_COUNT(MEM_ID, ART_NO)VALUES(?,?)";
	private static final String DELETE = "DELETE FROM ARTICLE_COUNT WHERE MEM_ID=? AND ART_NO= ?";
	private static final String MEMBER_COUNT = "SELECT * FROM article_count WHERE MEM_ID = ?";
	private static final String ART_COUNT = "SELECT COUNT(*) FROM article_count WHERE ART_NO=?";
	private static final String IFMEMBER_COUNT = "SELECT * FROM article_count WHERE MEM_ID=? AND ART_NO=?";

	private static DataSource ds = null;
	static {
		try {
			Context cxt = new InitialContext();
			ds = (DataSource) cxt.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void add(ArtCountVO artCount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setInt(1, artCount.getMemId());
			pstmt.setInt(2, artCount.getArtNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("a datebase error:" + e.getMessage());

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
	public void delete(ArtCountVO artCount) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, artCount.getMemId());
			pstmt.setInt(2, artCount.getArtNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("a datebase error:" + e.getMessage());

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
	public List<ArtCountVO> memberCount(Integer memId) {
		List<ArtCountVO> list = new ArrayList<ArtCountVO>();
		ArtCountVO artCount = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(MEMBER_COUNT);
			pstmt.setInt(1, memId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				artCount = new ArtCountVO();
				artCount.setArtNo(rs.getInt("art_no"));
				list.add(artCount);
			}

		} catch (SQLException e) {
			throw new RuntimeException("a datebase error:" + e.getMessage());
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
		return list;
	}

	@Override
	public Integer artCount(Integer artNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		Integer artCount = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(ART_COUNT);
			pstmt.setInt(1, artNo);
			rs = pstmt.executeQuery();
			rs.next();
			artCount = rs.getInt("COUNT(*)");
		} catch (SQLException e) {
			throw new RuntimeException("a datebase error:" + e.getMessage());
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
		return artCount;

	}

	@Override
	public ArtCountVO ifmemberCount(ArtCountVO artCount) {
		ArtCountVO artCountVO = new ArtCountVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(IFMEMBER_COUNT);

			pstmt.setInt(1, artCount.getMemId());
			pstmt.setInt(2, artCount.getArtNo());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				artCountVO.setMemId(rs.getInt("mem_id"));
				artCountVO.setArtNo(rs.getInt("art_no"));
			}

		} catch (SQLException e) {
			throw new RuntimeException("a datebase error:" + e.getMessage());

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
		return artCountVO;
	}
//return artCountVO !=null ? Optional.of(artCountVO) : Optional.empty();
}
