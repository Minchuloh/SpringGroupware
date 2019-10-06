package com.mycompany.mysolution.emp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DeptList {
	String deptCode;
	String deptName;
	String mgrEmpCode;
	Date inpDate;
	Date updateDate;
}
