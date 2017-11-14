package com.leaf.controller.game;

import org.springframework.web.bind.annotation.RequestMapping;

public class GameController {
	@RequestMapping("/five-ina-row.do")
	public String myclass() {
		return "juju.xo";
	}
}
