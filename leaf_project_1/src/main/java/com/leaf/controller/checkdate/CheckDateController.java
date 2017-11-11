package com.leaf.controller.checkdate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.curriculum.LectDAO;
import com.leaf.model.curriculum.LectDTO;

@Controller
public class CheckDateController {
	
	@Autowired
	private LectDAO  lectDAO;
	
	@RequestMapping("/attendForm.do")
	public ModelAndView excel(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		ArrayList list = new ArrayList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		
		LectDTO dto = lectDAO.getCheckDate(sessionid);
		String start = dto.getLect_start_day();
		String end = dto.getLect_end_day();
		Date start_date = sdf.parse(start);
		Date end_date = sdf.parse(end);
		int count = 0;
		int year = start_date.getYear();
		long result_time = end_date.getTime() - start_date.getTime();
		
		long  diff_date = result_time/(60*60*24*1000);
		int temp = start_date.getDay();
		int start_month = start_date.getMonth();
		int end_month = end_date.getMonth();
		
		for(int i=0; i<diff_date;i++) {
			
			temp %= 7;
			if(temp == 1 || temp== 4) {
				count++;
			}
			temp++;
		}
		
		/*response.setHeader("Content-Disposition", "attachment; filename=다운로드.xls");  
		response.setHeader("Content-Description", "JSP Generated Data");  
		response.setContentType("application/vnd.ms-excel"); */
		
		mav.addObject("count", count);
		mav.addObject("start_month",start_month);
		mav.addObject("end_month",end_month);
		mav.setViewName("moon.attendForm");
		return mav;
	}
}
