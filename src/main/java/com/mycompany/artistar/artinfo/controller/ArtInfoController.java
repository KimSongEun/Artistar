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
		List<ArtInfo> artInfoComment = null;
		try {
			artInfo = artInfoService.getArtInfoDetail(artinfoNum);
			int likeCheck = artInfoService.likeCheck(artinfoNum, userId);
			int likeCount = artInfoService.likeCount(artinfoNum);
			int scrapCheck = artInfoService.scrapCheck(artinfoNum, userId);
			artInfoComment = artInfoService.getArtComment(artinfoNum);
			mv.addObject("userId", userId);
			mv.addObject("artInfo", artInfo);
			mv.addObject("likeCheck", likeCheck);
			mv.addObject("likeCount", likeCount);
			mv.addObject("scrapCheck", scrapCheck);
			mv.addObject("artInfoComment", artInfoComment);
			
			viewpage = "artist/artdetailModal";
			System.out.println("likeCheck : " + likeCheck);
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artHeart.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artHeartAjax(
			@RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int heartResult = artInfoService.artHeart(artinfoNum, userId);
			int likeCheck = artInfoService.likeCheck(artinfoNum, userId);
			int likeCount = artInfoService.likeCount(artinfoNum);
			if(heartResult==1) {
				map.put("result", "success");
				map.put("likeCheck", likeCheck);
				map.put("likeCount", likeCount);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artHeartCancel.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artHeartCancelAjax(
			@RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int heartCancelResult = artInfoService.artHeartCancel(artinfoNum, userId);
			int likeCheck = artInfoService.likeCheck(artinfoNum, userId);
			int likeCount = artInfoService.likeCount(artinfoNum);
			if(heartCancelResult==1) {
				map.put("result", "success");
				map.put("likeCheck", likeCheck);
				map.put("likeCount", likeCount);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artScrap.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artScrapAjax(
			@RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int scrapResult = artInfoService.artScrap(artinfoNum, userId);
			int scrapCheck = artInfoService.scrapCheck(artinfoNum, userId);
			if(scrapResult==1) {
				map.put("result", "success");
				map.put("scrapCheck", scrapCheck);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artScrapCancel.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artScrapCancelAjax(
			@RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int scrapCancelResult = artInfoService.artScrapCancel(artinfoNum, userId);
			int scrapCheck = artInfoService.scrapCheck(artinfoNum, userId);
			if(scrapCancelResult==1) {
				map.put("result", "success");
				map.put("scrapCheck", scrapCheck);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artComment.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artCommentAjax(
			@RequestParam("artComment") String artComment
			, @RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int artCommentResult = artInfoService.artComment(artComment, artinfoNum, userId);
			if(artCommentResult==1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artCoComment.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artCoCommentAjax(
			@RequestParam("artComment") String artComment
			, @RequestParam("artCommentGroup") int artCommentGroup
			, @RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		String userId = "song"; //TODO : session 값 읽어오기!
		try {
			int artCoCommentResult = artInfoService.artCoComment(artComment, artCommentGroup, artinfoNum, userId);
			if(artCoCommentResult==1) {
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
