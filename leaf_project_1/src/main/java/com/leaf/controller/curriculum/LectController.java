package com.leaf.controller.curriculum;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	private LectDAO  lectDAO;
	
	@RequestMapping("/lect_list.do" )
	public String list(Model model, HttpServletRequest request) {

		 String strPage = request.getParameter("page");
	      int page;
	      if (strPage == null) {page = 1;} 
	      else {page = Integer.parseInt(request.getParameter("page"));}
		List<LectDTO> list = lectDAO.getLectList(page);

		int count = lectDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		
		return "lecture/list";    //   /WEB-INF/views/list.jsp
	}
	
	@RequestMapping("/writeform_lect.do")
	public String writeForm() {
		return "lecture/writeForm";    //   /WEB-INF/views/writeform.jsp
	}
	
	@RequestMapping(value = "/write_lect.do", method = RequestMethod.POST)
	public ModelAndView write(@ModelAttribute LectDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		System.out.println(dto.getLect_name());
		String lect_write_time= sdf_t.format(date);
		dto.setLect_write_time(lect_write_time);
		
		lectDAO.insertLect(dto);
		System.out.println(dto.getLect_name());
		mav.setViewName("redirect:lect_list.do");
		return mav;
	}
	
	@RequestMapping("/delete_lect.do")
	public ModelAndView delete(@RequestParam("lect_id") int lect_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		lectDAO.deleteLect(lect_id);
		mav.setViewName("redirect:lect_list.do");
		return mav;
	}
	
	@RequestMapping("/update_lect.do")
	public ModelAndView update(@ModelAttribute LectDTO dto) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf_t = new SimpleDateFormat("yy-MM-dd / kk:mm:ss");
		Date date = new Date();
		
		String lect_modify_time= sdf_t.format(date);
		dto.setLect_modify_time(lect_modify_time);
		
		lectDAO.updateLect(dto);
		mav.setViewName("redirect:lect_list.do");
		return mav;
	}
	@RequestMapping("/updateForm_lect.do")
	public ModelAndView updateForm(int lect_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		LectDTO dto = lectDAO.updateFormLect(lect_id);
		System.out.println(dto.getLect_name());
		mav.addObject("dto",dto);
		mav.setViewName("lecture/updateForm");
		return mav;
	}
	
	@RequestMapping("/search_lect.do")
	public ModelAndView search(Model model, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		
		String keyvalue= request.getParameter("keyvalue");
		
		Map<String, Object> map = new HashMap<String, Object>();
		String strPage = request.getParameter("page");
        System.out.println(strPage);
        int page;
        if (strPage == null) {page = 1;} 
        else {page = Integer.parseInt(request.getParameter("page"));}
        map.put("page", page);

		int count = lectDAO.getSearchCount(map);
		List<LectDTO> searchedList = lectDAO.getLectList(page);
		System.out.println(count);
		
		
		int countPage = (int) Math.ceil((float) count / 5);
        int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
        System.out.println(count);
        model.addAttribute("count", count);
        model.addAttribute("countPage", countPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("keyvalue", keyvalue);
		
		map.put("lect_id", "lect_id");
		map.put("lect_name", "lect_name");
		map.put("lect_person_num", "lect_person_num");
		map.put("lect_start_day", "lect_start_day");
		map.put("lect_end_day", "lect_end_day");
		map.put("keyvalue", keyvalue);
		map.put("page", String.valueOf(page));

		searchedList = lectDAO.searchLectList(map);
		System.out.println("Í≤??Éâ?êú Í≤∞Í≥º : " +searchedList.toString());


		
		mav.addObject("list", searchedList);
		mav.setViewName("lecture/list");
		
		return mav;
	}
	
	/*  @RequestMapping("/search_lect.do")
	   public String search(Model model, HttpServletRequest request) throws Exception {
	      String flag = "search";
	      ModelAndView mav = new ModelAndView();
	      
	      //Ïª¨ÎüºÎ™?
	         String column =request.getParameter("column");
	         String keyvalue = request.getParameter("keyvalue");
	         System.out.println(column + " / " + keyvalue);
	         
	         Map<String, Object> map = new HashMap<String, Object>(); //collection
	         map.put("column",column ); //column : name or email or home
	         map.put("keyvalue", keyvalue); //keyvalue 
	        
	         String strPage = request.getParameter("page");
	         System.out.println(strPage);
	         int page;
	         if (strPage == null) {page = 1;} 
	         else {page = Integer.parseInt(request.getParameter("page"));}
	         //List<MemberDTO> list = memberdao.getMemberList(page);
	         map.put("page", page);
	         int count = lectDAO.getSearchCount(map);
	                                                                                                                                                                                                                                                                                                    
	         List<LectDTO> list = lectDAO.getLectList(page);
	         
	         //count = page;
	         int countPage = (int) Math.ceil((float) count / 5);
	         int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
	         System.out.println(count);
	         model.addAttribute("count", count);
	         model.addAttribute("countPage", countPage);
	         model.addAttribute("startPage", startPage);
	         model.addAttribute("column", column);
	         model.addAttribute("keyvalue", keyvalue);
	         System.out.println();
	         //model.addAttribute("page", page);
	         //System.out.println("page:" + page);
	         
	         
	        // map.put("count", String.valueOf(count));
	         map.put("column",column ); //column : name or email or home
	         map.put("keyvalue", keyvalue); //keyvalue 
	         map.put("page", String.valueOf(page));
	         //map.put("countPage", String.valueOf(countPage));
	         //map.put("startPage", String.valueOf(startPage));
	      //System.out.println(countPage);
	      //System.out.println(startPage);
	      
	      list = lectDAO.searchLectList(map);
	      
	      
	      model.addAttribute("list", list);
	      model.addAttribute("flag",flag);
	      return "lecture/list";
	      
	      
	   }*/
	
	
	@RequestMapping("/multidelete_lect.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		List deleteTarget = new ArrayList();
		for(String item: request.getParameter("lect_id").split(",")) {
			deleteTarget.add(item);
		}
		int deleteNum = lectDAO.multiLectDelete(deleteTarget);
		mav.setViewName("redirect:lect_list.do");
		return mav;
		
	}
}






