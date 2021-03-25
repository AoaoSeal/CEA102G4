package com.srep.model;

import java.util.List;

import com.srep.model.SrepVO;

public interface SrepDAO_interface {
	 public void insert(SrepVO srepVO);
     public void update(SrepVO srepVO);
     public void delete(Integer srep_no);
     public SrepVO findByPrimaryKey(Integer srep_no);
     public List<SrepVO> getAll();
}
