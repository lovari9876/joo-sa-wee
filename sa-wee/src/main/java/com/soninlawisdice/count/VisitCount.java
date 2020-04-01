package com.soninlawisdice.count;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.soninlawisdice.mapper.AdminMapper;

@Component
@Scope(value = "singleton")
public class VisitCount {

	@Autowired
	AdminMapper adminMapper;
	

	private static VisitCount instance;

	// 싱글톤 패턴
	private VisitCount() {
	}

	public static VisitCount getInstance() {
		if (instance == null)
			instance = new VisitCount();
		return instance;
	}

	public void setTotalCount(){
		adminMapper.setTotalCount();
	} 


	public int getTodayCount() {
		return adminMapper.getTodayCount();
	}

	public int getTotalCount() {
		return adminMapper.getTotalCount();
	}

}
