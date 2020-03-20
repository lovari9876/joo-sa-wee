package edu.bit.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.bit.board.mapper.EmpMapper;
import edu.bit.board.vo.DeptEmpVO;
import edu.bit.board.vo.EmpVO;


@Service
public class EmpService {
	
	@Inject
	EmpMapper empMapper;
	
	public ArrayList<EmpVO> selectAllEmpList() {
			return empMapper.selectAllEmpList() ;
   }
	
   public DeptEmpVO selectEmpDeptName(int deptno) {
		return empMapper.selectEmpDeptName(deptno) ;
   }
   
	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap() {
		return empMapper.selectAllEmpListHashMap() ;
}


}
