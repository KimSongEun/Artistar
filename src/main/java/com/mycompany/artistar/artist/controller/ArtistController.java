package com.mycompany.artistar.artist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.alarm.model.service.AlarmService;
import com.mycompany.artistar.alarm.model.vo.Alarm;
import com.mycompany.artistar.artinfo.model.service.ArtInfoService;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;
import com.mycompany.artistar.artist_contributor.vo.ArtistContributor;
import com.mycompany.artistar.artist_delete.vo.ArtistDelete;
import com.mycompany.artistar.artist_follower.vo.ArtistFollower;
import com.mycompany.artistar.artist_insert.vo.ArtistInsert;
import com.mycompany.artistar.artist_update.vo.ArtistUpdate;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@Autowired
	private ArtInfoService artInfoService;
	
	@Autowired
	private AlarmService alarmService;
	
	//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value = "artistmain", method=RequestMethod.GET)
	public ModelAndView artistMain(ModelAndView mv
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		List<Artist> artistvolist = null;
		try {
		int alarmCount = alarmService.alarmCount(userId);
		mv.addObject("alarmCount", alarmCount);
		artistvolist = artistService.getArtistList(1, 3);
		int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
		int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
		viewpage = "artist/artistmain";
		mv.addObject("artistvolist", artistvolist);
		mv.addObject("myArtGalleryArtistCount", myArtGalleryArtistCount);
		mv.addObject("myArtGalleryArtCount", myArtGalleryArtCount);
		mv.addObject("userId", userId);
		
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	public static final int LIMIT = 3;
	
	@RequestMapping(value = "artistmain.ajax", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String,Object> artistMain(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			) {
		System.out.println("currentPage??? ?????? : " + currentPage);
		System.out.println("offset??? ?????? : " + offset);
		List<Artist> artistvolist = null;
		Map<String, Object> map = new HashMap<String,Object>();
		int listCount=artistService.artistListCount();
		int maxPage=(int)((double)listCount/LIMIT + 0.9);
		try {
			artistvolist = artistService.getArtistList(currentPage, LIMIT);
			map.put("artistvolist", artistvolist);
			map.put("maxPage", maxPage);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("ajax??? ??? ??? " + artistvolist);
		return map;
	};
	
	@RequestMapping(value="myartgallery", method=RequestMethod.GET)
	public ModelAndView myArtGallery(ModelAndView mv
			, @RequestParam(value="userId") String userId
			) {
		String viewpage = "";
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			List<Artist> myGalleryArtistList = artistService.getMyGalleryArtistList(1, 2,userId);
			List<ArtInfo> myGalleryArtList = artInfoService.getMyGalleryArtList(1, 6, userId);
			viewpage = "artist/myartgallery";
			mv.addObject("userId", userId);
			mv.addObject("myArtGalleryArtistCount", myArtGalleryArtistCount);
			mv.addObject("myArtGalleryArtCount", myArtGalleryArtCount);
			mv.addObject("myArtGalleryProfileImg", myArtGalleryProfileImg);
			mv.addObject("myGalleryArtistList", myGalleryArtistList);
			mv.addObject("myGalleryArtList", myGalleryArtList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		System.out.println("userId : " + userId);
		return mv;
	}
	
	@RequestMapping(value="myartgalleryartist.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> myArtGalleryArtist(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			//, @RequestParam(value="userId") String userId
	        , HttpSession session
	        , HttpServletRequest request
			) {
		System.out.println("?????????????");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			session = request.getSession();
		    Member m = (Member)session.getAttribute("member");
			String userId = m.getId();
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			int maxPageArtist=(int)((double)myArtGalleryArtistCount + 0.9);
			int maxPageArt=(int)((double)myArtGalleryArtCount + 0.9);
		try {
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			myGalleryArtistList = artistService.getMyGalleryArtistList(currentPage, 1, userId);
			myGalleryArtList = artInfoService.getMyGalleryArtList(currentPage, 3, userId);
			map.put("userId", userId);
			map.put("myArtGalleryArtistCount", myArtGalleryArtistCount);
			map.put("myArtGalleryArtCount", myArtGalleryArtCount);
			map.put("myArtGalleryProfileImg", myArtGalleryProfileImg);
			map.put("myGalleryArtistList", myGalleryArtistList);
			map.put("myGalleryArtList", myGalleryArtList);
			map.put("maxPageArtist", maxPageArtist);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("offset : " + offset);
		System.out.println("maxPageArtist : " + maxPageArtist);
		return map;
	}
	
	@RequestMapping(value="myartgalleryart.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> myArtGalleryArt(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset
			//, @RequestParam(value="userId") String userId
	        , HttpSession session
	        , HttpServletRequest request
			) {
		System.out.println("?????????????");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			session = request.getSession();
		    Member m = (Member)session.getAttribute("member");
			String userId = m.getId();
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			int maxPageArtist=(int)((double)myArtGalleryArtistCount/LIMIT + 0.9);
			int maxPageArt=(int)((double)myArtGalleryArtCount/LIMIT + 0.9);
		try {
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			myGalleryArtistList = artistService.getMyGalleryArtistList(currentPage, 1, userId);
			myGalleryArtList = artInfoService.getMyGalleryArtList(currentPage, 3, userId);
			map.put("userId", userId);
			map.put("myArtGalleryArtistCount", myArtGalleryArtistCount);
			map.put("myArtGalleryArtCount", myArtGalleryArtCount);
			map.put("myArtGalleryProfileImg", myArtGalleryProfileImg);
			map.put("myGalleryArtistList", myGalleryArtistList);
			map.put("myGalleryArtList", myGalleryArtList);
			map.put("maxPageArtist", maxPageArtist);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("offset : " + offset);
		System.out.println("maxPageArtist : " + maxPageArtist);
		return map;
	}
	
	@RequestMapping("artistdetailArtist")
	public ModelAndView artistDetailArtist(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
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
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			int artistProfileContributorCount = artistService.artistProfileContributorCount(artistNum);
			List<ArtInfo> artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(1, 3, artistNum);
			List<ArtistFollower> artistFollowerList = artistService.artistFollowerList(artistNum);
			List<ArtistContributor> artistContributorList = artistService.artistContributorList(artistNum);
//			
			viewpage = "artist/artistdetailArtist";
			mv.addObject("artistNum", artistNum);
			mv.addObject("artistProfileArtist", artistProfileArtist);
			mv.addObject("artistProfileArtCount", artistProfileArtCount);
			mv.addObject("artistProfileFollowerCount", artistProfileFollowerCount);
			mv.addObject("artistProfileContributorCount", artistProfileContributorCount);
			mv.addObject("artistProfileArtInfoList", artistProfileArtInfoList);
			mv.addObject("artistFollowerList", artistFollowerList);
			mv.addObject("artistContributorList", artistContributorList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping("artistdetailArt")
	public ModelAndView artistDetailArt(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
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
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			int artistProfileContributorCount = artistService.artistProfileContributorCount(artistNum);
			List<ArtInfo> artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(1, 6, artistNum);
			List<ArtistFollower> artistFollowerList = artistService.artistFollowerList(artistNum);
			List<ArtistContributor> artistContributorList = artistService.artistContributorList(artistNum);
//			
			viewpage = "artist/artistdetailArt";
			mv.addObject("artistNum", artistNum);
			mv.addObject("artistProfileArtist", artistProfileArtist);
			mv.addObject("artistProfileArtCount", artistProfileArtCount);
			mv.addObject("artistProfileFollowerCount", artistProfileFollowerCount);
			mv.addObject("artistProfileContributorCount", artistProfileContributorCount);
			mv.addObject("artistProfileArtInfoList", artistProfileArtInfoList);
			mv.addObject("artistFollowerList", artistFollowerList);
			mv.addObject("artistContributorList", artistContributorList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artistdetail.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistDetail(
			@RequestParam(name="currentPage") int currentPage,
			@RequestParam(name="offset") int offset,
			@RequestParam(value="artistNum") int artistNum
			) {
		System.out.println("?????????????");
			List<ArtInfo> artistProfileArtInfoList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int maxPageArt=(int)((double)artistProfileArtCount/LIMIT + 0.9);
		try {
			artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(currentPage, 3, artistNum);
			map.put("artistNum", artistNum);
			map.put("artistProfileArtCount", artistProfileArtCount);
			map.put("artistProfileArtInfoList", artistProfileArtInfoList);
			map.put("maxPageArt", maxPageArt);
			map.put("offset", offset);
			map.put("currentPage", currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artistedit", method=RequestMethod.POST)
	public ModelAndView artistEdit(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
			, @RequestParam(value="type") String type
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
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			viewpage = "artist/artistedit";
			mv.addObject("artistNum", artistNum);
			mv.addObject("type", type);
			mv.addObject("artistProfileArtist", artistProfileArtist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}	
	
	@RequestMapping(value="artisteditupdate", method=RequestMethod.POST)
	public ModelAndView artistEditUpdate(ModelAndView mv
			, ArtistUpdate artistUpdate
			, @RequestParam(value="artist_num") int artistNum
			, @RequestParam("artistImg") MultipartFile report
//			,HttpServletRequest request
//			,HttpServletResponse response
	        , HttpSession session
	        , HttpServletRequest request
			) {
		System.out.println("artist_num : ????" + artistNum);
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		try {
			String userId = m.getId();
			int result = artistService.artistUpdateRequest(artistUpdate, report, userId);
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ???????????? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistdetailArtist?artistNum="+artistNum);
				mv.addObject("result", 1);
			} else {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????? ???????????????. ?????? ??????????????????.");
				mv.addObject("result", 0);
			}
//			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			
//			mv.addObject("artistNum", artistNum);
//			mv.addObject("artistProfileArtist", artistProfileArtist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="artisteditdelete", method=RequestMethod.POST)
	public ModelAndView artistEditDelete(ModelAndView mv
			, @RequestParam(value="reason") String reason
			, @RequestParam(value="artist_num") int artistNum
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
			int result = artistService.artistDeleteRequest(reason, userId, artistNum);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistdetailArtist?artistNum="+artistNum);
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
	
	@RequestMapping(value="artistinsert", method=RequestMethod.POST)
	public ModelAndView artistInsert(ModelAndView mv
			, ArtistInsert artistInsert
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
			int result = artistService.artistInsertRequest(artistInsert, report, userId);
			if(result>0) {
				viewpage = "common/alert";
				mv.addObject("msg", "?????? ????????? ?????????????????????. ?????? ??? ??????????????? ??????????????? :)");
				mv.addObject("loc", "artistmain");
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
	
	@RequestMapping(value="artContent.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artContentAjax(
			@RequestParam("artistNum") int artistNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			int followCheck = artistService.followCheck(artistNum, userId);
			map.put("followCheck", followCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}	
	
	@RequestMapping(value="artistFollow.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistFollowAjax(
			@RequestParam("artistNum") int artistNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			int followResult = artistService.artistFollow(artistNum, userId);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			if(followResult==1) {
				map.put("result", "success");
				map.put("artistProfileFollowerCount", artistProfileFollowerCount);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping(value="artistUnfollow.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> artistUnfollowAjax(
			@RequestParam("artistNum") int artistNum
	        , HttpSession session
	        , HttpServletRequest request
			) {
		Map<String, Object> map = new HashMap<String,Object>();
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			int followResult = artistService.artistUnfollow(artistNum, userId);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			if(followResult==1) {
				map.put("result", "success");
				map.put("artistProfileFollowerCount", artistProfileFollowerCount);
			} else {
				map.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@RequestMapping("artistSearch")
	public ModelAndView artistSearch(ModelAndView mv
			, @RequestParam("selectOption") String selectOption
			, @RequestParam("keyword") String keyword
	        , HttpSession session
	        , HttpServletRequest request
			) {
		System.out.println("selectOption????????" + selectOption);
		String viewpage = "";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		List<Artist> searchArtist = null;
		int searchArtCount = 0;
		List<ArtInfo> searchArt = null;
		int searchTagCount = 0;
		List<ArtInfo> searchTags = null;
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			searchArtist = artistService.getSearchArtist(keyword);
			searchArtCount = artistService.searchArtCount(keyword);
			searchArt = artistService.getSearchArt(keyword);
			searchTagCount = artistService.searchTagCount(keyword);
			searchTags = artistService.getSearchTags(keyword);
			mv.addObject("selectOption", selectOption);
			mv.addObject("keyword", keyword);
			mv.addObject("searchArtist", searchArtist);
			mv.addObject("searchArtCount", searchArtCount);
			mv.addObject("searchArt", searchArt);
			mv.addObject("searchTagCount", searchTagCount);
			mv.addObject("searchTags", searchTags);
			viewpage = "artist/artistSearch";
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
