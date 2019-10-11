package com.mycompany.mysolution;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.mysolution.budget.domain.BudgetMgr;
import com.mycompany.mysolution.budget.repository.BudgetMgrMapper;
import com.mycompany.mysolution.common.paging.Page;
import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.edi.domain.EdiBudgetUse;
import com.mycompany.mysolution.edi.domain.EdiCoWork;
import com.mycompany.mysolution.edi.domain.EdiInform;
import com.mycompany.mysolution.edi.domain.EdiMaster;
import com.mycompany.mysolution.edi.domain.EdiSett;
import com.mycompany.mysolution.edi.domain.EdiWorkDay;
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
	
	@Autowired
	private BudgetMgrMapper budgetMgrMapper;
	
	@SuppressWarnings("deprecation")
	@Test
	public void getEdiTest() {
		
		Map<String, Object> datas = new HashMap<>();	
		
		EdiMaster edi = new EdiMaster();
		edi.setEdiCode("E0000131");
		edi.setTDate(new Date(2019, 10, 1));
		edi.setFDate(new Date(2019, 10, 15));
		edi.setEdiType("0001");
		edi.setEdiTitle("");
		edi.setInpEmpCode("");
		
		Page paging = new Page();
		paging.setPage(1);
		
		datas.put("page", 1);
		datas.put("countPerPage", 10);
		datas.put("edi", edi);
		
		log.info("datas: " + datas);
		
		ediMapper.getEdiMasterAll(datas).forEach(arr -> log.info(arr));
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
	
	
	@Test
	public void createEdiTest() {
		Map<String, Object> ediDatas = new HashMap<>();
		EdiMaster edi = new EdiMaster();
		ediDatas.put("edi2", edi);
		
		EdiMaster edi2 = (EdiMaster)ediDatas.get("edi2");
		
		edi2.setEdiCode(ediMapper.getEdiCodeSeq());
		edi2.setInpEmpCode("H0002");
		edi2.setEdiTitle("매퍼 일반품의 입력 테스트2");
		edi2.setEdiContents("매퍼 일반품의 입력 테스트2");
		edi2.setEdiType("0001");
		edi2.setEdiStatus("0");
		
		ediMapper.createEdiMaster(edi);
		log.info("createEdiTest 성공");
	}
	
	@Test
	public void createEdiSett() {
		EdiSett ediSett = new EdiSett();
		ediSett.setEdiCode("E0000001");
		ediSett.setEdiSeq(1);
		ediSett.setSettEmpCode("H0001");
		ediSett.setEdiSettStatus("1");
		ediSett.setEdiComments("내용 확인하였습니다. 결재합니다.");
		
		ediMapper.createEdiSett(ediSett);
		log.info("createEdiSett 성공");
	}
	
	@Test
	public void createEdiCoWork() {
		EdiCoWork ediCoWork = new EdiCoWork();
		ediCoWork.setEdiCode("E0000001");
		ediCoWork.setEdiSeq(2);
		ediCoWork.setCoWorkDeptCode("IT");
		ediCoWork.setEdiCoWorkStatus("1");
		ediCoWork.setEdiCoWorkComments("합의하였습니다");
		
		ediMapper.createCoWork(ediCoWork);
		log.info("createEdiCoWork 성공");
	}
	
	@Test
	public void createEdiInform() {
		EdiInform ediInform = new EdiInform();
		ediInform.setEdiCode("E0000001");
		ediInform.setEdiSeq(1);
		ediInform.setInformDeptCode("FINANCE");
		
		ediMapper.createInform(ediInform);
		log.info("createEdiInform 성공");		
	}
	
	@SuppressWarnings("deprecation")
	@Test
	public void createEdiWorkDay() {
		EdiWorkDay ediWorkDay = new EdiWorkDay();
		ediWorkDay.setEdiCode(ediMapper.getEdiCodeSeq());
		ediWorkDay.setEdiWorkDate(new Date(2019, 10, 1));
		ediWorkDay.setEdiWorkType("01");
		ediWorkDay.setEdiEmpCode("H0001");
		
		ediMapper.createWorkDay(ediWorkDay);
		log.info("createEdiWorkDay 성공");
	}
	
	@SuppressWarnings("deprecation")
	@Test
	public void createEdiBudgetUse() {
		EdiBudgetUse ediBudgetUse = new EdiBudgetUse();		
		ediBudgetUse.setEdiCode(ediMapper.getEdiCodeSeq());
		ediBudgetUse.setBankAccount("12345678900");
		ediBudgetUse.setBankName("KB하나");
		ediBudgetUse.setBankOwner("오민철");
		ediBudgetUse.setUseBudget(400000L);
		ediBudgetUse.setRefundDate(new Date(2019, 10, 1));
		
		ediMapper.createBudgetUse(ediBudgetUse);
		log.info("createEdiBudgetUse 성공");
	}
	
	@Test
	public void getEdiMasterContent() {
		log.info(ediMapper.getEdiMaster("E0000059"));		
	}
	
	@Test
	public void getEdiSettContent() {
		log.info(ediMapper.getEdiSett("E0000059"));
	}
	
	@Test
	public void getEdiWorkDay() {
		log.info(ediMapper.getEdiWorkDay("E0000060"));
	}
	
	@Test
	public void getEdiCowork() {
		log.info(ediMapper.getEdiCoWork("E0000130"));
	}
	
	@Test
	public void getEdiInform() {
		log.info(ediMapper.getEdiInform("E0000082"));
	}
	
	@Test
	public void getRefund() {
		log.info(ediMapper.getRefund("E0000128"));
	}
	
	@Test
	public void getAvailable() {
		log.info(budgetMgrMapper.getAvailableAmt("IT"));
	}
	
	@Test
	public void budgetUpdate() {
		BudgetMgr budgetMgr = new BudgetMgr();
		budgetMgr.setDeptCode("IT");
		budgetMgr.setUseBudget(500L);
		budgetMgrMapper.updateBudgetMgr(budgetMgr);
		log.info("budgetUpdate 완료");
	}
	
	@Test
	public void getEdiMasterChk() {
		int cntChk = ediMapper.getEdiMasterChk("E0000125");
		log.info("getEdiMasterChk: " + cntChk);
	}
	
}
