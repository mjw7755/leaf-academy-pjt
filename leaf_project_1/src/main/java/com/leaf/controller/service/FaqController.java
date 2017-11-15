package com.leaf.controller.service;

import java.util.ArrayList;
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

import com.leaf.model.service.FaqDAO;

import com.leaf.model.service.FaqDTO;

@Controller
public class FaqController {

	@Resource
	private FaqDAO faqDAO;

	@RequestMapping("/faq_list.do")
	public String list(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<FaqDTO> list = faqDAO.faqSelect();
		model.addAttribute("list", list);
		return "faq.faq_list";
	}

	@RequestMapping("/faq_writeform.do")
	public String write() {
		return "faq.writeform";
	}

	@RequestMapping("faq_write.do")
	public ModelAndView write(FaqDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		String faq_content = dto.getFaq_content();
		faq_content = faq_content.replace("\r\n", "<BR/>");
		dto.setFaq_content(faq_content);
		faqDAO.faqInsert(dto);
		mav.setViewName("redirect:faq_list.do");
		return mav;
	}

	@RequestMapping("/faq_delete.do")
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int faq_id = new Integer(request.getParameter("faq_id"));
		faqDAO.faqDelete(faq_id);
		mav.addObject("message", faq_id + " 삭제");
		mav.setViewName("redirect:faq_list.do");
		return mav;
	}

	@RequestMapping("/faq_updateform.do")
	public ModelAndView updateForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int faq_id = new Integer(request.getParameter("faq_id"));
		FaqDTO dto = faqDAO.faqSelectId(faq_id);
		String faq_content = dto.getFaq_content().replace("<BR/>", "\r\n");
		dto.setFaq_content(faq_content);
		mav.addObject("dto", dto);
		mav.setViewName("faq.updateform");
		return mav;
	}

	@RequestMapping("/faq_detail.do")
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int faq_id = new Integer(request.getParameter("faq_id"));
		FaqDTO dto = faqDAO.faqSelectId(faq_id);
		mav.addObject("dto", dto);
		mav.setViewName("faq.detail");
		return mav;
	}

	@RequestMapping("/faq_update.do")
	public ModelAndView update(FaqDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		faqDAO.faqUpdate(dto);
		mav.setViewName("redirect:faq_list.do");
		return mav;
	}

	@RequestMapping("/faq_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("faq_id").split(",")) {
			deleteTarget.add(item);
		}
		// int deleteNum = faqDAO.multiqnaDelete(deleteTarget);
		mav.setViewName("redirect:faq_list.do");
		return mav;
	}

	@RequestMapping("/faq_search.do")
	public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 컬럼명
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");
		System.out.println(column + " / " + keyvalue);

		Map<String, String> map = new HashMap<String, String>(); // collection
		map.put("column", column); // column : name or email or home
		map.put("keyvalue", keyvalue); // keyvalue

		List<FaqDTO> list = faqDAO.searchSelect(map);
		model.addAttribute("list", list);
		return "faq.list";
	}
}
