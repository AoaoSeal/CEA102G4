package com.member.model;

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

import com.all.GetTimeStart;

public class MemberDAO implements MemberDAO_interface {

	

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");

			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO member_list (mem_mail,mem_pass,mem_name,mem_sex,mem_birth,mem_nick,mem_phone,mem_address,mem_pic,mem_text) VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT mem_id,mem_mail,mem_pass,mem_name,mem_sex,mem_birth,mem_nick,mem_phone,mem_address,mem_pic,mem_text,mem_time,tra_bal,mem_report,mem_status FROM member_list ORDER BY mem_id";
	private static final String GET_ONE_STMT = "SELECT mem_mail,mem_pass,mem_name,mem_sex,mem_birth,mem_nick,mem_phone,mem_address,mem_pic,mem_text,mem_time,tra_bal,mem_report,mem_status FROM member_list WHERE mem_id = ?";
	private static final String GET_ONE_STMT_BY_MAIL = "SELECT * FROM member_list WHERE mem_mail = ?";
	private static final String DELETE = "UPDATE member_list SET mem_status = ? WHERE mem_id = ?";
	private static final String UPDATE = "UPDATE member_list SET mem_pass = ?,mem_name = ?,mem_nick = ?,mem_phone = ?,mem_address = ?,mem_pic = ?,mem_text = ? where mem_id = ?";

	
	@Override
	public MemberVO findByMail(String memMail) {
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT_BY_MAIL);

			pstmt.setString(1, memMail);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemMail(memMail);
				
				memberVO.setMemId(rs.getInt("mem_id"));
				memberVO.setMemPass(rs.getString("mem_pass"));
				memberVO.setMemName(rs.getString("mem_name"));
				memberVO.setMemSex(rs.getInt("mem_sex"));
				memberVO.setMemBirth(rs.getDate("mem_birth"));
				memberVO.setMemNick(rs.getString("mem_nick"));
				memberVO.setMemPhone(rs.getString("mem_phone"));
				memberVO.setMemAddress(rs.getString("mem_address"));
				memberVO.setMemPic(rs.getBytes("mem_pic"));
				memberVO.setMemText(rs.getString("mem_text"));
				memberVO.setMemTime(rs.getTimestamp("mem_time"));
				memberVO.setTraBal(rs.getInt("tra_bal"));
				memberVO.setMemReport(rs.getInt("mem_report"));
				memberVO.setMemStatus(rs.getInt("mem_status"));
				
				
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
		return memberVO;
	}
	
	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getMemMail());
			pstmt.setString(2, memberVO.getMemPass());
			pstmt.setString(3, memberVO.getMemName());
			pstmt.setInt(4, memberVO.getMemSex());
			pstmt.setDate(5, memberVO.getMemBirth());
			pstmt.setString(6, memberVO.getMemNick());
			pstmt.setString(7, memberVO.getMemPhone());
			pstmt.setString(8, memberVO.getMemAddress());
			pstmt.setBytes(9, memberVO.getMemPic());
			pstmt.setString(10, memberVO.getMemText());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getMemPass());
			pstmt.setString(2, memberVO.getMemName());
			pstmt.setString(3, memberVO.getMemNick());
			pstmt.setString(4, memberVO.getMemPhone());
			pstmt.setString(5, memberVO.getMemAddress());
			pstmt.setBytes(6, memberVO.getMemPic());
			pstmt.setString(7, memberVO.getMemText());
			pstmt.setInt(8, memberVO.getMemId());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer memStatus, Integer memId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);
			if (memStatus == 0) {
				memStatus = 1;
			} else if (memStatus == 1) {
				memStatus = 0;
			}
			pstmt.setInt(1, memStatus);
			pstmt.setInt(2, memId);

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
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public MemberVO findByPrimaryKey(Integer memId) {

		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, memId);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMemId(memId);
				memberVO.setMemMail(rs.getString("mem_mail"));
				memberVO.setMemPass(rs.getString("mem_pass"));
				memberVO.setMemName(rs.getString("mem_name"));
				memberVO.setMemSex(rs.getInt("mem_sex"));
				memberVO.setMemBirth(rs.getDate("mem_birth"));
				memberVO.setMemNick(rs.getString("mem_nick"));
				memberVO.setMemPhone(rs.getString("mem_phone"));
				memberVO.setMemAddress(rs.getString("mem_address"));
				memberVO.setMemPic(rs.getBytes("mem_pic"));
				memberVO.setMemText(rs.getString("mem_text"));
				memberVO.setMemTime(rs.getTimestamp("mem_time"));
				memberVO.setTraBal(rs.getInt("tra_bal"));
				memberVO.setMemReport(rs.getInt("mem_report"));
				memberVO.setMemStatus(rs.getInt("mem_status"));
				
				
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
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {

		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();

				memberVO.setMemId(rs.getInt("mem_id"));
				memberVO.setMemMail(rs.getString("mem_mail"));
				memberVO.setMemPass(rs.getString("mem_pass"));
				memberVO.setMemName(rs.getString("mem_name"));
				memberVO.setMemSex(rs.getInt("mem_sex"));
				memberVO.setMemBirth(rs.getDate("mem_birth"));
				memberVO.setMemNick(rs.getString("mem_nick"));
				memberVO.setMemPhone(rs.getString("mem_phone"));
				memberVO.setMemAddress(rs.getString("mem_address"));
				memberVO.setMemPic(rs.getBytes("mem_pic"));
				memberVO.setMemText(rs.getString("mem_text"));
				memberVO.setMemTime(rs.getTimestamp("mem_time"));
				memberVO.setTraBal(rs.getInt("tra_bal"));
				memberVO.setMemReport(rs.getInt("mem_report"));
				memberVO.setMemStatus(rs.getInt("mem_status"));
				
				list.add(memberVO);

			}
		} catch (SQLException se) {
			throw new RuntimeException("A batabase error occured. " + se.getMessage());
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

		return list;
	}



}
