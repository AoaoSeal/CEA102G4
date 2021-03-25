package com.leader.model;

import java.util.List;


public interface LdDAO_interface {
	
	public void insert(LdVO ldVO);
	public void update(LdVO ldVO);
	public void delete(Integer ldNo);
	public LdVO findByPrimaryKey(Integer ldNo);
	public LdVO findByMail(String ldMail);
	public List<LdVO> getAll();
}
