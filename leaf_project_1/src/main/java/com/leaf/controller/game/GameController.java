package com.leaf.controller.game;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
	@RequestMapping("/gamestart.do")
	public String five_in_a_row() {
		return "xo";
	}
	@RequestMapping("/button.do")
	public String button() {
		return "button";
	}
	@RequestMapping("/blank.do")
	public String blank() {
		return "blank";
	}
	@RequestMapping("/fiveinarow.do")
	public String fiveinarow() {
		return "fiveinarow";
	}
	/*@RequestMapping("/gameStart.do")
	public String gameStart() {
		return "juju.xo";
	}*/
}
