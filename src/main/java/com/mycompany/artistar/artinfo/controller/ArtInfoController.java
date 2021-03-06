package com.mycompany.artistar.artinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.mycompany.artistar.alarm.model.service.AlarmService;
import com.mycompany.artistar.artinfo.model.service.ArtInfoService;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artinfo_insert.vo.ArtInfoInsert;
import com.mycompany.artistar.artinfo_update.vo.ArtInfoUpdate;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.member.model.vo.Member;


@Controller
public class ArtInfoController {
	@Autowired
	private ArtInfoService artInfoService;
	
	@Autowired
	private AlarmService alarmService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value="artinsert", method=RequestMethod.POST)
	public ModelAndView artInsert(ModelAndView mv
			, ArtInfoInsert artInfoInsert
			, @RequestParam("artistImg") MultipartFile report
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		try {
			String userId = m.getId();
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			int result = 	artInfoService.artInfoInsertRequest(artInfoInsert, report, userId);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistdetailArt?artistNum="+artInfoInsert.getArtist_num());
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????? ???????????????. ?????? ??????????????????.");
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		System.out.println("?????????????" + artinfoNum);
		String viewpage="";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		ArtInfo artInfo = null;
		List<ArtInfo> artInfoComment = null;
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
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
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		List<ArtInfo> artInfoComment = null;
		try {
			int artCommentResult = artInfoService.artComment(artComment, artinfoNum, userId);
			artInfoComment = artInfoService.getArtComment(artinfoNum);
			if(artCommentResult==1) {
				map.put("result", "success");
				map.put("artInfoComment", artInfoComment);
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
			, @RequestParam("replyToId") String replyToId
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		List<ArtInfo> artInfoComment = null;
		try {
			int artCoCommentResult = artInfoService.artCoComment(artComment, artCommentGroup, artinfoNum, userId, replyToId);
			artInfoComment = artInfoService.getArtComment(artinfoNum);
			if(artCoCommentResult==1) {
				map.put("result", "success");
				map.put("artInfoComment", artInfoComment);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="deleteComment.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteCommentAjax(
			@RequestParam("artCommentGroup") int artCommentGroup
			, @RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		List<ArtInfo> artInfoComment = null;
		try {
			int deleteCommentResult = artInfoService.deleteComment(artCommentGroup);
			artInfoComment = artInfoService.getArtComment(artinfoNum);
			if(deleteCommentResult>0) {
				map.put("result", "success");
				map.put("artInfoComment", artInfoComment);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="deleteCoComment.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteCoCommentAjax(
			@RequestParam("artCommentNum") int artCommentNum
			, @RequestParam("artinfoNum") int artinfoNum
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		List<ArtInfo> artInfoComment = null;
		try {
			int deleteCoCommentResult = artInfoService.deleteCoComment(artCommentNum);
			artInfoComment = artInfoService.getArtComment(artinfoNum);
			if(deleteCoCommentResult==1) {
				map.put("result", "success");
				map.put("artInfoComment", artInfoComment);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artUpdate", method=RequestMethod.GET)
	public ModelAndView artUpdate(ModelAndView mv
			, @RequestParam(value="artinfoNum") int artinfoNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			ArtInfo artInfoDetail = artInfoService.getArtInfoDetail(artinfoNum);
			viewpage = "artist/artUpdate";
			mv.addObject("artinfoNum", artinfoNum);
			mv.addObject("artInfoDetail", artInfoDetail);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artDelete", method=RequestMethod.GET)
	public ModelAndView artDelete(ModelAndView mv
			, @RequestParam(value="artinfoNum") int artinfoNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			ArtInfo artInfoDetail = artInfoService.getArtInfoDetail(artinfoNum);
			viewpage = "artist/artDelete";
			mv.addObject("artinfoNum", artinfoNum);
			mv.addObject("artInfoDetail", artInfoDetail);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artEditUpdate", method=RequestMethod.POST)
	public ModelAndView artEditUpdate(ModelAndView mv
			, ArtInfoUpdate artInfoUpdate
			, @RequestParam("artinfoImg") MultipartFile report
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		try {
			String userId = m.getId();
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			int result1 = 	artInfoService.artInfoUpdateRequest(artInfoUpdate, report, userId);
			if(result1>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistdetailArt?artistNum="+artInfoUpdate.getArtist_num());
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????? ???????????????. ?????? ??????????????????.");
				mv.addObject("result", 0);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artEditDelete", method=RequestMethod.POST)
	public ModelAndView artEditDelete(ModelAndView mv
			, @RequestParam(value="reason") String reason
			, @RequestParam(value="artinfo_num") int artinfoNum
			, @RequestParam(value="artistNum") int artistNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		try {
			String userId = m.getId();
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			int result = 	artInfoService.artInfoDeleteRequest(reason, userId, artinfoNum);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistdetailArt?artistNum="+artistNum);
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????? ???????????????. ?????? ??????????????????.");
				mv.addObject("result", 0);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
