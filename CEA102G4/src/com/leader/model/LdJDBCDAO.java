package com.leader.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LdJDBCDAO implements LdDAO_interface{
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";
	
	private static final String GET_ONE_STMT =
			"SELECT LD_NO, LD_NAME, LD_PIC, LD_EXPR, LD_STATUS, LD_SCORE, LD_PEOPLE FROM LEADER WHERE LD_NO =?";
	private static final String GET_ALL_STMT =
			"SELECT LD_NO, LD_NAME, LD_PIC, LD_EXPR, LD_STATUS, LD_SCORE, LD_PEOPLE FROM LEADER ORDER BY LD_NO";
	
	
	@Override
	public void insert(LdVO LdVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void update(LdVO LdVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Integer ld_no) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public LdVO findByPrimaryKey(Integer ldNo) {
		Connection con = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		LdVO ldVO = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, ldNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ldVO = new LdVO();
				ldVO.setLdNo(rs.getInt("ld_no"));
				ldVO.setLdName(rs.getString("ld_name"));
				ldVO.setLdPic(rs.getBytes("ld_pic"));
				ldVO.setLdStatus(rs.getInt("ld_status"));
				ldVO.setLdScore(rs.getInt("ld_score"));
				ldVO.setLdPeople(rs.getInt("ld_people"));
			}
		} catch(SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
				list.add(ldVO);
			}
			
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());	
		} catch (ClassNotFoundException se) {
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

	
	public static void main(String[] args) {
		LdJDBCDAO dao = new LdJDBCDAO();
		LdVO ldvo = dao.findByPrimaryKey(1);
		System.out.println("領隊編號是"+ ldvo.getLdNo() + ",");
		System.out.println("領隊名字是"+ ldvo.getLdName() + ",");
		System.out.println("領隊照片:" + ldvo.getLdPic() + ",");
		System.out.println("領隊狀態:" + ldvo.getLdStatus() + ",");
		System.out.println("領隊分數:" + ldvo.getLdScore() + ",");
		System.out.println("評分人數:" + ldvo.getLdPeople() + ",");
		System.out.println("---------------------");
		
		List<LdVO> list = dao.getAll();
		for (LdVO aldvo : list) {
			System.out.println("領隊編號是"+ aldvo.getLdNo() + ",");
			System.out.println("領隊名字是"+ aldvo.getLdName() + ",");
			System.out.println("領隊照片:" + aldvo.getLdPic() + ",");
			System.out.println("領隊狀態:" + aldvo.getLdStatus() + ",");
			System.out.println("領隊分數:" + aldvo.getLdScore() + ",");
			System.out.println("評分人數:" + aldvo.getLdPeople() + ",");
		}

		
	}
	@Override
	public LdVO findByMail(String ldMail) {
		// TODO Auto-generated method stub
		return null;
	}
}
