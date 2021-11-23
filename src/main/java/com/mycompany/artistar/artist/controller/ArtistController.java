package com.mycompany.artistar.artist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping(value = "artistmain", method=RequestMethod.GET)
	public ModelAndView artistMain(ModelAndView mv
			, @RequestParam(value="artistNum", defaultValue="0") int artistNum
									 ) {
		System.out.println("넘어온 값 : " +artistNum);
		Artist artistVo = new Artist();
		Artist artistArtistFollowerVo = new Artist();
		String viewpage = "";
		String userId = "a"; // TODO: 로그인 하면 바꾸기
		List<Artist> artistvolist = null;
		List<Artist> artistArtInfo = null;
		List<Artist> artistFollower = null;
		try {
		artistvolist = artistService.getArtistList(artistVo);
		artistArtInfo = artistService.getArtistArtInfoImgList(artistNum);
		artistFollower = artistService.getArtistFollowerList(artistArtistFollowerVo);
		int myArtGalleryArtistCount = artistService.myArtGalleryArtistCount(userId);
		int myArtGalleryArtCount = artistService.myArtGalleryArtCount(userId);
		viewpage = "artist/artistmain";
		mv.addObject("artistvolist", artistvolist);
		mv.addObject("artistArtInfo", artistArtInfo);
		mv.addObject("artistFollower", artistFollower);
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
	
	@RequestMapping("myartgallery")
	public ModelAndView myArtGallery(ModelAndView mv
			, @RequestParam(value="userId") String userId
			) {
		String viewpage = "";
		try {
			viewpage = "artist/myartgallery";
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
