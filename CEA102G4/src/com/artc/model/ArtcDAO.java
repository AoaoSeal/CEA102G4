package com.artc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.art.model.ArticleVO;
import com.artc.model.ArtcVO;

public class ArtcDAO implements ArtcDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	private static final String INSERT = "INSERT INTO Article_category (artc_name) VALUES ( ?)";
	private static final String GET_ALL = "SELECT artc_no,artc_name FROM Article_category";
	private static final String GET_ONE = "SELECT artc_no,artc_name FROM Article_category where artc_no= ?";
	private static final String GET_Art_ByArtc = "SELECT art_no, artc_no, mem_id, art_title, art_text, art_pic, art_time, art_lastmod, art_count, art_status FROM Article where artc_no = ? order by art_time";
	private static final String DELETE_ART = "DELETE FROM Article where Artc_no = ?";
	private static final String DELETE_ARTC = "DELETE FROM Article category where artc_no = ?";
	private static final String UPDATE = "UPDATE Article_category set artc_name=? where artc_no = ?";

	@Override
	public void insert(ArtcVO artcVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);

			pstmt.setInt(1, artcVO.getArtcNo());
			pstmt.setString(2, artcVO.getArtcName());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void update(ArtcVO artcVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, artcVO.getArtcNo());
			pstmt.setString(2, artcVO.getArtcName());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@SuppressWarnings("resource")
	@Override
	public void delete(Integer artcNo) {
//		int updateCount_Article = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			con.setAutoCommit(false);

			pstmt = con.prepareStatement(DELETE_ART);
			pstmt.setInt(1, artcNo);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(DELETE_ARTC);
			pstmt.setInt(1, artcNo);
			pstmt.executeUpdate();

			con.commit();
			con.setAutoCommit(true);

//			System.out.println("�R���峹����:" + artcNo + "��,�@" + updateCount_Article + "�峹�Q�R��");
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public ArtcVO findByPk(Integer artcNo) {
		ArtcVO artcVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);

			pstmt.setInt(1, artcNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				artcVO = new ArtcVO();
				artcVO.setArtcNo(rs.getInt("artc_no"));
				artcVO.setArtcName(rs.getString("artc_name"));

			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
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

		return artcVO;
	}

	@Override
	public List<ArtcVO> getAll() {
		List<ArtcVO> list = new ArrayList<ArtcVO>();
		ArtcVO artcVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				artcVO = new ArtcVO();
				artcVO.setArtcNo(rs.getInt("artc_no"));
				artcVO.setArtcName(rs.getString("artc_name"));
				list.add(artcVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
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
	public List<ArticleVO> getArtByArtc(Integer artcNo) {
		List<ArticleVO> set = new ArrayList<ArticleVO>();
		ArticleVO artVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_Art_ByArtc);
			pstmt.setInt(1, artcNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				artVO = new ArticleVO();
				artVO.setArtNo(rs.getInt("art_no"));
				artVO.setArtcNo(rs.getInt("artc_no"));
				artVO.setMemId(rs.getInt("mem_id"));
				artVO.setArtTitle(rs.getString("art_title"));
				artVO.setArtText(rs.getString("art_text"));
				artVO.setArtPic(rs.getBytes("art_pic"));
				artVO.setArtTime(rs.getTimestamp("art_time"));
				artVO.setArtLastmod(rs.getTimestamp("art_lastmod"));
				artVO.setArtCount(rs.getInt("art_count"));
				artVO.setArtStatus(rs.getInt("art_status"));
				set.add(artVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
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
