package com.member.model;

import java.util.*;

public interface MemberDAO_interface {

	public void insert(MemberVO memberVO);

	public void update(MemberVO memberVO);

	public void delete(Integer memStatus, Integer memId);

	public MemberVO findByPrimaryKey(Integer memId);

	public MemberVO findByMail(String memMail);
	
	public List<MemberVO> getAll();


}
