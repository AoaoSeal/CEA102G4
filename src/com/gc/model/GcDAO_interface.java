package com.gc.model;

import java.util.List;
import java.util.Set;

import com.goods.model.GoodsVO;

public interface GcDAO_interface {
	 public void insert(GcVO gcVO);
     public void update(GcVO gcVO);
     public GcVO findByPrimaryKey(Integer gc_no);
	 public List<GcVO> getAll();
	 public Set<GoodsVO> getGoodsByGc_no(Integer gc_no);
}
