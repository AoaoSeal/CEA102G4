package com.emp.model;

import java.util.*;

import com.leader.model.LdVO;

public interface EmpDAO_interface {
          public void insert(EmpVO empVO);
          public void update(EmpVO empVO);
          public void delete(Integer empno);
          public EmpVO findByPrimaryKey(Integer empno);
          public EmpVO findByMail(String empEmail);
          public List<EmpVO> getAll();

}
