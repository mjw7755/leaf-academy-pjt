package com.leaf.controller.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.service.NoticeDAO;
import com.leaf.model.service.NoticeDTO;
//import com.leaf.model.service.QnaDTO;

@Controller
public class NoticeController {

	@Resource
	private NoticeDAO noticeDAO;
	
	@RequestMapping("/notice_list.do")
	public String list(Model model, HttpServletRequest request) {
		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {page = 1;} 
		else {page = Integer.parseInt(request.getParameter("page"));}
		List<NoticeDTO> list = noticeDAO.noticeSelect(page);
		int count = noticeDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		
		return "notice.list";
	}
	
	@RequestMapping("/notice_writeform.do")
	public String writeForm() {
		return "notice.writeform";
	}
	
	
	@RequestMapping("/notice_write.do")
	public ModelAndView write(NoticeDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat df =new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
		Date date = new Date();
		String notice_writedate = df.format(date);
		dto.setNotice_writedate(notice_writedate);
		
		noticeDAO.noticeInsert(dto);
		mav.setViewName("redirect:notice_list.do");
		return mav;
	}
	
	@RequestMapping("/notice_delete.do")
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int notice_id = new Integer(request.getParameter("notice_id"));
		noticeDAO.noticeDelete(notice_id);
		mav.addObject("message", notice_id + " 삭제");
		mav.setViewName("redirect:notice_list.do");
		return mav;
	}
	
	@RequestMapping("/notice_updateform.do")
	public ModelAndView updateForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int notice_id = new Integer(request.getParameter("notice_id"));
		NoticeDTO dto = noticeDAO.noticeSelectId(notice_id);
		mav.addObject("dto", dto);
		mav.setViewName("notice.updateform");
		return mav;
	}
	
	@RequestMapping("/notice_update.do")
	public ModelAndView update(NoticeDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat df =new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
		Date date = new Date();
		String notice_modifydate = df.format(date);
		dto.setNotice_modifydate(notice_modifydate);
		noticeDAO.noticeUpdate(dto);
		mav.setViewName("redirect:notice_list.do");
		return mav;
	}
	
	@RequestMapping("/notice_detail.do")
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int notice_id = new Integer(request.getParameter("notice_id"));
		NoticeDTO dto = noticeDAO.noticeSelectId(notice_id);
		mav.addObject("dto", dto);
		mav.setViewName("notice.detail");
		return mav;
	}
	
	@RequestMapping("/notice_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List deleteTarget = new ArrayList();
		for(String item : request.getParameter("notice_id").split(",")) {
			deleteTarget.add(item);
		}
		int deleteNum = noticeDAO.multiqnaDelete(deleteTarget);
		mav.setViewName("redirect:notice_list.do");
		return mav;
	}
	
	@RequestMapping("/notice_search.do")
	public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//컬럼명
	      String column =request.getParameter("column");
	      String keyvalue = request.getParameter("keyvalue");
	      System.out.println(column + " / " + keyvalue);
	      
	      Map<String, String> map = new HashMap<String, String>(); //collection
	      map.put("column",column ); //column : name or email or home
	      map.put("keyvalue", keyvalue); //keyvalue 
		
		List<NoticeDTO> list = noticeDAO.searchSelect(map);
		model.addAttribute("list", list);
		return "notice.list";
	}
}
