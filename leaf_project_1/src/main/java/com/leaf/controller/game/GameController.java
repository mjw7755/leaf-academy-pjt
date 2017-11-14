package com.leaf.controller.game;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GameController {
	@RequestMapping("/five_in_a_row.do")
	public String five_in_a_row() {
		return "five_in_a_row.xo";
	}
}
