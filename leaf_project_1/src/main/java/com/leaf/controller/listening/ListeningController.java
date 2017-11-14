package com.leaf.controller.listening;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListeningController {

//	@Resource
//	private MemberDAO memberdao;

	@RequestMapping("/listening.do")
	public String myclass() {
		return "king.listening";
	}
	
}

