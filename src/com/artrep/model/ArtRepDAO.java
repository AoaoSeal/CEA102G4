package com.artrep.model;

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

public class ArtRepDAO implements ArtRepDAO_interface{
	private static final String INSERT ="INSERT INTO ARTICLE_REPORT( MEM_ID, ART_NO, ARTREP_NO_TEXT, ARTREP_STATUS) VALUES (?,?,?,?)";
	private static final String UPDATE ="UPDATE ARTICLE_REPORT SET ARTREP_NO_TEXT=? WHERE ARTREP_NO =?";
	private static final String UPDATESTATUS = "UPDATE ARTICLE_REPORT SET ARTREP_STATUS=? WHERE ARTREP_NO =?";
	private static final String DELETE = "DELETE FROM ARTICLE_REPORT WHERE ARTREP_NO=?";
	private static final String GET_ALL ="SELECT * FROM ARTICLE_REPORT";
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:com/env/jdbc/tibamountain");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public void add(ArtRepVO artRep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setInt(1,artRep.getMemId());
			pstmt.setInt(2,artRep.getArtNo());
			pstmt.setString(3,artRep.getArtRepNoText());
			pstmt.setInt(4,artRep.getArtRepStatus());
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
	public void update(ArtRepVO artRep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,artRep.getArtRepNoText());
			pstmt.setInt(2, artRep.getArtRepNo());
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
	public void updateStatus(ArtRepVO artRep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATESTATUS);
			pstmt.setInt(1,artRep.getArtRepStatus());
			pstmt.setInt(2,artRep.getArtRepNo());
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
	public void delete(int artRepNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ArtRepVO> getAll() {
		List<ArtRepVO> artRepList = new ArrayList<>();
		ArtRepVO artRep = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				artRep.setArtRepNo(rs.getInt("ARTREP_NO"));
				artRep.setMemId(rs.getInt("MEM_ID"));
				artRep.setArtNo(rs.getInt("ART_NO"));
				artRep.setArtRepNoText(rs.getString("ARTREP_NO_TEXT"));
				artRep.setArtRepTime(rs.getTimestamp("ARTREP_TIME"));
				artRep.setArtRepStatus(rs.getInt("ARTREP_STATUS"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("a database error occured. "+se.getMessage());
			
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
		return null;
	}

}
