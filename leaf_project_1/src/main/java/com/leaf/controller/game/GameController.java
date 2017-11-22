package com.leaf.controller.game;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
	
/*	@RequestMapping("/gamestart.do")
	public String five_in_a_row() {
		return "juju.xo";
	}*/
	

	@RequestMapping("/fir_index.do")
	public String index(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju.fir_index";
	}
	
	
	@RequestMapping("/button.do")
	public String button(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju/button";
	}
	@RequestMapping("/blank.do")
	public String blank(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju/blank";
	}
	@RequestMapping("/fiveinarow.do")
	public String fiveinarow(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju/five_in_a_row";
	}
	
	@RequestMapping("/xo.do")
	public String gameopen(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju/xo";
	}
	
	@RequestMapping("/taja.do")
	public String gameStart(HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setCharacterEncoding("utf-8");	
		return "juju.taja";
	}
}
