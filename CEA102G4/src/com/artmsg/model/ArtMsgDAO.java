package com.artmsg.model;

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

public class ArtMsgDAO implements ArtMsgDAO_interface {

	private static final String INSERT = "INSERT INTO ARTICLE_MESSAGE(MEM_ID, ART_NO ,ARTM_TEXT)VALUES(?,?,?)";
	private static final String UPDATE = "UPDATE ARTICLE_MESSAGE SET ARTM_TEXT = ? WHERE ARTM_NO =?";
	private static final String DELETE = "DELETE FROM ARTICLE_MESSAGE WHERE ARTM_NO = ?";
	private static final String GET_ALL = "SELECT * FROM ARTICLE_MESSAGE order by artm_time  desc";
	private static final String FINK_BYPK = "SELECT * FROM ARTICLE_MESSAGE WHERE ARTM_NO=?;";
	private static final String GET_MSG_BY_ARTNO = "SELECT * FROM ARTICLE_MESSAGE   WHERE ART_NO=? order by artm_time  desc";
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
	public List<ArtMsgVO> getMsgByArtNo(Integer artNo) {
		List<ArtMsgVO> artMsgList = new ArrayList();
		ArtMsgVO artMsg = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_MSG_BY_ARTNO);
			pstmt.setInt(1, artNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				artMsg = new ArtMsgVO();
				artMsg.setArtMsgNo(rs.getInt("ARTM_NO"));
				artMsg.setMemId(rs.getInt("MEM_ID"));
				artMsg.setArtNo(rs.getInt("ART_NO"));
				artMsg.setArtMsgText(rs.getString("ARTM_TEXT"));
				artMsg.setArtMsgTime(rs.getTimestamp("ARTM_TIME"));
				artMsg.setArtMsgLastmo(rs.getTimestamp("ARTM_LASTMO"));
				artMsgList.add(artMsg);
				
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
		
		
		return artMsgList;
	}

	
	@Override
	public void add(ArtMsgVO artMsg) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt =con.prepareStatement(INSERT);
			pstmt.setInt(1, artMsg.getMemId());
			pstmt.setInt(2, artMsg.getArtNo());
			pstmt.setString(3, artMsg.getArtMsgText());
			pstmt.executeUpdate();

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
	public void update(ArtMsgVO artMsg) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, artMsg.getArtMsgText());
			pstmt.setInt(2, artMsg.getArtMsgNo());
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			
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
	public void delete(int artMsgNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			
			pstmt.setInt(1, artMsgNo);
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
	public List<ArtMsgVO> getAll() {
		List<ArtMsgVO> artMsgList = new ArrayList();
		ArtMsgVO artMsg = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				artMsg = new ArtMsgVO();
				artMsg.setArtMsgNo(rs.getInt("ARTM_NO"));
				artMsg.setMemId(rs.getInt("MEM_ID"));
				artMsg.setArtNo(rs.getInt("ART_NO"));
				artMsg.setArtMsgText(rs.getString("ARTM_TEXT"));
				artMsg.setArtMsgTime(rs.getTimestamp("ARTM_TIME"));
				artMsg.setArtMsgLastmo(rs.getTimestamp("ARTM_LASTMO"));
				artMsgList.add(artMsg);
				
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
		
		
		return artMsgList;
	}
	
	@Override
	public ArtMsgVO finkByPk(int artMsgNo) {
		ArtMsgVO artMsg = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINK_BYPK);
			pstmt.setInt(1, artMsgNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				artMsg = new ArtMsgVO();
				artMsg.setArtMsgNo(rs.getInt("ARTM_NO"));
				artMsg.setMemId(rs.getInt("MEM_ID"));
				artMsg.setArtNo(rs.getInt("ART_NO"));
				artMsg.setArtMsgText(rs.getString("ARTM_TEXT"));
				artMsg.setArtMsgTime(rs.getTimestamp("ARTM_TIME"));
				artMsg.setArtMsgLastmo(rs.getTimestamp("ARTM_LASTMO"));
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
		return artMsg;
	}

}
