package com.soninlawisdice.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.AdminServiceImpl;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.ReportVO;

/**
 * Handles requests for the application home page.
 */
@RestController
@RequestMapping("/rest/*")
public class AdminRestController {

	private static final Logger logger = LoggerFactory.getLogger(AdminRestController.class);


	@Autowired
	private AdminServiceImpl adminService;
	
	

	
	///////////////////////////json//////////////////////////////////////////////
	// 차트 데이터 
	
	@RequestMapping("/chart_data")
	public List<StatisticsVO> chart_data(Model model) throws Exception {
		
		List<StatisticsVO> list = adminService.chartData();
		model.addAttribute("report_list", list);
		
		
		return adminService.chartData();
		//return 값은 String이 아닌 객체로 
	}
	
	
//	@RequestMapping("/report_view")
//	public String report_view(StatisticsVO statisticsVO, Model model) throws Exception {
//		int id = statisticsVO.getSt_no();
//		AdminVO view = adminService.selectAdminView(id);
//		model.addAttribute("report_view", view);
//		
//		return "report_view";
//	}
	
	
	////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/report_list")
	public List<ReportVO> report_list(Model model) throws Exception {
		
		List<ReportVO> list = adminService.reportTab();
		model.addAttribute("report_list", list);
		
		return adminService.reportTab();
		//return 값은 String이 아닌 객체로 
	}
	
	
	@RequestMapping("/report_view")
	public String report_view(ReportVO reportVO, Model model) throws Exception {
		int id = reportVO.getR_no();
		ReportVO view = adminService.selectReportView(id);
		model.addAttribute("report_view", view);
		
		return "report_view";
	}
	
	
	
	
	
	
	
	

}