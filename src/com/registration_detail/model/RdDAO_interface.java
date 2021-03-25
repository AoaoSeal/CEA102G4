package com.registration_detail.model;

import java.util.List;
import java.util.Map;

import com.itinerary.model.ItVO;

public interface RdDAO_interface {

	public void insert(ItVO rdVO);
	public void update(ItVO rdVO);
	public void delete(Integer rdNo);
	public RdVO findByRmNo(Integer rmNo);
    public List<RdVO> getAll();
    public List<RdVO> getAllbyRmNo();
    public List<RdVO> getAll(Map<String, String[]> map); 
    
    //同時新增主檔rm與參加者明細rd
    public void insert2 (RdVO rdVO , java.sql.Connection con);
}
