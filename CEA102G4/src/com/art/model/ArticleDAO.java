package com.art.model;

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

import com.artcount.model.ArtCountService;

public class ArticleDAO implements ArticleDAO_interface {
	private static final String INSERTSTMT = "INSERT INTO Article(artc_no, mem_id, art_title, art_text, art_pic, art_count, art_status) VALUES ( ?, ?, ?, ?, ?, ?,?)";
	private static final String UPDATESTMT = "UPDATE Article SET artc_no = ? ,art_title = ?,art_text = ?,art_pic=?  WHERE art_no = ?";
	private static final String UPDATEPIC = "UPDATE Article SET artc_no = ? ,art_title = ?,art_text = ?  WHERE art_no = ?";
	private static final String UPDATE_STATUS = "UPDATE Article SET art_status=?  WHERE art_no = ?";
	private static final String DELETESTMT = "DELETE FROM Article WHERE art_no = ?";
	private static final String FIND_BYPK = "SELECT * FROM Article WHERE art_no = ?";
	private static final String GET_ALL = "SELECT * FROM Article order by art_time  desc";
	private static final String FINK_BYSTATUS = "SELECT * FROM Article WHERE art_status =? ";
	
	
		
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void add(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERTSTMT);

			pstmt.setInt(1, article.getArtcNo());
			pstmt.setInt(2, article.getMemId());
			pstmt.setString(3, article.getArtTitle());
			pstmt.setString(4, article.getArtText());
			pstmt.setBytes(5, article.getArtPic());
			pstmt.setInt(6, article.getArtCount());
			pstmt.setInt(7, article.getArtStatus());
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void update(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();


			if (article.getArtPic().length == 0) {
				pstmt = con.prepareStatement(UPDATEPIC);
				pstmt.setInt(1, article.getArtcNo());
				pstmt.setString(2, article.getArtTitle());
				pstmt.setString(3, article.getArtText());
				pstmt.setInt(4, article.getArtNo());

				pstmt.executeUpdate();

			} else if (article.getArtPic().length != 0) {

				pstmt = con.prepareStatement(UPDATESTMT);
				pstmt.setInt(1, article.getArtcNo());
				pstmt.setString(2, article.getArtTitle());
				pstmt.setString(3, article.getArtText());
				pstmt.setBytes(4, article.getArtPic());
				pstmt.setInt(5, article.getArtNo());

				pstmt.executeUpdate();
			}
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void updateStatus(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			
				pstmt = con.prepareStatement(UPDATE_STATUS);
				pstmt.setInt(1, article.getArtStatus());
				pstmt.setInt(2, article.getArtNo());
		

				pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer artNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETESTMT);

			pstmt.setInt(1, artNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public ArticleVO findByPK(Integer artNo) {

		ArticleVO art = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_BYPK);

			pstmt.setInt(1, artNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				art = new ArticleVO();
				art.setArtNo(rs.getInt("art_no"));
				art.setArtcNo(rs.getInt("artc_no"));
				art.setMemId(rs.getInt("mem_id"));
				art.setArtTitle(rs.getString("art_title"));
				art.setArtText(rs.getString("art_text"));
				art.setArtPic(rs.getBytes("art_pic"));
				art.setArtTime(rs.getTimestamp("art_time"));
				art.setArtLastmod(rs.getTimestamp("art_lastmod"));
				art.setArtCount(rs.getInt("art_count"));
				art.setArtStatus(rs.getInt("art_status"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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

		return art;
	}

	@Override
	public List<ArticleVO> getAll() {
		List<ArticleVO> artList = new ArrayList<>();
		ArticleVO art = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArtCountService artcount = new ArtCountService();
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				art = new ArticleVO();
				art.setArtNo(rs.getInt("art_no"));
				art.setArtcNo(rs.getInt("artc_no"));
				art.setMemId(rs.getInt("mem_id"));
				art.setArtTitle(rs.getString("art_title"));
				art.setArtText(rs.getString("art_text"));
				art.setArtPic(rs.getBytes("art_pic"));
				art.setArtTime(rs.getTimestamp("art_time"));
				art.setArtLastmod(rs.getTimestamp("art_lastmod"));
				art.setArtCount(artcount.getArtCount(art.getArtNo()));
				art.setArtStatus(rs.getInt("art_status"));
				artList.add(art);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return artList;
	}

	@Override
	public List<ArticleVO> finkByStatus(Integer artStatus) {
		List<ArticleVO> ListArticle = new ArrayList<>();
		ArticleVO art = new ArticleVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINK_BYSTATUS);
			pstmt.setInt(1, artStatus);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				art = new ArticleVO();
				art.setArtNo(rs.getInt("art_no"));
				art.setArtcNo(rs.getInt("artc_no"));
				art.setMemId(rs.getInt("mem_id"));
				art.setArtTitle(rs.getString("art_title"));
				art.setArtText(rs.getString("art_text"));
				art.setArtPic(rs.getBytes("art_pic"));
				art.setArtTime(rs.getTimestamp("art_time"));
				art.setArtLastmod(rs.getTimestamp("art_lastmod"));
				art.setArtCount(rs.getInt("art_count"));
				art.setArtStatus(rs.getInt("art_status"));
				ListArticle.add(art);
			}

		} catch (SQLException e) {
			throw new RuntimeException("a database error occured. " + e.getMessage());
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

		return ListArticle;
	}
	public String title(String keyWord) {
		String sql = "SELECT * FROM Article WHERE art_title like '%" + keyWord +"%'";
		
		return sql;

	}
	@Override
	public List<ArticleVO> finkByTitle(String artTitle) {
		List<ArticleVO> ListArticle = new ArrayList<>();
		ArticleVO art = new ArticleVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(title(artTitle));
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				art = new ArticleVO();
				art.setArtNo(rs.getInt("art_no"));
				art.setArtcNo(rs.getInt("artc_no"));
				art.setMemId(rs.getInt("mem_id"));
				art.setArtTitle(rs.getString("art_title"));
				art.setArtText(rs.getString("art_text"));
				art.setArtPic(rs.getBytes("art_pic"));
				art.setArtTime(rs.getTimestamp("art_time"));
				art.setArtLastmod(rs.getTimestamp("art_lastmod"));
				art.setArtCount(rs.getInt("art_count"));
				art.setArtStatus(rs.getInt("art_status"));
				ListArticle.add(art);
			}

		} catch (SQLException e) {
			throw new RuntimeException("a database error occured. " + e.getMessage());
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

		return ListArticle;
	}

}
