package com.artsave.model;

import java.util.List;

public interface ArtSaveDAO_interface {
	public void add(ArtSaveVO artSave);
	public void delete(ArtSaveVO artSave);
	
	public List<ArtSaveVO> getSaveByArt();
	public List<ArtSaveVO> getSaveByMem(Integer memId);
}
