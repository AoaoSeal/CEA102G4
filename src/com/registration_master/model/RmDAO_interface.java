package com.registration_master.model;

import java.util.List;
import java.util.Set;

import com.registration_detail.model.RdVO;

public interface RmDAO_interface {

	public void insert(RmVO rmVO);
	public void insertFeedback(RmVO rmVO);
	public void updateStatus(RmVO rmVO);

	public RmVO findByItnoMemid(Integer itNo,Integer memId);
	public RmVO findByRmNO(Integer rmNo);
	public List<RmVO> getAll();
	public List<RmVO> getByMemId(Integer memId);
    //查詢某主檔的參加者明細(一對多)(回傳 Set)
    public Set<RdVO> getRdByRmNo(Integer rmNo);
    
    //同時新增主檔與參加者明細 
    public void insertWithRds(RmVO rmVO , List<RdVO> list);
}
