package com.leaf.controller.jageok;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.jageok.JageokDAO;
import com.leaf.model.jageok.JageokDTO;

@Controller
public class JageokController {

	@Resource
	private JageokDAO jageokdao;
	
	@RequestMapping("/jageok_list.do")
	public String List(Model model, HttpServletRequest request) {
		String strPage = request.getParameter("page");
		String flag = "list";
		int page;
		if (strPage == null) { page =1; }
		else { page = Integer.parseInt(strPage); }
		List<JageokDTO> list = jageokdao.getJageokList(page);
		int count = jageokdao.getCount();
		int countPage = (int) Math.ceil ((float) count / 5);
		int startPage = (int) ((Math.ceil ((float) page / 5) - 1) * 5) +1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "ayrin.jageok_list";		
	}
	
	@RequestMapping("/jageok_writeform.do")
	public String writeform() {
		return "ayrin.jageok_writeform";
	}
	
	@RequestMapping("/jageok_write.do")
	public ModelAndView write(JageokDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		jageokdao.insertJageok(dto);
		mav.setViewName("redirect:jageok_list.do");
		return mav;
	}
	
	@RequestMapping("/jageok_updateform.do")
	public ModelAndView updateform(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int jageok_id = Integer.parseInt(request.getParameter("jageok_id"));
		JageokDTO dto = jageokdao.getJageokById(jageok_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.jageok_updateform");
		return mav;
	}
	
	@RequestMapping("/jageok_update.do")
	public ModelAndView update(JageokDTO dto) {
		ModelAndView mav = new ModelAndView();
		jageokdao.updateJageok(dto);
		mav.setViewName("redirect:jageok_list.do");
		return mav;
	}
	
	@RequestMapping("/jageok_delete.do")
	public ModelAndView delete(JageokDTO dto) {
		ModelAndView mav = new ModelAndView();
		jageokdao.deleteJageok(dto);
		mav.setViewName("redirect:jageok_list.do");		
		return mav;
	}
	
	@RequestMapping("/jageok_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("jageok_id").split(",")) {
			deleteTarget.add(item);
		}
		jageokdao.multideleteJageok(deleteTarget);
		mav.setViewName("redirect:jageok_list.do");
		return mav;		
	}
	
	@RequestMapping("/jageok_deletecancle.do")
	public ModelAndView deletecancle(JageokDTO dto) {
		ModelAndView mav = new ModelAndView();
		jageokdao.deletecancle(dto);
		mav.setViewName("redirect:jageok_list.do");		
		return mav;
	}
	
	@RequestMapping("/jageok_search.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keyvalue = request.getParameter("keyvalue");
		String strPage = request.getParameter("page");
		String flag = "search";
		
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("keyvalue", keyvalue); //keyvalue
        
		int page;
        if (strPage == null) {page = 1;} 
        else {page = Integer.parseInt(request.getParameter("page"));}
        map.put("page", page);
        int count = jageokdao.search_getCount(map);
		
		List<JageokDTO> searchList = jageokdao.Jageoksearch(map);
		
		int countPage = (int) Math.ceil((float) count / 5);
        int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        model.addAttribute("count", count);
        model.addAttribute("countPage", countPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("keyvalue", keyvalue);
        
        model.addAttribute("list", searchList);
		model.addAttribute("flag",flag);
		return "ayrin.jageok_list";
	}
	
	@RequestMapping("/jageok_detail.do")
	public ModelAndView detail(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int jageok_id = Integer.parseInt(request.getParameter("jageok_id"));
		JageokDTO dto = jageokdao.getJageokById(jageok_id);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.jageok_detail");
		return mav;		
	}
}
