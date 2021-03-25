package com.leader.model;

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

import com.member.model.MemberVO;



public class LdDAO implements LdDAO_interface{
	private static DataSource ds;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String UPDATE =
			"UPDATE LEADER SET LD_NAME=?, LD_PIC=?, LD_EXPR=? WHERE LD_NO=?";	
	private static final String DELETE =
			"DELETE FROM LEADER WHERE LD_NO =?";
	private static final String INSERT_STMT = 
			"INSERT INTO LEADER(LD_NAME, LD_PIC, LD_EXPR) VALUES(?, ?, ?)";
	private static final String GET_ONE_STMT =
			"SELECT LD_NO, LD_NAME, LD_PIC, LD_EXPR, LD_STATUS, LD_SCORE, LD_PEOPLE FROM LEADER WHERE LD_NO =?";
	private static final String GET_ALL_STMT =
			"SELECT LD_NO, LD_NAME, LD_PIC, LD_EXPR, LD_STATUS, LD_SCORE, LD_PEOPLE FROM LEADER ORDER BY LD_NO";
	private static final String GET_ONE_BY_MAIL = "SELECT * FROM leader WHERE ld_mail = ?";

	@Override
	public void insert(LdVO ldVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, ldVO.getLdName());
			pstmt.setBytes(2, ldVO.getLdPic());
			pstmt.setString(3, ldVO.getLdExpr());
//			pstmt.setString(4, ldVO.getLdMail());
//			pstmt.setString(5, ldVO.getLdPass());

			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public void update(LdVO ldVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, ldVO.getLdName());
			pstmt.setBytes(2, ldVO.getLdPic());
			pstmt.setString(3, ldVO.getLdExpr());
//			pstmt.setString(4, ldVO.getLdMail());
//			pstmt.setString(5, ldVO.getLdPass());
			pstmt.setInt(4, ldVO.getLdNo());
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		}finally{
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(Integer ldNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, ldNo);
			pstmt.executeUpdate();
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		}finally {
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
	public LdVO findByPrimaryKey(Integer ldNo) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		LdVO ldVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, ldNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ldVO = new LdVO();
				ldVO.setLdNo(rs.getInt("ld_no"));
				ldVO.setLdName(rs.getString("ld_name"));
				ldVO.setLdPic(rs.getBytes("ld_pic"));
				ldVO.setLdExpr(rs.getString("ld_expr"));
				ldVO.setLdStatus(rs.getInt("ld_status"));
				ldVO.setLdScore(rs.getInt("ld_score"));
				ldVO.setLdPeople(rs.getInt("ld_people"));
//				ldVO.setLdMail(rs.getString("ld_mail"));
//				ldVO.setLdPass(rs.getString("ld_pass"));
			}
		} catch(SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());			
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return ldVO;
	}

	@Override
	public List<LdVO> getAll() {
		List<LdVO> list = new ArrayList<LdVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LdVO ldVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ldVO = new LdVO();
				ldVO.setLdNo(rs.getInt("ld_no"));
				ldVO.setLdName(rs.getString("ld_name"));
				ldVO.setLdPic(rs.getBytes("ld_pic"));
				ldVO.setLdExpr(rs.getString("ld_expr"));
				ldVO.setLdStatus(rs.getInt("ld_status"));
				ldVO.setLdScore(rs.getInt("ld_score"));
				ldVO.setLdPeople(rs.getInt("ld_people"));
//				ldVO.setLdMail(rs.getString("ld_mail"));
//				ldVO.setLdPass(rs.getString("ld_pass"));
				list.add(ldVO);
			}
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());	
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}if(con != null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
				
			}
		}		
		return list;
	}


	@Override
	public LdVO findByMail(String ldMail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LdVO ldVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_MAIL);

			pstmt.setString(1, ldMail);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ldVO = new LdVO();
	//			ld_no, ld_name, ld_pic, ld_expr, ld_status, ld_score, ld_people, ld_mail, ld_pass			
				ldVO.setLdNo(rs.getInt("ld_no"));
				ldVO.setLdName(rs.getString("ld_name"));
				ldVO.setLdStatus(rs.getInt("ld_status"));
				ldVO.setLdMail(rs.getString("ld_mail"));
				ldVO.setLdPass(rs.getString("ld_pass"));				
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return ldVO;
	}

}
