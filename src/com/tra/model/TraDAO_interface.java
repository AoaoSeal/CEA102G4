package com.tra.model;

import java.util.List;

import com.member.model.MemberVO;



public interface TraDAO_interface {
	public void insert(TraVO traVO);
    public void update(TraVO traVO);
    public void savePick(MemberVO memVO);
    public TraVO findByPrimaryKey(Integer tra_no);
    public List<TraVO> getAll();
    public List<TraVO> getAll3(Integer mem_id);
}
