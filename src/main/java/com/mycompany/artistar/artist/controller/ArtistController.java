package com.mycompany.artistar.artist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping(value = "artistmain", method=RequestMethod.GET)
	public ModelAndView artistMain(ModelAndView mv
			, @RequestParam(value="artistNum", defaultValue="2") int artistNum
									 ) {
		System.out.println("넘어온 값 : " +artistNum);
		String viewpage = "";
		String userId = "song"; // TODO: 로그인 하면 바꾸기
		List<Artist> artistvolist = null;
		try {
		artistvolist = artistService.getArtistList();
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
	
	@RequestMapping(value = "artistmain.ajax", method=RequestMethod.POST) 
	@ResponseBody
	public List<Artist> artistMain() {
		List<Artist> artistvolist = null;
		try {
			artistvolist = artistService.getArtistList();
			
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("ajax로 갈 것 " + artistvolist);
		return artistvolist;
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
			List<Artist> artistvolist = artistService.getArtistList();
			viewpage = "artist/myartgallery";
			mv.addObject("userId", userId);
			mv.addObject("artistvolist", artistvolist);
			mv.addObject("myArtGalleryArtistCount", myArtGalleryArtistCount);
			mv.addObject("myArtGalleryArtCount", myArtGalleryArtCount);
			mv.addObject("myArtGalleryProfileImg", myArtGalleryProfileImg);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
