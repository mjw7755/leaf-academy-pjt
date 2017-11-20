package com.leaf.controller.backend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.application.AppliDAO;
import com.leaf.model.application.AppliDTO;
import com.leaf.model.backend.BackEndDAO;
import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

@Controller
public class BackEndController {

	@Resource
	private BackEndDAO backendDAO;
	
	@RequestMapping("/list_backend_curri.do")
	public ModelAndView backend_curri(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String member_id=(String) request.getSession().getAttribute("sessionid");
		int lect_id = Integer.parseInt(request.getParameter("lect_id"));
		int curri_id =Integer.parseInt(request.getParameter("curri_id"));
		
		
		List<CurriDTO> clist=backendDAO.curri(curri_id);
		List<LectDTO> llist=backendDAO.lect(lect_id);
		List<MemberDTO> mlist=backendDAO.member(member_id);

		model.addAttribute("clist", clist);
		model.addAttribute("llist", llist);
		model.addAttribute("mlist", mlist);
		mav.setViewName("backend.list_backend_curri");
		return mav;
	
	}
	
	@RequestMapping("/list_backend_lect.do")
	public ModelAndView backend_lect(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		int lect_id = Integer.parseInt(request.getParameter("lect_id"));
		
		List<LectDTO> llist=backendDAO.lect(lect_id);

		model.addAttribute("llist", llist);
		mav.setViewName("backend.list_backend_lect");
		return mav;
	
	}
	
	@RequestMapping("/list_backend_member.do")
	public ModelAndView backend_member(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String member_id=(String) request.getSession().getAttribute("sessionid");
		
		List<MemberDTO> mlist=backendDAO.member(member_id);

		model.addAttribute("mlist", mlist);
		mav.setViewName("backend.list_backend_member");
		return mav;
	
	}

	@RequestMapping("/delete_backend.do")
	public ModelAndView deletebackend(@RequestParam("appli_id") int appli_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		backendDAO.deleteBackEnd();
		mav.setViewName("redirect:backend_list.do");
		return mav;
	}
	
	@RequestMapping("/search_backend_lect.do")
	public String search(Model model, HttpServletRequest request) throws Exception{

		   String flag = "search";
		         String column =request.getParameter("column");
		         String keyvalue = request.getParameter("keyvalue");
		         System.out.println(column + " / " + keyvalue);
		         
		         Map<String, Object> map = new HashMap<String, Object>(); 
		         map.put("column",column ); 
		         map.put("keyvalue", keyvalue);
		        
		         model.addAttribute("column", column);
		         model.addAttribute("keyvalue", keyvalue);

		         map.put("column",column );
		         map.put("keyvalue", keyvalue);
		      
		      List<LectDTO> list = backendDAO.searchlect(map);
		      
		      
		      model.addAttribute("list", list);
		      model.addAttribute("flag",flag);
		      return "backend.list_backend_lect";
		   }
	
}
