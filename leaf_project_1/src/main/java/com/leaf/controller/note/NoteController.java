package com.leaf.controller.note;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.note.NoteDAO;
import com.leaf.model.note.NoteDTO;
import com.leaf.service.BoardPager;

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
	
	
	@RequestMapping("noteSendForm.do")
	public ModelAndView noteSendForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String[] chkValues = request.getParameterValues("studentChk");
		
		
		mav.addObject("chkValues", chkValues);
		mav.setViewName("moon.noteWriteForm");
		
		return mav;
	}
	
	@RequestMapping("noteList.do")
	public ModelAndView noteList(HttpServletRequest request, @RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> noteListMap = new HashMap<String,Object>();
		Map<String, Object> noteData = new HashMap<String, Object>();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		int count = noteDAO.allNoteCount(sessionid);
		BoardPager bp = new BoardPager(count, curPage);
		int start = bp.getPageBegin();
		int end = bp.getPageEnd();
		
		noteListMap.put("sessionid", sessionid);
		noteListMap.put("start", start);
		noteListMap.put("end", end);
		
		List<NoteDTO> list = noteDAO.getNoteList(noteListMap);
		
		noteData.put("count", count);
		noteData.put("list", list);
		noteData.put("BoardPager", bp);
	
		mav.addObject("map", noteData);
		mav.setViewName("moon.noteList");
		return mav;
	}
	
}
