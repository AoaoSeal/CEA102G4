package com.grep.model;

import java.sql.Date;
import java.util.List;

public class GrepService {
	private GrepDAO_interface dao;

	public GrepService() {
		dao = new GrepDAO();
	}

	public GrepVO addGrep(int gd_no, int mem_id, String grep_text, 
			int grep_status) {

		GrepVO srepVO = new GrepVO();
		
		srepVO.setGd_no(gd_no);
		srepVO.setMem_id(mem_id);
		srepVO.setGrep_text(grep_text);
		srepVO.setGrep_status(grep_status);

		dao.insert(srepVO);

		return srepVO;
	}

	public GrepVO updateGrep(int grep_no,int gd_no, int mem_id, String grep_text, 
			int grep_status) {

		GrepVO srepVO = new GrepVO();

		srepVO.setGrep_no(grep_no);
		srepVO.setGd_no(gd_no);
		srepVO.setMem_id(mem_id);
		srepVO.setGrep_text(grep_text);
		srepVO.setGrep_status(grep_status);
		dao.update(srepVO);

		return srepVO;
	}

	public void deleteGrep(Integer grep_no) {
		dao.delete(grep_no);
	}

	public GrepVO getOneGrep(Integer grep_no) {
		return dao.findByPrimaryKey(grep_no);
	}

	public List<GrepVO> getAll() {
		return dao.getAll();
	}
	
	public List<GrepVO> getAll1(Integer mem_id) {
		return dao.getAll1(mem_id);
	}
}
