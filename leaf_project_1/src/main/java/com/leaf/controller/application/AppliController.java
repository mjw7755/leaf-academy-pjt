package com.leaf.controller.application;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

	@RequestMapping("/appli_list.do")
	public String list(Model model) {
		List<AppliDTO> list = appliDAO.listAppli();
		model.addAttribute("list", list);
		
		return "application.appli_list";
	}

	@RequestMapping("/delete_appli.do")
	public ModelAndView delete(@RequestParam("appli_id") int appli_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		appliDAO.deleteAppli(appli_id);
		mav.setViewName("redirect:appli_list.do");
		return mav;
	}

}
