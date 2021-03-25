package com.emp.model;
import java.sql.Date;

public class EmpVO implements java.io.Serializable{
	private Integer empNo;
	private String empName;
	private String empEmail;
	private String empPass;
	private Integer empSex;
	private String empPhone;
	private Integer statusNo;
	private Integer positionNo;
	
	
	public EmpVO() {
		
	}
	public Integer getEmpNo() {
		return empNo;
	}
	public void setEmpNo(Integer empNo) {
		this.empNo = empNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpPass() {
		return empPass;
	}
	public void setEmpPass(String empPass) {
		this.empPass = empPass;
	}
	public Integer getEmpSex() {
		return empSex;
	}
	public void setEmpSex(Integer empSex) {
		this.empSex = empSex;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public Integer getStatusNo() {
		return statusNo;
	}
	public void setStatusNo(Integer statusNo) {
		this.statusNo = statusNo;
	}
	public Integer getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(Integer positionNo) {
		this.positionNo = positionNo;
	}
	

}
