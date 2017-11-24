package com.leaf.controller.tnotice;

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

import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.tnotice.TnoticeDAO;
import com.leaf.model.tnotice.TnoticeDTO;

@Controller
public class TnoticeController {

	@Resource
	private TnoticeDAO tnoticedao;
	@Resource
	private MemberDAO memberdao;

	@RequestMapping("/tnotice_list.do")
	public String list(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		String member_id = (String) request.getSession().getAttribute("sessionid");
		MemberDTO dto = memberdao.getMemberById(member_id);
		mav.addObject("dto", dto);
		if (dto.getMember_level() == 1) {
			String strPage = request.getParameter("page");
			String flag = "list";
			int page;
			if (strPage == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			List<TnoticeDTO> list = tnoticedao.getTnoticeList(page);
			int count = tnoticedao.getCount();
			int countPage = (int) Math.ceil((float) count / 5);
			int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
			model.addAttribute("count", count);
			model.addAttribute("countPage", countPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("list", list);
			model.addAttribute("flag", flag);
			int chk = 1;
			model.addAttribute("myclass", chk);
			return "ayrin.myclassST";
		} else {
			String strPage = request.getParameter("page");
			String flag = "list";
			int page;
			if (strPage == null) {
				page = 1;
			} else {
				page = Integer.parseInt(request.getParameter("page"));
			}
			List<TnoticeDTO> list = tnoticedao.getTnoticeList(page);
			int count = tnoticedao.getCount();
			int countPage = (int) Math.ceil((float) count / 5);
			int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
			model.addAttribute("count", count);
			model.addAttribute("countPage", countPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("list", list);
			model.addAttribute("flag", flag);
			int chk = 2;
			model.addAttribute("myclass", chk);
			return "ayrin.myclassTC";
		}
	}

	@RequestMapping("/tnotice_writeform.do")
	public String writeform(Model model) {
		int chk = 2;
		model.addAttribute("myclass", chk);
		return "ayrin.tnotice_writeform";
	}

	@RequestMapping("/tnotice_write.do")
	public ModelAndView write(TnoticeDTO dto, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		dto.setMember_id((String) request.getSession().getAttribute("sessionid"));
		tnoticedao.insertTnotice(dto);
		mav.setViewName("redirect:tnotice_list.do");
		int chk = 2;
		model.addAttribute("myclass", chk);
		return mav;
	}

	@RequestMapping("/tnotice_updateform.do")
	public ModelAndView updateform(Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int tnotice_id = Integer.parseInt(request.getParameter("tnotice_id"));
		TnoticeDTO dto = tnoticedao.getTnoticeById(tnotice_id);
		int chk = 2;
		model.addAttribute("myclass", chk);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.tnotice_updateform");
		return mav;
	}

	@RequestMapping("/tnotice_update.do")
	public ModelAndView update(TnoticeDTO dto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		int chk = 2;
		model.addAttribute("myclass", chk);
		tnoticedao.updateTnotice(dto);
		mav.setViewName("redirect:tnotice_list.do");
		return mav;
	}

	@RequestMapping("/tnotice_delete.do")
	public ModelAndView delete(TnoticeDTO dto, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		int chk = 2;
		model.addAttribute("myclass", chk);
		tnoticedao.deleteTnotice(dto);
		mav.setViewName("redirect:tnotice_list.do");
		return mav;
	}

	@RequestMapping("/tnotice_search.do")
	public String search(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String keyvalue = request.getParameter("keyvalue");
		String strPage = request.getParameter("page");
		String flag = "search";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyvalue", keyvalue);

		int page;
		if (strPage == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		map.put("page", page);
		int count = tnoticedao.search_getCount(map);

		List<TnoticeDTO> searchList = tnoticedao.searchTnotice(map);

		int countPage = (int) Math.ceil((float) count / 5);
		int startPage = (int) ((Math.ceil((float) page / 5) - 1) * 5) + 1;
		model.addAttribute("count", count);
		model.addAttribute("countPage", countPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("keyvalue", keyvalue);
		model.addAttribute("list", searchList);
		model.addAttribute("flag", flag);
		int chk = 2;
		model.addAttribute("myclass", chk);
		return "ayrin.tnotice_list";
	}

	@RequestMapping("/tnotice_detail.do")
	public ModelAndView detail(Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		int tnotice_id = Integer.parseInt(request.getParameter("tnotice_id"));
		TnoticeDTO dto = tnoticedao.getTnoticeById(tnotice_id);
		int chk = 2;
		model.addAttribute("myclass", chk);
		mav.addObject("dto", dto);
		mav.setViewName("ayrin.tnotice_detail");
		return mav;
	}
}
