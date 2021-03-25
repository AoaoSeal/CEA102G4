package com.grep.model;

import java.util.List;

import com.grep.model.GrepVO;

public interface GrepDAO_interface {
	 public void insert(GrepVO grepVO);
     public void update(GrepVO grepVO);
     public void delete(Integer grep_no);
     public GrepVO findByPrimaryKey(Integer grep_no);
     public List<GrepVO> getAll();
     public List<GrepVO> getAll1(Integer mem_id);
}
