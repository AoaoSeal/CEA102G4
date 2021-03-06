package com.registration_master.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import com.registration_detail.model.RdDAO;
import com.registration_detail.model.RdVO;

public class RmDAO implements RmDAO_interface{
	private static DataSource ds;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT = 
			"INSERT INTO registration_master (mem_id, it_no, peo_count) VALUES (?, ?, ?)";
	private static final String INSERT_FEEDBACK = 
			"INSERT INTO registration_master (ld_score, fb_text) VALUES (?, ?)";
	private static final String UPDATE_STATUS = 
			"UPDATE registration_master set rm_status=? where rm_no = ?";
	private static final String GET_SUCCESS_STMT = 
			"SELECT rm_no, mem_id, it_no, peo_count, rm_date, rm_status, ld_score, fb_text FROM registration_master where it_no = ? and mem_id=?";
	private static final String GET_STMT_BY_MEMID = 
			"SELECT rm_no, mem_id, it_no, peo_count, rm_date, rm_status, ld_score, fb_text FROM registration_master where mem_id = ?";
	private static final String GET_STMT_BY_RMNO = 
			"SELECT rm_no, mem_id, it_no, peo_count, rm_date, rm_status, ld_score, fb_text FROM registration_master where rm_no = ?";
	
	@Override
	public void insert(RmVO rmVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateStatus(RmVO rmVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			
			pstmt.setInt(1, rmVO.getRmStatus());
			pstmt.setInt(2, rmVO.getRmNo());
			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());			
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
	public List<RmVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<RdVO> getRdByRmNo(Integer rmNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertWithRds(RmVO rmVO, List<RdVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			con.setAutoCommit(false);
			
			String cols[] = {"rm_no"}; //?????????
			pstmt = con.prepareStatement(INSERT , cols);			
			pstmt.setInt(1, rmVO.getMemId());
			pstmt.setInt(2, rmVO.getItNo());
			pstmt.setInt(3, rmVO.getPeoCount());
			pstmt.executeUpdate();
			
			
			//????????????????????????
			String next_rmno = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_rmno = rs.getString(1);
System.out.println("???????????????= " +next_rmno +"(???????????????-????????????)");
			} else {
System.out.println("?????????rmno???????????????");
			}
			rs.close();
			
			// ?????????????????????List????????????????????????
			RdDAO dao = new RdDAO();
System.out.println("list.size()-A="+list.size());
			for (RdVO rdVO : list) {
				rdVO.setRmNo(new Integer(next_rmno)) ; //??????FK?????????(??????PK???)?????????
				dao.insert2(rdVO,con); //???????????????DAO
			}

			
			con.commit();
			con.setAutoCommit(true);
System.out.println("list.size()-B="+list.size());
System.out.println("??????????????????rmno" + next_rmno + "???,???????????????" + list.size()
					+ "?????????????????????rd??????");
			
			
		
		} catch (SQLException se) {
			if (con != null) {
				try {
					System.err.print("Transaction is being ");
					System.err.println("rolled back-???Rm??????");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public RmVO findByItnoMemid(Integer itNo, Integer memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RmVO rmVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_SUCCESS_STMT);
			pstmt.setInt(1, itNo);
			pstmt.setInt(2, memId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rmVO = new RmVO();
				rmVO.setRmNo(rs.getInt("rm_no"));
				rmVO.setMemId(rs.getInt("mem_id"));
				rmVO.setItNo(rs.getInt("it_no"));
				rmVO.setPeoCount(rs.getInt("peo_count"));
				rmVO.setRmDate(rs.getDate("rm_date"));
				rmVO.setRmStatus(rs.getInt("rm_status"));
				rmVO.setLdScore(rs.getInt("ld_score"));
				rmVO.setFbText(rs.getString("fb_text"));
	

				
			}

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
		return rmVO;

	}

	@Override
	public List<RmVO> getByMemId(Integer memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RmVO> list = new ArrayList<RmVO>();
		RmVO rmVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STMT_BY_MEMID);
			pstmt.setInt(1, memId);


			rs = pstmt.executeQuery();

			while (rs.next()) {
				rmVO = new RmVO();
				rmVO.setRmNo(rs.getInt("rm_no"));
				rmVO.setMemId(rs.getInt("mem_id"));
				rmVO.setItNo(rs.getInt("it_no"));
				rmVO.setPeoCount(rs.getInt("peo_count"));
				rmVO.setRmDate(rs.getDate("rm_date"));
				rmVO.setRmStatus(rs.getInt("rm_status"));
				rmVO.setLdScore(rs.getInt("ld_score"));
				rmVO.setFbText(rs.getString("fb_text"));
	
				list.add(rmVO);
				
			}

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
	public RmVO findByRmNO(Integer rmNo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RmVO rmVO = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_STMT_BY_RMNO);
			pstmt.setInt(1, rmNo);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rmVO = new RmVO();
				rmVO.setRmNo(rs.getInt("rm_no"));
				rmVO.setMemId(rs.getInt("mem_id"));
				rmVO.setItNo(rs.getInt("it_no"));
				rmVO.setPeoCount(rs.getInt("peo_count"));
				rmVO.setRmDate(rs.getDate("rm_date"));
				rmVO.setRmStatus(rs.getInt("rm_status"));
				rmVO.setLdScore(rs.getInt("ld_score"));
				rmVO.setFbText(rs.getString("fb_text"));
	

				
			}

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
		return rmVO;
	}

	@Override
	public void insertFeedback(RmVO rmVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_FEEDBACK);
			
			pstmt.setInt(1, rmVO.getLdScore());
			pstmt.setString(2, rmVO.getFbText());
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

}
