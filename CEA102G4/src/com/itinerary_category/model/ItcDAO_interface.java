package com.itinerary_category.model;

import java.util.*;

import com.itinerary.model.ItVO;

public interface ItcDAO_interface {

	public void insert(ItcVO itcVO);
	public void update(ItcVO itcVO);
	public void delete(Integer itcNo);
	public ItcVO findByPrimaryKey(Integer itcNo);
	public List<ItcVO> getAll();
	public Set<ItVO> getItsByItcno(Integer itcNo);
}
