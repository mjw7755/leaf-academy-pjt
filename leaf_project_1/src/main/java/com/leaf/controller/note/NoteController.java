package com.leaf.controller.note;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.member.MemberDTO;
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
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		MemberDTO dto = noteDAO.selectMemberLevel(sessionid);
		int member_level = Integer.parseInt(dto.getMember_level());
		
		
		//학생이면 듣고있는 강의의 강사아이디와 강사 이름 가져오기
		if(member_level == 1) {
			List<MemberDTO> list = noteDAO.selectTeacher(sessionid);
			mav.addObject("list",list);
		}
		
		
		//강사면 하고있는 강의의 학생아이디와 학생 이름 가져오기
		if(member_level == 2) {
			List<MemberDTO> list = noteDAO.selectStudent(sessionid);
			mav.addObject("list", list);
		}
		
		
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
	
	@RequestMapping("noteDelete.do")
	public void noteDelete(@RequestParam(value="note_chk_values[]") List<String> note_chk_values, HttpServletResponse response) {
		System.out.println(note_chk_values);
		int result = noteDAO.noteDelete(note_chk_values);
		
		NoteDTO dto = noteDAO.noteDelChk();
		String n_send_del_yn = dto.getN_send_del_yn();
		String n_recv_del_yn = dto.getN_recv_del_yn();
		
		if(n_send_del_yn.equals("y") && n_recv_del_yn.equals("y")) {
			
			
		}
		
		StringBuffer sb = new StringBuffer("");
		
		sb.append(""+result);
		
		try {
			response.getWriter().write(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping("noteContent.do")
	public ModelAndView noteContentForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String n_id = request.getParameter("n_id");
		
		NoteDTO dto = noteDAO.noteContent(Integer.parseInt(n_id));
		noteDAO.noteOpenUpdate();
		
		mav.addObject("dto", dto);
		mav.setViewName("moon.noteContent");
		return mav;
	}
	
	@RequestMapping("noteSendContent.do")
	public ModelAndView noteSendContentForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String n_id = request.getParameter("n_id");
		
		NoteDTO dto = noteDAO.noteContent(Integer.parseInt(n_id));
		
		mav.addObject("dto", dto);
		mav.setViewName("moon.noteContent");
		return mav;
	}
	
	@RequestMapping("sendNoteList.do")
	public ModelAndView sendNoteList(HttpServletRequest request, @RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		String sessionid = (String) request.getSession().getAttribute("sessionid");
		Map<String,Object> sendNoteListMap = new HashMap<String,Object>();
		Map<String,Object> sendNoteData = new HashMap<String,Object>();
		
		int count = noteDAO.sendAllNoteCount(sessionid);
		
		BoardPager bp = new BoardPager(count, curPage);
		int start = bp.getPageBegin();
		int end = bp.getPageEnd();
		
		sendNoteListMap.put("start", start);
		sendNoteListMap.put("end", end);
		sendNoteListMap.put("sessionid", sessionid);
		
		
		List<NoteDTO> list = noteDAO.sendNoteList(sendNoteListMap);
		
		sendNoteData.put("count", count);
		sendNoteData.put("list", list);		
		sendNoteData.put("BoardPager", bp);
		
		mav.addObject("map", sendNoteData);
		mav.setViewName("moon.sendNoteList");
		return mav;
	}
	
	@RequestMapping("answerForm.do")
	public ModelAndView answerForm(NoteDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.getN_send_id());
		
		mav.addObject("dto", dto);
		mav.setViewName("moon.answerForm");
		return mav;
	}
}
