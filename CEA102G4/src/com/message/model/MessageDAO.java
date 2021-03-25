package com.message.model;

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

public class MessageDAO implements MessageDAO_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");

			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String GET_ALL = "SELECT message_no,mem_id,message_c,message_contain,message_time FROM message ORDER BY message_time DESC;";
	
	@Override
	public void insert(MessageVO messageVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer messageNo, Integer memId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MessageVO findBymemId(Integer memId) {
		return null;
		
	}

	@Override
	public List<MessageVO> getAll() {
		List<MessageVO> list = new ArrayList<MessageVO>();
		MessageVO messageVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				messageVO = new MessageVO();
				
				messageVO.setMessageNo(rs.getInt("message_no"));
				messageVO.setMemId(rs.getInt("mem_id"));
				messageVO.setMessageC(rs.getInt("message_c"));
				messageVO.setMessageContain(rs.getString("message_contain"));
				messageVO.setMessageTime(rs.getTimestamp("message_time"));
			
				list.add(messageVO);

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
