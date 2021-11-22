package com.mycompany.artistar.artist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.artist.model.service.ArtistService;
import com.mycompany.artistar.artist.model.vo.Artist;

@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping(value = "/artistlist", method = RequestMethod.GET)
	public ModelAndView getBoardList(ModelAndView mv) {
//		Artist artistVo = new Artist();
		Artist artistArtInfoVo = new Artist();
		Artist artistArtistFollowerVo = new Artist();
		String viewpage = "";
//		List<Artist> artistvolist = null;
		List<Artist> artistArtInfo = null;
		List<Artist> artistFollower = null;
		try {
//		artistvolist = artistService.getArtistList(artistVo);
		artistArtInfo = artistService.getArtistArtInfoList(artistArtInfoVo);
		artistFollower = artistService.getArtistFollowerList(artistArtistFollowerVo);
		viewpage = "artist/artistlist";
//		mv.addObject("artistvolist", artistvolist);
		mv.addObject("artistArtInfo", artistArtInfo);
		mv.addObject("artistFollower", artistFollower);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
