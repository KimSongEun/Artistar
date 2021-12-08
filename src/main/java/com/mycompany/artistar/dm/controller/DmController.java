package com.mycompany.artistar.dm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DmController {
	@RequestMapping(value = "dm", method = RequestMethod.GET)
	public String DMForm(ModelAndView mv) {
		return "dm/dm";
	}
}
