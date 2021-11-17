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
		Artist vo = new Artist();
		String viewpage = "";
		List<Artist> volist = null;
		try {
		volist = artistService.getArtistList(vo);
		viewpage = "artist/artistlist";
		mv.addObject("volist", volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
