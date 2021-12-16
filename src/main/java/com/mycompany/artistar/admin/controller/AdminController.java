package com.mycompany.artistar.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView artistInsertRequest(ModelAndView mv) {
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
	
	@RequestMapping(value = "artistInsert", method=RequestMethod.POST)
	public ModelAndView artistInsert(ModelAndView mv
			, @RequestParam("insert_num") int insertNum
			, @RequestParam("result") int result
			) {
		String viewpage="";
		try {
			ArtistInsert artistInsertInfoDetail = adminService.artistInsertInfoDetail(insertNum);
			mv.addObject("result", result);
			mv.addObject("artistInsertInfoDetail", artistInsertInfoDetail);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value = "artistInsertDo", method=RequestMethod.POST)
	public ModelAndView artistInsertDo(ModelAndView mv
			, @RequestParam("insert_num") int insertNum
			, @RequestParam("result") int result
			) {
		String viewpage="";
		try {
			int resultStatusOkResult = adminService.resultStatusOk(insertNum);
			if(resultStatusOkResult > 0) {
				viewpage = "common/confirm";
				mv.addObject("msg", "등록 처리를 완료하시겠습니까?");
				mv.addObject("alert", "등록 처리가 완료되었습니다!");
				mv.addObject("loc", "admin/artistInsertRequest");
				mv.addObject("result", 1);
			} else {
				viewpage = "common/confirm";
				mv.addObject("msg", "정상 등록이 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
