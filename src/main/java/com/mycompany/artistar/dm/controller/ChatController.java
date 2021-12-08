package com.mycompany.artistar.dm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping(value = "chat", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		
		String userid = "test";
		System.out.println(userid+" 모르겠다 이제");
		mv.addObject("userid", userid);
		String viewpage = "dm/chat";
		mv.setViewName(viewpage);
		return mv;
	}
	
	
}
