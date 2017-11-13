package com.leaf.controller.note;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.note.NoteDAO;
import com.leaf.model.note.NoteDTO;

@Controller
public class NoteController {
	
	@Resource
	NoteDAO noteDAO;
	
	@RequestMapping("noteWriteForm.do")
	public ModelAndView noteWriteForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		
		String teacherid = noteDAO.getTeacherId(sessionid);
		
		mav.setViewName("moon.noteWriteForm");
		mav.addObject("teacherid", teacherid);
		
		return mav;
	}
	
	@RequestMapping("noteWrite.do")
	public ModelAndView writeNote(NoteDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		int result = noteDAO.writeNote(dto);
		
		if(result == 1) {
			mav.addObject("noteResult","success");
		}else {
			mav.addObject("noteResult","failed");
		}
		
		mav.setViewName("moon.myPage");
		
		return mav;
	}
	
	@RequestMapping("myPage.do")
	public String mypageForm() {
		return "moon.myPage";
	}
	
}
