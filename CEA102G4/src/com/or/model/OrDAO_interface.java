package com.or.model;

import java.util.List;

import com.goods.model.GoodsVO;
import com.member.model.MemberVO;


public interface OrDAO_interface {
	public void insert(OrVO orVO);
	public void sale(GoodsVO goodsVO);
	public void pay(MemberVO memberVO);
    public void update(OrVO orVO);
    public void ship(OrVO orVO);
    public OrVO findByPrimaryKey(Integer or_no);
    public List<OrVO> getAll();
    public List<OrVO> getAll3(Integer mem_id);
    public List<OrVO2> getAllSeller(Integer mem_id);
    
}
