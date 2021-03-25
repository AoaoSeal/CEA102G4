package com.itinerary.model;

import java.util.List;
import java.util.Map;

public interface ItDAO_interface {

	public void insert(ItVO itVO);
	public void update(ItVO itVO);
	public void updatePeoCount(ItVO itVO);
	public void updateStatus(ItVO itVO);
	public ItVO findByPrimaryKey(Integer itNo);
    public List<ItVO> getAll();
    public List<ItVO> getAllbyStatus0();
    public List<ItVO> getAllbyLdNo();
    public List<ItVO> getAll(Map<String, String[]> map); 
}
