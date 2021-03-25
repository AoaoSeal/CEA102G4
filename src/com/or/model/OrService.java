package com.or.model;

import java.util.List;

import com.goods.model.GoodsVO;
import com.member.model.MemberVO;


public class OrService {
	private OrDAO_interface dao;

	public OrService() {
		dao = new OrDAO();
	}

	public OrVO addOr(int mem_id, String or_name, int or_price, String or_phone, String or_address,
			 int or_status, int gd_no,int gd_qty ,int traBal) {

		OrVO orVO = new OrVO();
		
		orVO.setMem_id(mem_id);
		orVO.setOr_name(or_name);
		orVO.setOr_price(or_price);
		orVO.setOr_phone(or_phone);
		orVO.setOr_address(or_address);
		orVO.setOr_status(or_status);
		orVO.setGd_no(gd_no);
		dao.insert(orVO);
		GoodsVO goodsVO=new GoodsVO();
		goodsVO.setGd_no(gd_no);
		goodsVO.setGd_qty(gd_qty);
		dao.sale(goodsVO);
		MemberVO memberVO=new MemberVO();
		memberVO.setMemId(mem_id);
		memberVO.setTraBal(traBal);
		dao.pay(memberVO);
		return orVO;
	}

	public OrVO updateOr(int or_no, int mem_id, String or_name, int or_price, String or_phone, String or_address,
			 int or_status, int gd_no) {

		OrVO orVO = new OrVO();

		orVO.setOr_no(or_no);
		orVO.setMem_id(mem_id);
		orVO.setOr_name(or_name);
		orVO.setOr_price(or_price);
		orVO.setOr_phone(or_phone);
		orVO.setOr_address(or_address);
		orVO.setOr_status(or_status);
		orVO.setGd_no(gd_no);
		dao.update(orVO);

		return orVO;
	}
	
	public OrVO ship(int or_no, int mem_id, String or_name, int or_price, String or_phone, String or_address,
			 int or_status, int gd_no) {
		
		OrVO orVO = new OrVO();
		orVO.setOr_no(or_no);

		orVO.setOr_no(or_no);
		orVO.setMem_id(mem_id);
		orVO.setOr_name(or_name);
		orVO.setOr_price(or_price);
		orVO.setOr_phone(or_phone);
		orVO.setOr_address(or_address);
		orVO.setOr_status(or_status);
		orVO.setGd_no(gd_no);
		dao.update(orVO);
		
		return orVO;
	}


	public OrVO getOneOr(Integer or_no) {
		return dao.findByPrimaryKey(or_no);
	}

	public List<OrVO> getAll() {
		return dao.getAll();
	}
	
	public List<OrVO> getAll3(Integer mem_id) {
		return dao.getAll3(mem_id);
	}
	public List<OrVO2> getAllSeller(Integer mem_id) {
		return dao.getAllSeller(mem_id);
	}
}
