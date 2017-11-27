package com.leaf.controller.application;

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
import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

@Controller
public class AppliController {

	@Resource
	private AppliDAO appliDAO;

	@RequestMapping("/listform_appli.do")
	public ModelAndView listform(Model model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String member_id = (String) request.getSession().getAttribute("sessionid");
		int lect_id = Integer.parseInt(request.getParameter("lect_id"));
		int curri_id = Integer.parseInt(request.getParameter("curri_id"));

		CurriDTO cdto = appliDAO.curri(curri_id);
		LectDTO ldto = appliDAO.lect(lect_id);
		MemberDTO mdto = appliDAO.member(member_id);
		CurriDTO teacherdto = appliDAO.teachercurri(curri_id);
		MemberDTO teachername = appliDAO.teachername(teacherdto.getMember_id());

		model.addAttribute("mdto", mdto);
		model.addAttribute("ldto", ldto);
		model.addAttribute("cdto", cdto);
		model.addAttribute("teacherdto", teacherdto);
		model.addAttribute("teachername", teachername);

		mav.setViewName("application.appli_list");
		return mav;
	}

	@RequestMapping("/write_appli.do")
	public ModelAndView insertAppli(@ModelAttribute AppliDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:list_curri.do");
		return mav;
	}

	@RequestMapping("/delete_appli.do")
	public ModelAndView delete(@RequestParam("appli_id") int appli_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		appliDAO.deleteAppli(appli_id);
		mav.setViewName("redirect:appli_list.do");
		return mav;
	}
}
