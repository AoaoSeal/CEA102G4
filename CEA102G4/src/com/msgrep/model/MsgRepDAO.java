package com.msgrep.model;

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

public class MsgRepDAO implements MsgRepDAO_interface{
	private static final String INSERT ="INSERT INTO MESSAGE_REPORT(ARTM_NO, MEM_ID, MESREP_TEXT, MESREP_STATUS)VALUES(?,?,?,?)";
	private static final String UPDATE ="UPDATE MESSAGE_REPORT SET MESREP_TEXT=? WHERE MESREP_NO=?";
	private static final String UPDATE_STATUS ="UPDATE MESSAGE_REPORT SET MESREP_STATUS=? WHERE MESREP_NO=?";
	private static final String DELETE ="DELETE FROM MESSAGE_REPORT WHERE MESREP_NO=?";
	private static final String FINK_BYPK ="SELECT * FROM MESSAGE_REPORT WHERE MESREP_NO=?";
	private static final String GET_ALL ="SELECT * FROM MESSAGE_REPORT;";
	
	private static DataSource ds =null;
	static {
		try {
			Context	ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	@Override
	public void add(MsgRepVO msgRep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT);
			
			pstmt.setInt(1,msgRep.getArtMsgNo());
			pstmt.setInt(2,msgRep.getMemId());
			pstmt.setString(3, msgRep.getMsgRepText());
			pstmt.setInt(4, msgRep.getMsgRepStatus());
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
	public void updateStatus(MsgRepVO msgRep) {
		Connection con = null;
		PreparedStatement pstmt= null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			pstmt.setInt(1,msgRep.getMsgRepStatus());
			pstmt.setInt(2,msgRep.getMesRepNO());
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
	public void delete(Integer msgRepNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MsgRepVO finkByPk(Integer msgRepNo) {
		MsgRepVO msgRep = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(FINK_BYPK);
			pstmt.setInt(1,msgRepNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				msgRep = new MsgRepVO();
				msgRep.setMesRepNO(rs.getInt("MESREP_NO"));
				msgRep.setArtMsgNo(rs.getInt("ARTM_NO"));
				msgRep.setMemId(rs.getInt("MEM_ID"));
				msgRep.setMsgRepText(rs.getString("MESREP_TEXT"));
				msgRep.setMsgRepTime(rs.getTimestamp("MESREP_TIME"));
				msgRep.setMsgRepStatus(rs.getInt("MESREP_STATUS"));
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

		return msgRep;
	}

	@Override
	public List<MsgRepVO> getAll() {
		List<MsgRepVO> msgRepList = new ArrayList<>();
		MsgRepVO msgRep = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				msgRep = new MsgRepVO();
				msgRep.setMesRepNO(rs.getInt("MESREP_NO"));
				msgRep.setArtMsgNo(rs.getInt("ARTM_NO"));
				msgRep.setMemId(rs.getInt("MEM_ID"));
				msgRep.setMsgRepText(rs.getString("MESREP_TEXT"));
				msgRep.setMsgRepTime(rs.getTimestamp("MESREP_TIME"));
				msgRep.setMsgRepStatus(rs.getInt("MESREP_STATUS"));
				msgRepList.add(msgRep);
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
		return msgRepList;
	}
	@Override
	public void update(MsgRepVO msgRep) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, msgRep.getMsgRepText());
			pstmt.setInt(2,msgRep.getMesRepNO());
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


	

}
