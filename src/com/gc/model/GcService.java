package com.gc.model;

import java.util.List;
import java.util.Set;

import com.goods.model.GoodsVO;

public class GcService {
	private GcDAO_interface dao;

	public GcService() {
		dao = new GcDAO();
	}

	public List<GcVO> getAll() {
		return dao.getAll();
	}

	public GcVO getOneGc(Integer gc_no) {
		return dao.findByPrimaryKey(gc_no);
	}

	public Set<GoodsVO> getGoodsByGc_no(Integer gc_no) {
		return dao.getGoodsByGc_no(gc_no);
	}

}
