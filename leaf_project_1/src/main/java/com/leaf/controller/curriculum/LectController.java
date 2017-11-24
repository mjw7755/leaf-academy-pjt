package com.leaf.controller.curriculum;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDAO;
import com.leaf.model.curriculum.LectDTO;

@Controller
public class LectController {

	@Autowired
	private LectDAO lectDAO;

	@RequestMapping("/list_lect.do")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flag = "list";

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<LectDTO> list = lectDAO.listLect(page);
		int count = lectDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "lecture.list";
	}

	@RequestMapping("/writeform_lect.do")
	public String writeForm(Model model, HttpServletRequest request) {
		String member_id = (String) request.getSession().getAttribute("sessionid");
		List<CurriDTO> list = lectDAO.subjectcurri(member_id);
		model.addAttribute("list", list);
		return "lecture.writeForm";
	}

	@RequestMapping(value = "/write_lect.do", method = RequestMethod.POST)
	public ModelAndView write(@ModelAttribute LectDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		String lect_write_time = sdf_t.format(date);
		dto.setLect_write_time(lect_write_time);
		
		lectDAO.insertLect(dto);
		mav.setViewName("redirect:list_lect.do");
		return mav;
	}

	@RequestMapping("/delete_lect.do")
	public ModelAndView delete(@RequestParam("lect_id") int lect_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		lectDAO.deleteLect(lect_id);
		mav.setViewName("redirect:list_lect.do");
		return mav;
	}

	@RequestMapping("/update_lect.do")
	public ModelAndView update(@ModelAttribute LectDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();

		String lect_modify_time = sdf_t.format(date);
		dto.setLect_modify_time(lect_modify_time);

		lectDAO.updateLect(dto);
		mav.setViewName("redirect:list_lect.do");
		return mav;
	}

	@RequestMapping("/updateForm_lect.do")
	public ModelAndView updateForm(int lect_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		LectDTO dto = lectDAO.updateFormLect(lect_id);
		mav.addObject("dto", dto);
		mav.setViewName("lecture.updateForm");
		return mav;
	}

	@RequestMapping("/search_lect.do")
	public String search(Model model, HttpServletRequest request) throws Exception {

		String flag = "search";
		// �÷���
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");

		Map<String, Object> map = new HashMap<String, Object>(); // collection
		map.put("column", column); // column : name or email or home
		map.put("keyvalue", keyvalue); // keyvalue

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// List<MemberDTO> list = memberdao.getMemberList(page);
		map.put("page", page);
		int count = lectDAO.getSearchCount(map);

		List<LectDTO> list = lectDAO.listLect(page);

		// count = page;
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;

		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("column", column);
		model.addAttribute("keyvalue", keyvalue);

		map.put("page", String.valueOf(page));

		list = lectDAO.searchLect(map);

		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "lecture.list";
	}

	@RequestMapping("/multidelete_lect.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("lect_id").split(",")) {
			deleteTarget.add(item);
		}
		//int deleteNum = lectDAO.multiDeleteLect(deleteTarget);
		mav.setViewName("redirect:list_lect.do");
		return mav;

	}
}
