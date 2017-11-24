package com.leaf.controller.curriculum;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

import com.leaf.model.curriculum.CurriDAO;
import com.leaf.model.curriculum.CurriDTO;

@Controller
public class CurriController {

	@Autowired
	private CurriDAO curriDAO;

	@RequestMapping("/list_curri.do")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flag = "list";

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// List<MemberDTO> list = memberdao.getMemberList(page);
		List<CurriDTO> list = curriDAO.listCurri(page);
		int count = curriDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);

		return "curriculum.list";
	}

	@RequestMapping("/writeform_curri.do")
	public String writeForm() {
		return "curriculum.writeForm";
	}

	@RequestMapping(value = "/write_curri.do", method = RequestMethod.POST)
	public ModelAndView write(CurriDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		String curri_write_time = sdf_t.format(date);
		dto.setCurri_write_time(curri_write_time);

		curriDAO.insertCurri(dto);
		mav.setViewName("redirect:list_curri.do");

		return mav;
	}

	@RequestMapping("/delete_curri.do")
	public ModelAndView delete(@RequestParam("curri_id") int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		curriDAO.deleteCurri(curri_id);
		mav.setViewName("redirect:list_curri.do");
		return mav;
	}

	@RequestMapping("/update_curri.do")
	public ModelAndView update(@ModelAttribute CurriDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		String curri_modify_time = sdf_t.format(date);
		dto.setCurri_modify_time(curri_modify_time);
		curriDAO.updateCurri(dto);
		mav.setViewName("redirect:list_curri.do");
		return mav;
	}

	@RequestMapping("/updateForm_curri.do")
	public ModelAndView updateForm(int curri_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		CurriDTO dto = curriDAO.updateFormCurri(curri_id);
		mav.addObject("dto", dto);
		mav.setViewName("curriculum.updateForm");
		return mav;
	}

	/*
	 * @RequestMapping("/detail_curri.do")
	 * 
	 * public String detailCurri(Model model,@RequestParam int curri_id) throws
	 * Exception { CurriDAO curriDAO = sqlSession.getMapper(CurriDAO.class);
	 * 
	 * curri_id = curriDAO.detailCurri(curri_id); model.addAttribute("curri_id",
	 * curri_id); return "curriculum/detail";
	 * 
	 * }
	 */

	@RequestMapping("/detail_curri.do")
	
	public ModelAndView detailCurri(@RequestParam(value="lect_id", required=false)int lect_id) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("curriculum.detail");
		mav.addObject("dto", curriDAO.detailCurri(lect_id));
		return mav;

	}

	@RequestMapping("/search_curri.do")
	public String search(Model model, HttpServletRequest request) throws Exception {

		String flag = "search";
		// �뜝�떆琉꾩삕�뜝�룞�삕
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("keyvalue", keyvalue);

		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		map.put("page", page);
		int count = curriDAO.getSearchCount(map);
		// count = page;
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("column", column);
		model.addAttribute("keyvalue", keyvalue);

		map.put("page", String.valueOf(page));

		List<CurriDTO> list = curriDAO.searchCurri(map);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		model.addAttribute("map", map);
		return "curriculum.list";
	}

	@RequestMapping("/monthlist_curri.do")
	public void monthlist(Model model, HttpServletResponse response, HttpServletRequest request, CurriDTO dto)
			throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String monthvalue = request.getParameter("monthvalue");
		String yearvalue = request.getParameter("yearvalue");
		String start_day = "", end_day = "";
		int y = Integer.parseInt(yearvalue), m = Integer.parseInt(monthvalue), lastday;

		if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12)
			lastday = 31;
		else if (m == 2) {
			if ((y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0)))
				lastday = 29;
			else
				lastday = 28;
		} else {
			lastday = 30;
		}

		Map<String, String> map = new HashMap<String, String>();

		start_day = yearvalue + "-" + monthvalue + "-01";
		end_day = yearvalue + "-" + monthvalue + "-" + lastday;
		map.put("start_day", start_day);
		map.put("end_day", end_day);

		List<CurriDTO> list = curriDAO.monthlistCurri(map);

		StringBuffer sb = new StringBuffer("");
		sb.append("{ \"result\" : [");
		for (int i = 0; i < list.size(); i++) {
			sb.append("[{\"value\" : \"" + list.get(i).getCurri_id() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getLect_start_day() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getCurri_subject() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getMember_id() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getCurri_level() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getLect_name() + "\"},");
			sb.append("{\"value\" : \"" + list.get(i).getLect_person_num() + "\"}],");
		}
		sb.append("]}");
		response.getWriter().write(sb.toString());
		model.addAttribute("monthvalue", monthvalue);
	}

}
