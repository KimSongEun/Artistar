package com.mycompany.artistar.artist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artinfo.model.service.ArtInfoService;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@Autowired
	private ArtInfoService artInfoService;
	
	@RequestMapping(value = "artistmain", method=RequestMethod.GET)
	public ModelAndView artistMain(ModelAndView mv) {
		String viewpage = "";
		String userId = "song"; // TODO: 로그인 하면 바꾸기
		List<Artist> artistvolist = null;
		try {
//		artistvolist = artistService.getArtistList(1, 3);
		artistvolist = artistService.getArtistList(1, 3); // 시작점에서 얼마나 떨어졌는가, 몇개의 값
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
		System.out.println("currentPage의 값은 : " + currentPage);
		System.out.println("offset의 값은 : " + offset);
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
		System.out.println("ajax로 갈 것 " + artistvolist);
		return map;
	};
	
	@RequestMapping("myartgallery")
	public ModelAndView myArtGallery(ModelAndView mv
			, @RequestParam(value="userId") String userId
			) {
		String viewpage = "";
		try {
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			List<Artist> myGalleryArtistList = artistService.getMyGalleryArtistList(userId);
			List<ArtInfo> myGalleryArtList = artInfoService.getMyGalleryArtList(userId);
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
	
	@RequestMapping("artistdetail")
	public ModelAndView artistDetail(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
			) {
		String viewpage = "";
		try {
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			int artistProfileContributorCount = artistService.artistProfileContributorCount(artistNum);
			List<ArtInfo> artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(artistNum);
//			
			viewpage = "artist/artistdetail";
			mv.addObject("artistNum", artistNum);
			mv.addObject("artistProfileArtist", artistProfileArtist);
			mv.addObject("artistProfileArtCount", artistProfileArtCount);
			mv.addObject("artistProfileFollowerCount", artistProfileFollowerCount);
			mv.addObject("artistProfileContributorCount", artistProfileContributorCount);
			mv.addObject("artistProfileArtInfoList", artistProfileArtInfoList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping("artistedit")
	public ModelAndView artistEdit(ModelAndView mv
			, @RequestParam(value="artistNum") int artistNum
			) {
		String viewpage = "";
		try {
			Artist artistProfileArtist = artistService.getArtistProfileArtist(artistNum);
			int artistProfileArtCount = artistService.artistProfileArtCount(artistNum);
			int artistProfileFollowerCount = artistService.artistProfileFollowerCount(artistNum);
			int artistProfileContributorCount = artistService.artistProfileContributorCount(artistNum);
			List<ArtInfo> artistProfileArtInfoList = artInfoService.getArtistProfileArtInfoList(artistNum);
//			
			viewpage = "artist/artistedit";
			mv.addObject("artistNum", artistNum);
			mv.addObject("artistProfileArtist", artistProfileArtist);
			mv.addObject("artistProfileArtCount", artistProfileArtCount);
			mv.addObject("artistProfileFollowerCount", artistProfileFollowerCount);
			mv.addObject("artistProfileContributorCount", artistProfileContributorCount);
			mv.addObject("artistProfileArtInfoList", artistProfileArtInfoList);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}	
}
