package com.mycompany.mysolution;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.repository.EdiMasterMapper;
import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.repository.EmpListMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/resources/spring/mvc-config.xml"})
@ContextConfiguration(locations = {"classpath:/spring/mvc-config.xml"})
@Log4j
public class RepositoryTest {
	
	@Autowired
	private EdiMasterMapper ediMapper;
	
	@Autowired
	private EmpListMapper empMapper;
	
	@Test
	public void getEdiTest() {
		Search paging = new Search();
		paging.setPage(1);
		ediMapper.getEdiMasterAll(paging).forEach(edi -> log.info(edi));
	}
	
	@Test
	public void getEmpListTest() {
		empMapper.getEmpList().forEach(emp -> log.info(emp));
	}
	
	@Test
	public void getEmpTest() {
		log.info(empMapper.getEmp("H0003"));
	}
	
	@Test
	public void getEmpCode() {
		log.info("empCode:" + empMapper.getEmpCodeSeq());
	}
	
	@SuppressWarnings("deprecation")
	@Test
	public void createEmpTest() {		
		EmpList emp = new EmpList();
		emp.setEmpCode(empMapper.getEmpCodeSeq());
		emp.setEmpName("test");
		emp.setPassword("1234");
		emp.setEmail("test11@test.com");
		emp.setPhone("01054435552");
		emp.setDeptCode("SALES");
		emp.setPosition("INTERN");
		emp.setSalary(5000000);
		emp.setBankName("KB하나");
		emp.setBankAccount("123124234234");
		emp.setPhoto("test_photo");
		emp.setHireDate(new Date(2019, 10, 1));
		
		log.info("생성 입력 : " + emp);
		
		empMapper.createEmp(emp);
		

	}
	
	@Test
	public void modifyEmpTest() {
		EmpList emp = new EmpList();
		emp.setEmpCode("H0003");
		emp.setEmpName("강감찬");
		
		log.info("수정이름 : " + emp.getEmpName());
		
		empMapper.modifyEmpName(emp);
	}
	
	@Test
	public void deleteEmpTest() {
		EmpList emp = new EmpList();
		emp.setEmpCode("H0004");
		emp = empMapper.getEmp(emp.getEmpCode());
		
		log.info("삭제 대상자 : " + emp);
		
		empMapper.deleteEmp(emp.getEmpCode());
		
	}
	
	@Test
	public void getEmpListWithPaging() {
		Search paging = new Search();		
		paging.setPage(1);		
		empMapper.getEmpListWithPaging(paging).forEach(emp -> log.info(emp));
	}
	
	@Test
	public void getEdiTotalCountTest() {
		log.info("count: " + ediMapper.getEdiTotalCount());
	}
	
}
