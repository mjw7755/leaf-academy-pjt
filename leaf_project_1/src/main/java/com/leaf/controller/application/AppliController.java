package com.leaf.controller.application;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.application.AppliDAO;
import com.leaf.model.application.AppliDTO;

@Controller
public class AppliController {

	@Resource
	private AppliDAO appliDAO;

	@RequestMapping("/list_appli.do")
	public String list(Model model) {
		List<AppliDTO> list = appliDAO.listAppli();
		model.addAttribute("list", list);
		
		return "application.list_appli";
	}

	@RequestMapping("/delete_appli.do")
	public ModelAndView delete(@RequestParam("appli_id") int appli_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		appliDAO.deleteAppli(appli_id);
		mav.setViewName("redirect:appli_list.do");
		return mav;
	}
	
/*	@RequestMapping("/write_appli.do")
	public String write*/
}
