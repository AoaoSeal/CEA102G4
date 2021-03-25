package com.artrep.model;

import java.util.List;

public interface ArtRepDAO_interface {
	
	public void add(ArtRepVO artRep);
	public void update(ArtRepVO artRep);
	public void updateStatus(ArtRepVO artRep);
	public void delete(int artRepNo);
	public List<ArtRepVO> getAll();

}
