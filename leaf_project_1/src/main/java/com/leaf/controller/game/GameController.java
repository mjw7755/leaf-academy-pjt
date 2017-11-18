package com.leaf.controller.game;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
	@RequestMapping("/gamestart.do")
	public String five_in_a_row() {
		return "juju.xo";
	}
	@RequestMapping("/button.do")
	public String button() {
		return "juju.button";
	}
	@RequestMapping("/blank.do")
	public String blank() {
		return "juju.blank";
	}
	@RequestMapping("/fiveinarow.do")
	public String fiveinarow() {
		return "juju.five_in_a_row";
	}
	/*@RequestMapping("/gameStart.do")
	public String gameStart() {
		return "juju.xo";
	}*/
}
