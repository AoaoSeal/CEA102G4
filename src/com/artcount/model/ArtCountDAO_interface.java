package com.artcount.model;

import java.util.List;

public interface ArtCountDAO_interface {
	public void add(ArtCountVO artCount);
	public void delete(ArtCountVO artCount);
	public List<ArtCountVO> memberCount(Integer memId);
	public Integer artCount(Integer artNo);
	public ArtCountVO ifmemberCount(ArtCountVO artCount);

}
