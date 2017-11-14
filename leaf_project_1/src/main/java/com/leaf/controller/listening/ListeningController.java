package com.leaf.controller.listening;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leaf.model.member.MemberDTO;

@Controller
public class ListeningController {

//	@Resource
//	private MemberDAO memberdao;

	@RequestMapping("/listening.do")
	public String myclass(MemberDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("sessionid");
		return "king.lintening";
	}
	
}

