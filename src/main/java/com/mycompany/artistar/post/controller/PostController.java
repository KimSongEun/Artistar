package com.mycompany.artistar.post.controller;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.post.model.service.PostService;
import com.mycompany.artistar.post.model.vo.Post;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	@RequestMapping(value = "/postlist", method = RequestMethod.GET)
	public ModelAndView getPostList(ModelAndView mv) {
		Post vo = new Post();
		String viewpage = "";
		List<Post> volist = null;
		try {
			volist = postService.getPostList(vo);
			viewpage = "post/postlist";
			mv.addObject("volist", volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	 @RequestMapping( value="/postinsert", method = RequestMethod.GET ) 
	 public String form( ) { 
	 return "post/postinsert"; 
	 }
	 
	 @RequestMapping( value = "/postinsert", method = RequestMethod.POST ) 
	 public String submitReport1(
	 @RequestParam("file") MultipartFile file) {
		 return "post/postinsert"; 
	 } 
}
