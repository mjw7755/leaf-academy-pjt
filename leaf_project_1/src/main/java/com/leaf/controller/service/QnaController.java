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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.service.QnaDAO;
import com.leaf.model.service.QnaDTO;

@Controller
public class QnaController {

	@Resource
	private QnaDAO qnaDAO;

	@RequestMapping("/qna_list.do")
	public String list(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String flag = "list";
		String strPage = request.getParameter("page");
		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<QnaDTO> list = qnaDAO.qnaSelect(page);
		int count = qnaDAO.getCount();
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "qna.list";
	}

	@RequestMapping("/qna_writeform.do")
	public String writeForm(HttpServletRequest request) {
		return "qna.writeform";
	}

	@RequestMapping("/qna_write.do")
	public ModelAndView write(QnaDTO dto, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
		Date date = new Date();
		String qna_writedate = df.format(date);
		dto.setQna_writedate(qna_writedate);
		dto.setMember_id((String) request.getSession().getAttribute("sessionid"));
		int qna_id;
		qnaDAO.qnaInsert(dto);
		qna_id = dto.getQna_id();
		qnaDAO.insertQna_ref(qna_id);
		mav.setViewName("redirect:qna_list.do");
		return mav;
	}

	@RequestMapping("/qna_delete.do")
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int qna_id = new Integer(request.getParameter("qna_id"));
		qnaDAO.qnaDelete(qna_id);
		mav.addObject("message", qna_id + " 삭제");
		mav.setViewName("redirect:qna_list.do");
		return mav;
	}

	@RequestMapping("/qna_updateform.do")
	public ModelAndView updateForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int qna_id = new Integer(request.getParameter("qna_id"));
		QnaDTO dto = qnaDAO.qnaSelectId(qna_id);
		mav.addObject("dto", dto);
		mav.setViewName("qna.updateform");
		return mav;
	}

	@RequestMapping("/qna_detail.do")
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int qna_id = new Integer(request.getParameter("qna_id"));
		QnaDTO dto = qnaDAO.qnaSelectId(qna_id);
		mav.addObject("dto", dto);
		mav.setViewName("qna.detail");
		return mav;
	}

	@RequestMapping("/qna_update.do")
	public ModelAndView update(QnaDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();

		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
		Date date = new Date();
		String qna_modifydate = df.format(date);
		dto.setQna_modifydate(qna_modifydate);
		qnaDAO.qnaUpdate(dto);
		mav.setViewName("redirect:qna_list.do");
		return mav;
	}

	@RequestMapping("/qna_multidelete.do")
	public ModelAndView multidelete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<String> deleteTarget = new ArrayList<String>();
		for (String item : request.getParameter("qna_id").split(",")) {
			deleteTarget.add(item);
		}
		int deleteNum = qnaDAO.multiqnaDelete(deleteTarget);
		mav.setViewName("redirect:qna_list.do");
		return mav;
	}

	@RequestMapping("/qna_search.do")
	public String search(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String flag = "search";

		// 컬럼명
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
		map.put("page", page);
		int count = qnaDAO.getCount2(map);
		List<QnaDTO> list = qnaDAO.qnaSelect(page);

		// count = page;
		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;

		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("column", column);
		model.addAttribute("keyvalue", keyvalue);

		map.put("column", column); // column : name or email or home
		map.put("keyvalue", keyvalue); // keyvalue
		map.put("page", String.valueOf(page));

		list = qnaDAO.searchSelect(map);

		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		return "qna.list";
	}

	@RequestMapping("/reply.do")
	public String reply(Model model, HttpServletRequest request) {
		int qna_id = new Integer(request.getParameter("qna_id"));
		if (!model.containsAttribute("replyForm")) {
			model.addAttribute("replyForm", new QnaDTO());
		}
		QnaDTO dto = qnaDAO.qnaSelectId(qna_id);
		model.addAttribute("dto", dto);
		return "qna.reply";
	}

	@RequestMapping("/replyok.do")
	public ModelAndView replyok(@ModelAttribute("replyForm") QnaDTO dto, BindingResult result,
			HttpServletRequest request) {
		qnaDAO.replyBoardStep(dto);
		SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일 hh시mm분ss초");
		Date date = new Date();
		String qna_writedate = df.format(date);
		dto.setQna_writedate(qna_writedate);
		dto.setMember_id((String) request.getSession().getAttribute("sessionid"));
		qnaDAO.replyBoard(dto);
		return new ModelAndView("redirect:qna_list.do");
	}
}
