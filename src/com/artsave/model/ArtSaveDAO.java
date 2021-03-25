package com.artsave.model;

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

public class ArtSaveDAO implements ArtSaveDAO_interface {
	private static final String INSERT = "INSERT INTO ARTICLE_SAVE(MEM_ID,ART_NO)VALUES(?,?);";
	private static final String DELETE = "DELETE FROM ARTICLE_SAVE WHERE (mem_id =?) and (art_no =?)";
	private static final String GETSAVE_BYMEM = "SELECT * FROM ARTICLE_SAVE WHERE MEM_ID=?";
	private static final String GETSAVE_BYART = "SELECT * FROM ARTICLE_SAVE WHERE ART_NO=?";

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
	public void add(ArtSaveVO artSave) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			pstmt.setInt(1, artSave.getMemId());
			pstmt.setInt(2, artSave.getArtNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("a database error occured. "+e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void delete(ArtSaveVO artSave) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, artSave.getMemId());
			pstmt.setInt(2, artSave.getArtNo());
			pstmt.executeQuery();
		} catch (SQLException e) {
			throw new RuntimeException("a database error occured. "+e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	 public List<ArtSaveVO> getSaveByMem(Integer memId) {
		  List<ArtSaveVO> ListSave = new ArrayList<>();
		  ArtSaveVO artSave = null;
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;

		  try {
		   con = ds.getConnection();
		   pstmt = con.prepareStatement(GETSAVE_BYMEM);
		   pstmt.setInt(1, memId);
		   rs = pstmt.executeQuery();
		   
		   while(rs.next()){
		    artSave = new ArtSaveVO();
		    artSave.setMemId(rs.getInt("MEM_ID"));
		    artSave.setArtNo(rs.getInt("ART_NO"));
		    artSave.setArtSaveTime(rs.getTimestamp("ARTSAVE_TIME"));
		    ListSave.add(artSave);
		   }
		   
		  } catch (SQLException e) {
		   throw new RuntimeException("a database error occured. "+e.getMessage());
		  } finally {
		   if (pstmt != null) {
		    try {
		     pstmt.close();
		    } catch (SQLException e) {
		     // TODO Auto-generated catch block
		     e.printStackTrace();
		    }
		   }
		   if (con != null) {
		    try {
		     con.close();
		    } catch (SQLException e) {
		     // TODO Auto-generated catch block
		     e.printStackTrace();
		    }
		   }
		  }
		  return ListSave;
		 }

	@Override
	public List<ArtSaveVO> getSaveByArt() {
		List<ArtSaveVO> ListSave = new ArrayList<>();
		ArtSaveVO artSave = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GETSAVE_BYART);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				artSave = new ArtSaveVO();
				artSave.setMemId(rs.getInt("MEM_ID"));
				artSave.setArtNo(rs.getInt("ART_NO"));
				artSave.setArtSaveTime(rs.getTimestamp("ARTSAVE_TIME"));
				ListSave.add(artSave);
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("a database error occured. "+e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return ListSave;
	}



}
