package com.gdet.model;

import java.util.List;
import java.util.Set;

import com.goods.model.GoodsVO;


public class GdetService {
	private GdetDAO_interface dao;

	public GdetService() {
		dao = new GdetDAO();
	}

	public List<GdetVO> getAll() {
		return dao.getAll();
	}

	public GdetVO getOneGdet(Integer mem_id, Integer gd_no) {
		return dao.findByPrimaryKey(mem_id,gd_no);
	}

	public Set<GoodsVO> getGoodsByGdet_no(Integer mem_id, Integer gd_no) {
		return dao.getGoodsByGdet_no(mem_id,gd_no);
	}

}
