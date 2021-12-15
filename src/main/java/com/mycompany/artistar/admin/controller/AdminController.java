package com.mycompany.artistar.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.admin.model.service.AdminService;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
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
	
	@RequestMapping(value = "artistInsertRequest", method=RequestMethod.GET)
	public ModelAndView artistInsert(ModelAndView mv) {
		String viewpage="";
		List<ArtistInsert> artistInsertAll = null;
		List<ArtistInsert> artistInsertNotYet = null;
		List<ArtistInsert> artistInsertOk = null;
		List<ArtistInsert> artistInsertNope = null;
		try {
			artistInsertAll = adminService.artistInsertAll();
			artistInsertNotYet = adminService.artistInsertNotYet();
			artistInsertOk = adminService.artistInsertOk();
			artistInsertNope = adminService.artistInsertNope();
			viewpage = "admin/adminArtistInsertRequest";
			mv.addObject("artistInsertAll", artistInsertAll);
			mv.addObject("artistInsertNotYet", artistInsertNotYet);
			mv.addObject("artistInsertOk", artistInsertOk);
			mv.addObject("artistInsertNope", artistInsertNope);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
