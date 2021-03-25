package com.emp.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.leader.model.LdVO;

public class EmpDAO implements EmpDAO_interface {


	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = 
		"INSERT INTO emp2 (emp_no, emp_email, emp_pass, emp_name, emp_sex, emp_phone, emp_position_no, emp_status_no) VALUES (?, ?, ?, ?, ?, ?,?,?)";
	private static final String GET_ALL_STMT = 
		"SELECT empno,ename,job,hiredate,sal,comm,deptno FROM emp2 order by empno";
	private static final String GET_ONE_STMT = 
		"SELECT empno,ename,job,hiredate,sal,comm,deptno FROM emp2 where empno = ?";
	private static final String DELETE = 
		"DELETE FROM emp2 where empno = ?";
	private static final String UPDATE = 
		"UPDATE emp2 set ename=?, job=?, hiredate=?, sal=?, comm=?, deptno=? where empno = ?";

	
	private static final String GET_ONE_BY_MAIL = "SELECT * FROM employee WHERE emp_email = ?";
	@Override
	public void insert(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

//			pstmt.setString(1, empVO.getEname());
//			pstmt.setString(2, empVO.getJob());
//			pstmt.setDate(3, empVO.getHiredate());
//			pstmt.setDouble(4, empVO.getSal());
//			pstmt.setDouble(5, empVO.getComm());
//			pstmt.setInt(6, empVO.getDeptno());
//
//			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void update(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

//			pstmt.setString(1, empVO.getEname());
//			pstmt.setString(2, empVO.getJob());
//			pstmt.setDate(3, empVO.getHiredate());
//			pstmt.setDouble(4, empVO.getSal());
//			pstmt.setDouble(5, empVO.getComm());
//			pstmt.setInt(6, empVO.getDeptno());
//			pstmt.setInt(7, empVO.getEmpno());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void delete(Integer empno) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, empno);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public EmpVO findByPrimaryKey(Integer empno) {

		EmpVO empVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, empno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
			
//				empVO = new EmpVO();
//				empVO.setEmpno(rs.getInt("empno"));
//				empVO.setEname(rs.getString("ename"));
//				empVO.setJob(rs.getString("job"));
//				empVO.setHiredate(rs.getDate("hiredate"));
//				empVO.setSal(rs.getDouble("sal"));
//				empVO.setComm(rs.getDouble("comm"));
//				empVO.setDeptno(rs.getInt("deptno"));
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
		return empVO;
	}

	@Override
	public List<EmpVO> getAll() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		EmpVO empVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
	
//				empVO = new EmpVO();
//				empVO.setEmpno(rs.getInt("empno"));
//				empVO.setEname(rs.getString("ename"));
//				empVO.setJob(rs.getString("job"));
//				empVO.setHiredate(rs.getDate("hiredate"));
//				empVO.setSal(rs.getDouble("sal"));
//				empVO.setComm(rs.getDouble("comm"));
//				empVO.setDeptno(rs.getInt("deptno"));
//				list.add(empVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
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
	public EmpVO findByMail(String empEmail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmpVO empVO = null;
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_BY_MAIL);

			pstmt.setString(1, empEmail);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				empVO = new EmpVO();

				empVO.setEmpNo(rs.getInt("emp_no"));
				empVO.setEmpEmail(rs.getString("emp_email"));
				empVO.setEmpPass(rs.getString("emp_pass"));
				empVO.setEmpName(rs.getString("emp_name"));
				empVO.setEmpSex(rs.getInt("emp_sex"));		
				empVO.setEmpPhone(rs.getString("emp_phone"));	
				empVO.setPositionNo(rs.getInt("emp_position_no"));	
				empVO.setStatusNo(rs.getInt("emp_status_no"));	

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
		return empVO;
	}
		
}