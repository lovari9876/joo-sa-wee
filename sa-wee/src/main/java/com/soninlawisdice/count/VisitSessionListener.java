package com.soninlawisdice.count;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

public class VisitSessionListener implements HttpSessionListener {
	@Autowired
	private VisitCount visitCount = null;

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		// 세션이 새로 생성되면 execute() 실행한다.
		if (sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
	}
	
	 private void execute(HttpSessionEvent sessionEve)   {
	        VisitCount visitCount = VisitCount.getInstance();
	        System.out.println("======== 리스너실행 ========== \n");
	        
	        try {
	            // 전체 방문자 수 증가
	            visitCount.setTotalCount();
	            System.out.println("========= setTotalCount =====\n");
	            
	            // 총 방문자 수
	            int totalCount = visitCount.getTotalCount();
	            // 오늘 방문자 수
	            int todayCount = visitCount.getTodayCount();
	            
	            HttpSession session = sessionEve.getSession();
	            
	            // 세션에 방문자 수를 담는다.
	            session.setAttribute("totalCount", totalCount); 
	            session.setAttribute("todayCount", todayCount);
	            System.out.println("========= Count END =====\n");
	            
	        } catch (Exception e) {
	            System.out.println("========= 방문자 카운터 오류 =========\n");
	            e.printStackTrace();
	        }
	    }

	
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}

}
