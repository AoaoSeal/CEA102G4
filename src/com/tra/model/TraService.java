package com.tra.model;

import java.util.List;

import com.member.model.MemberVO;


public class TraService {
	private TraDAO_interface dao;

	public TraService() {
		dao = new TraDAO();
	}

	public TraVO addTra(int mem_id,int tra_price,
			int tra_status,int tra_action) {

		TraVO traVO = new TraVO();
		
//		traVO.setTra_no(tra_no);
		traVO.setMem_id(mem_id);
		traVO.setTra_action(tra_action);
		traVO.setTra_price(tra_price);
		traVO.setTra_status(tra_status);
		dao.insert(traVO);
		
		return traVO;
	}

	public TraVO updateTra(int tra_no, int mem_id,int tra_action,int tra_price,
			int tra_status,int tra ) {

		TraVO traVO = new TraVO();

		traVO.setTra_no(tra_no);
		traVO.setMem_id(mem_id);
		traVO.setTra_action(tra_action);
		traVO.setTra_price(tra_price);
		traVO.setTra_status(tra_status);
		dao.update(traVO);
		MemberVO memberVO=new MemberVO();
		memberVO.setMemId(mem_id);
		memberVO.setTraBal(tra);
		dao.savePick(memberVO);

		return traVO;
	}


	public TraVO getOneTra(Integer tra_no) {
		return dao.findByPrimaryKey(tra_no);
	}

	public List<TraVO> getAll() {
		return dao.getAll();
	}
	
	public List<TraVO> getAll3(Integer mem_id) {
		return dao.getAll3(mem_id);
	}
	
	public TraVO addTra2(int mem_id,int tra_price,
			int tra_status,int tra_action, int tra) {
		
		TraVO traVO = new TraVO();
		
//		traVO.setTra_no(tra_no);
		traVO.setMem_id(mem_id);
		traVO.setTra_action(tra_action);
		traVO.setTra_price(tra_price);
		traVO.setTra_status(tra_status);
		dao.insert(traVO);
		MemberVO memberVO=new MemberVO();
		memberVO.setMemId(mem_id);
		memberVO.setTraBal(tra);
		dao.savePick(memberVO);
		return traVO;
	}

}
