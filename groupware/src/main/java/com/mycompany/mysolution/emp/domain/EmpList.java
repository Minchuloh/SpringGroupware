package com.mycompany.mysolution.emp.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmpList {
	
	String empCode;
	String empName;
	String password;
	String email;
	String phone;
	String deptCode;
	String deptName;
	String position;
	Integer salary;
	String bankName;
	String bankAccount;
	String photo;
	String fireYn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date hireDate;
	Date fireDate;
	String sessionId;
	String limitTime;
	String lastLoginAt;
	Date inpDate;
	Date updateDate;
	
	DeptList deptList;
	
}
