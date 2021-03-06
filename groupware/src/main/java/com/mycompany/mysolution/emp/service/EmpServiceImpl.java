package com.mycompany.mysolution.emp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.mysolution.common.searching.Search;
import com.mycompany.mysolution.emp.domain.EmpList;
import com.mycompany.mysolution.emp.repository.EmpListMapper;

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpListMapper empMapper;

	@Transactional
	@Override
	public void createEmp(EmpList emp) {
		
		String rawPw = emp.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodePw = encoder.encode(rawPw);
		emp.setPassword(encodePw);
		emp.setEmpCode(empMapper.getEmpCodeSeq());		
		empMapper.createEmp(emp);
	}
	
	@Override
	public boolean isDuplicate(String kind, String info) {
		
		//log.info("중복체크 종류: " + kind);
		//log.info("중복체크할 데이터: " + info);
		
		Map<String, Object> datas = new HashMap<>();
		datas.put("kind", kind);
		datas.put("info", info);
		int resultNum = empMapper.isDuplicate(datas);
		
		if(resultNum == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public Integer getTotalCount(Search paging) {
		return empMapper.getTotalCount(paging);
	}

	@Override
	public List<EmpList> getEmpList() {
		return empMapper.getEmpList();
	}
	
	@Override
	public EmpList getBankInfo(String empCode) {
		return empMapper.getBankInfo(empCode);
	}

	@Override
	public EmpList getEmp(String empCode) {
		return empMapper.getEmp(empCode);
	}
	
	@Override
	public List<EmpList> getEmpListWithPaging(Search paging) {
		return empMapper.getEmpListWithPaging(paging);
	}

	@Override
	public void modifyEmpName(EmpList emp) {
		empMapper.modifyEmpName(emp);
	}

	@Override
	public void deleteEmp(String empCode) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void modifyLastLoginTime(String empCode) {
		empMapper.modifyLastLoginTime(empCode);
	}
	
	@Override
	public void keepLogin(String sessionId, Date limitTime, String empCode) {

		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", sessionId);
		datas.put("limitTime", limitTime);
		datas.put("empCode", empCode);
		
		empMapper.keepLogin(datas);		
		
	}
	
	@Override
	public EmpList getEmpBySessionId(String sessionId) {
		return empMapper.getEmpBySessionId(sessionId);
	}

	@Override
	public List<EmpList> getEmpByName(String empName) {
		return empMapper.getEmpByEmpName(empName);
	}
	

}
