package com.srep.model;

import java.util.List;

public class SrepService {
	private SrepDAO_interface dao;

	public SrepService() {
		dao = new SrepDAO();
	}

	public SrepVO addSrep(int or_no, int mem_id,
			 String srep_text, String srep_mediumblob, 
			int srep_status) {

		SrepVO srepVO = new SrepVO();
		
//		srepVO.setSrep_no(srep_no);
		srepVO.setOr_no(or_no);
		srepVO.setMem_id(mem_id);
		srepVO.setSrep_text(srep_text);
		srepVO.setSrep_mediumblob(srep_mediumblob);
		srepVO.setSrep_status(srep_status);

		dao.insert(srepVO);

		return srepVO;
	}

	public SrepVO updateSrep(int srep_no,int or_no, int mem_id, String srep_text, String srep_mediumblob, 
			int srep_status) {

		SrepVO srepVO = new SrepVO();

		srepVO.setSrep_no(srep_no);
		srepVO.setOr_no(or_no);
		srepVO.setMem_id(mem_id);
		srepVO.setSrep_text(srep_text);
		srepVO.setSrep_mediumblob(srep_mediumblob);
		srepVO.setSrep_status(srep_status);
		dao.update(srepVO);

		return srepVO;
	}

	public void deleteSrep(Integer srep_no) {
		dao.delete(srep_no);
	}

	public SrepVO getOneSrep(Integer srep_no) {
		return dao.findByPrimaryKey(srep_no);
	}

	public List<SrepVO> getAll() {
		return dao.getAll();
	}
}
