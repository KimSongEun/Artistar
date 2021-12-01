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
	
	@RequestMapping(value="myartgallery", method=RequestMethod.GET)
	public ModelAndView myArtGallery(ModelAndView mv
			, @RequestParam(value="userId") String userId
			) {
		String viewpage = "";
		try {
			int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
			int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
			String myArtGalleryProfileImg = artistService.myArtGalleryProfileImg(userId);
			List<Artist> myGalleryArtistList = artistService.getMyGalleryArtistList(1, 1,userId);
			List<ArtInfo> myGalleryArtList = artInfoService.getMyGalleryArtList(1, 3, userId);
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
			) {
		System.out.println("들어왔나?");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			String userId = "song"; //TODO : session 값 읽어오기!
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
			) {
		System.out.println("들어왔나?");
			List<Artist> myGalleryArtistList = null;
			List<ArtInfo> myGalleryArtList = null;
			Map<String, Object> map = new HashMap<String,Object>();
			String userId = "song"; //TODO : session 값 읽어오기!
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
