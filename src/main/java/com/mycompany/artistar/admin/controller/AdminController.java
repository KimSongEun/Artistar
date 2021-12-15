package com.mycompany.artistar.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@RequestMapping(value = "adminmain", method=RequestMethod.GET)
	public ModelAndView adminmain(ModelAndView mv) {
		String viewpage="";
		try {
			viewpage = "admin/adminmain";
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistInsert", method=RequestMethod.GET)
	public ModelAndView artistInsert(ModelAndView mv) {
		String viewpage="";
		try {
			viewpage = "admin/adminArtistInsertRequest";
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
