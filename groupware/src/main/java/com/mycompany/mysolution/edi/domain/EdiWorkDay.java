package com.mycompany.mysolution.edi.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EdiWorkDay {
	String ediCode;
	String ediEmpCode;
	String ediWorkType;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ediWorkDate;
	Date inpDate;
	Date updateDate;
}
