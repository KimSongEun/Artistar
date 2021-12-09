package com.mycompany.artistar.artinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artinfo.model.service.ArtInfoService;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;


@Controller
public class ArtInfoController {
	@Autowired
	private ArtInfoService artInfoService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value="artinsert", method=RequestMethod.POST)
	public ModelAndView artInsert(ModelAndView mv
			, ArtInfoInsert artInfoInsert
			, @RequestParam("artistImg") MultipartFile report
			) {
		String viewpage = "";
		try {
			String userId = "song"; //TODO : session 값 읽어오기!
			int result = 	artInfoService.artInfoInsertRequest(artInfoInsert, report, userId);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "요청 처리가 완료되었습니다. 검토 후 반영하도록 하겠습니다 :)");
				mv.addObject("loc", "artistdetail?artistNum="+artInfoInsert.getArtist_num());
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "정상 처리가 되지 않았습니다. 다시 시도해주세요.");
				mv.addObject("result", 0);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artContent", method=RequestMethod.GET)
	public ModelAndView artContent(
			@RequestParam("artinfoNum") int artinfoNum
			, ModelAndView mv
			) {
		System.out.println("들어왔어?" + artinfoNum);
		String viewpage="";
		String userId = "song"; //TODO : session 값 읽어오기!
		ArtInfo artInfo = null;
		try {
			artInfo = artInfoService.getArtInfoDetail(artinfoNum);
			mv.addObject("userId", userId);
			mv.addObject("artInfo", artInfo);
			viewpage = "artist/artdetailModal";
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}
		mv.setViewName(viewpage);
		return mv;
	}
	

	
}
