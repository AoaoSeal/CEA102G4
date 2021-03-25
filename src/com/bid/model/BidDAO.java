package com.bid.model;

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

import com.bid.model.BidVO;
import com.registration_detail.model.RdDAO;
import com.registration_detail.model.RdVO;
import com.registration_master.model.RmVO;

public class BidDAO implements BidDAO_interface{
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO bid (it_no,bid_pricestart,bid_timestart,bid_timeend) VALUES (?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT bid_no,it_no,bid_pricestart,bid_timestart,bid_timeend,bidrec_no,mem_id,bid_price,bid_status FROM bid ORDER BY bid_no DESC";
	private static final String GET_ONE_STMT = "SELECT it_no,bid_pricestart,bid_timestart,bid_timeend,bid_status FROM bid WHERE bid_no = ?";
	private static final String GET_ONE_STMT_BY_ITNO = "SELECT * FROM bid WHERE bid_no = ?";
	private static final String CHANGE_STATUS = "UPDATE bid SET bid_status = ? WHERE bid_no = ?";
	private static final String UPDATE = "UPDATE bid SET it_no = ?,bid_pricestart = ?,bid_timestart = ?,bid_timeend = ? WHERE bid_no = ?";
	private static final String UPDATEIT1001 = "UPDATE registration_master A INNER JOIN registration_detail B ON A.rm_no=B.rm_no " + 
												"SET A.mem_id=? ,A.rm_status=1 ,B.att_name=? ,B.att_phone=?,B.att_birth=?," + 
												"B.emer_name=?,B.emer_phone=?  WHERE A.mem_id=? AND A.it_no= ? ;";
	
	
	
	@Override
	public void insert(BidVO bidVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, bidVO.getItNo());   //這個輸入得從已存在行程去撈
			pstmt.setInt(2, bidVO.getBidPricestart());
//			pstmt.setInt(3, bidVO.getBidPricedir());
			pstmt.setTimestamp(3, bidVO.getBidTimestart());
			pstmt.setTimestamp(4, bidVO.getBidTimeend());			
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
	public void update(BidVO bidVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, bidVO.getItNo());   //這個輸入得從已存在行程去撈
			pstmt.setInt(2, bidVO.getBidPricestart());
//			pstmt.setInt(3, bidVO.getBidPricedir());
			pstmt.setTimestamp(3, bidVO.getBidTimestart());
			pstmt.setTimestamp(4, bidVO.getBidTimeend());
			pstmt.setInt(5, bidVO.getBidNo());
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
	public void change(Integer bidStatus, Integer bidNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_STATUS);
	
			pstmt.setInt(1, bidStatus);
			pstmt.setInt(2, bidNo);

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
	public BidVO findByPrimaryKey(Integer bidNo) {
		BidVO bidVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, bidNo);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bidVO = new BidVO();
				bidVO.setBidNo(bidNo);
				bidVO.setItNo(rs.getInt("it_no"));
				bidVO.setBidPricestart(rs.getInt("bid_pricestart"));
//				bidVO.setBidPricedir(rs.getInt("bid_pricedir"));
				bidVO.setBidTimestart(rs.getTimestamp("bid_timestart"));
				bidVO.setBidTimeend(rs.getTimestamp("bid_timeend"));
				bidVO.setBidStatus(rs.getInt("bid_status"));

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
		return bidVO;
	}

	@Override
	public List<BidVO> getAll() {
		List<BidVO> list = new ArrayList<BidVO>();
		BidVO bidVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bidVO = new BidVO();
//it_no,bid_pricestart,bid_pricedir,bid_timestart,bid_timeend,bid_status FROM bid ORDER BY bid_no
				bidVO.setBidNo(rs.getInt("bid_no"));
				bidVO.setItNo(rs.getInt("it_no"));
				bidVO.setBidPricestart(rs.getInt("bid_pricestart"));
				bidVO.setBidTimestart(rs.getTimestamp("bid_timestart"));
				bidVO.setBidTimeend(rs.getTimestamp("bid_timeend"));
				bidVO.setBidrecNo(rs.getInt("bidrec_no"));
				bidVO.setMemId(rs.getInt("mem_id"));
				bidVO.setBidPrice(rs.getInt("bid_price"));
				bidVO.setBidStatus(rs.getInt("bid_status"));
				
				list.add(bidVO);

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


	@Override
	public BidVO findByItNo(Integer bidNo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<BidVO> getAllByStatus(Integer bidStatus) {
		List<BidVO> list = new ArrayList<BidVO>();
		BidVO bidVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				if(rs.getInt("bid_status")==bidStatus) {
				bidVO = new BidVO();
//it_no,bid_pricestart,bid_pricedir,bid_timestart,bid_timeend,bid_status FROM bid ORDER BY bid_no
				bidVO.setBidNo(rs.getInt("bid_no"));
				bidVO.setItNo(rs.getInt("it_no"));
				bidVO.setBidPricestart(rs.getInt("bid_pricestart"));
				bidVO.setBidTimestart(rs.getTimestamp("bid_timestart"));
				bidVO.setBidTimeend(rs.getTimestamp("bid_timeend"));
				bidVO.setBidrecNo(rs.getInt("bidrec_no"));
				bidVO.setMemId(rs.getInt("mem_id"));
				bidVO.setBidPrice(rs.getInt("bid_price"));
				bidVO.setBidStatus(rs.getInt("bid_status"));
				

				list.add(bidVO);
				}
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


	@Override
	public void updateWithRds(RmVO rmVO, RdVO rdVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEIT1001);

	
			pstmt.setInt(1, rmVO.getMemId());
			pstmt.setString(2, rdVO.getAttName());
			pstmt.setString(3, rdVO.getAttPhone());
			pstmt.setString(4, rdVO.getAttBirth());
			pstmt.setString(5, rdVO.getEmerName());
			pstmt.setString(6, rdVO.getEmerPhone());
			pstmt.setInt(7, rmVO.getMemId());
			pstmt.setInt(8, rmVO.getItNo());


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
	

	

}
