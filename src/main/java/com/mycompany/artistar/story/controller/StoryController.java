package com.mycompany.artistar.story.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.story.model.service.StoryService;
import com.mycompany.artistar.story.model.vo.Story;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;

	@RequestMapping(value = "/storylist", method = RequestMethod.GET)
	public ModelAndView getStoryList(ModelAndView mv) {
		Story vo = new Story();
		//vo.setStory_num(1); //test
		
		String viewpage = "";
		List<Story> volist = null;
		try {
			volist = storyService.getStoryList(vo);
			System.out.println("volist Value : " + volist);
//			if(volist != null) {
//				for(Story vo1 : volist) {
//					System.out.println(vo1.getId());
//					System.out.println(vo1.getStory_img());
//					mv.addObject("id",vo1.getId());
//				}
//			}
//			System.out.println(volist.get(0));
			viewpage = "story/storylist";
//			viewpage = "story/storyinsert";
			mv.addObject("volist", volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
