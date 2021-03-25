package com.itinerary_category.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.itinerary.model.ItVO;
import com.leader.model.LdJDBCDAO;
import com.leader.model.LdVO;

public class ItcJDBCDAO implements ItcDAO_interface{

	
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/tibamountain?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "123456";
	
	private static final String GET_ALL_STMT = "SELECT  itc_no, itc_name FROM itinerary_category";	
	@Override
	public void insert(ItcVO itcVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ItcVO itcVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer itcNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ItcVO findByPrimaryKey(Integer itcNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItcVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ItcVO> list = new ArrayList<ItcVO>();
		ItcVO itcVO = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				itcVO = new ItcVO();
				itcVO.setItcNo(rs.getInt("itc_no"));
				itcVO.setItcName(rs.getString("itc_name"));

				list.add(itcVO); 
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public Set<ItVO> getItsByItcno(Integer itcNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		ItcJDBCDAO dao = new ItcJDBCDAO();
		List<ItcVO> list = dao.getAll();
		for (ItcVO aldvo : list) {
			System.out.println("領隊編號是"+ aldvo.getItcNo() + ",");
			System.out.println("領隊名字是"+ aldvo.getItcName() + ",");
		}
	}
}
