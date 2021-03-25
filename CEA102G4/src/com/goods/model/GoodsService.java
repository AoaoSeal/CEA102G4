package com.goods.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class GoodsService {
	private GoodsDAO_interface dao;

	public GoodsService() {
		dao = new GoodsDAO();
	}

	public GoodsVO addGoods(int gc_no, int mem_id,String gd_name,int gd_price,
			 int gd_qty, String gd_text, String gd_mediumblob, 
			int gd_status,int gd_shelf) {

		GoodsVO goodsVO = new GoodsVO();
		
//		goodsVO.setGd_no(gd_no);
		goodsVO.setGc_no(gc_no);
		goodsVO.setMem_id(mem_id);
		goodsVO.setGd_name(gd_name);
		goodsVO.setGd_price(gd_price);
		goodsVO.setGd_qty(gd_qty);
		goodsVO.setGd_text(gd_text);
		goodsVO.setGd_mediumblob(gd_mediumblob);
		goodsVO.setGd_status(gd_status);
		goodsVO.setGd_shelf(gd_shelf);

		dao.insert(goodsVO);

		return goodsVO;
	}

	public GoodsVO updateGoods(int gd_no,int gc_no, int mem_id,String gd_name,int gd_price,
			 int gd_qty, String gd_text, String gd_mediumblob, 
			int gd_status,int gd_shelf) {

		GoodsVO goodsVO = new GoodsVO();

		goodsVO.setGd_no(gd_no);
		goodsVO.setGc_no(gc_no);
		goodsVO.setMem_id(mem_id);
		goodsVO.setGd_name(gd_name);
		goodsVO.setGd_price(gd_price);
		goodsVO.setGd_qty(gd_qty);
		goodsVO.setGd_text(gd_text);
		goodsVO.setGd_mediumblob(gd_mediumblob);
		goodsVO.setGd_status(gd_status);
		goodsVO.setGd_shelf(gd_shelf);
		dao.update(goodsVO);

		return goodsVO;
	}

	public void deleteGoods(Integer gd_no) {
		dao.delete(gd_no);
	}

	public GoodsVO getOneGoods(Integer gd_no) {
		return dao.findByPrimaryKey(gd_no);
	}

	public List<GoodsVO> getAll() {
		return dao.getAll();
	}
	
	
	public List<GoodsVO> getAll2() {
		return dao.getAll2();
	}
	
	public List<GoodsVO> getAll3(Integer mem_id) {
		return dao.getAll3(mem_id);
	}
	
	public List<GoodsVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
}
