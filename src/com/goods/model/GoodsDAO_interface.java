package com.goods.model;

import java.util.List;
import java.util.Map;

import com.goods.model.GoodsVO;

public interface GoodsDAO_interface {
	 public void insert(GoodsVO goodsVO);
     public void update(GoodsVO goodsVO);
     public void delete(Integer gd_no);
     public GoodsVO findByPrimaryKey(Integer gd_no);
     public List<GoodsVO> getAll();
     public List<GoodsVO> getAll2();
     public List<GoodsVO> getAll3(Integer mem_id);
     public List<GoodsVO> getAll(Map<String, String[]> ma);
}
