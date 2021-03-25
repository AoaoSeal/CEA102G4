package com.msgrep.model;

import java.util.List;

public interface MsgRepDAO_interface {
	public void add (MsgRepVO msgRep);
	public void update(MsgRepVO msgRep);
	public void updateStatus(MsgRepVO msgRep);
	public void delete(Integer msgRepNo);
	public MsgRepVO finkByPk(Integer msgRepNo);
	public List<MsgRepVO> getAll();
	

}
