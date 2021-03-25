package com.gdet.model;

import java.util.List;
import java.util.Set;

import com.goods.model.GoodsVO;


public interface GdetDAO_interface {
	public void insert(GdetVO gdetVO);
    public void update(GdetVO gdetVO);
    public GdetVO findByPrimaryKey(Integer mem_id,Integer gd_no);
    public List<GdetVO> getAll();
    public Set<GoodsVO> getGoodsByGdet_no(Integer mem_id,Integer gd_no);
}
