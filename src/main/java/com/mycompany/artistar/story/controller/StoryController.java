package com.mycompany.artistar.story.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.story.model.service.StoryService;
import com.mycompany.artistar.story.model.vo.Story;
import com.mycompany.artistar.story_inquire.vo.StoryInquire;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;
//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value = "/storylist", method = RequestMethod.GET)
	public ModelAndView getStoryList(ModelAndView mv) {
		Story vo = new Story();
		// vo.setStory_num(1); //test
		vo.setId("test"); //사용자 아이디 넣어야함
		String viewpage = "";
		List<Story> volist = null;
		try {
			volist = storyService.getStoryList(vo);
			System.out.println("volist Value : " + volist);
			
			viewpage = "story/storylist";
			mv.addObject("volist", volist);
			
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	@RequestMapping(value = "storydetail", method = RequestMethod.POST)
	public ModelAndView storydetail(ModelAndView mv, @RequestParam("story_num") int story_num, 
			@RequestParam("id") String id ) {
		Story vo = new Story();
		StoryInquire vo1 = new StoryInquire();
		int result=0;
		
		String viewpage = "";
		List<Story> detail = null;
		List<StoryInquire> detail1 = null;
		try {
			vo1.setId(id);
			vo1.setStory_num(story_num);
			//detail2=storyService.
			
			result= storyService.insertStoryInquire(id, story_num);
			
			detail = storyService.getStoryDetail(story_num);
			
			detail1=storyService.getStoryInquireList(story_num);
			
			System.out.println("스토리 조회 정보 및 인원  : " + detail1);
			System.out.println();
			System.out.println("스토리 상세 정보 : " + detail);
			System.out.println("스토리 조회 정보 : " + result);
			System.out.println("스토리 번호 : " + story_num);
			System.out.println("스토리 조회 아이디 : " + id +" / "+ story_num);
			int count=0;
			
			for(StoryInquire SI : detail1) {
				System.out.println(SI.getId());
				count++;
			}
			System.out.println(count+"asdasdasdasd");
			viewpage = "story/storydetail";
			mv.addObject("detail", detail);
			mv.addObject("detail1", detail1);
			mv.addObject("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	@RequestMapping(value = "storydelete", method = RequestMethod.GET)
	public String storyDelete(@RequestParam("storynum") int sno, @RequestParam("deletere") int deletere, RedirectAttributes rttr){
		System.out.println(sno + "== controller에서의 값");
		storyService.deleteStory(sno);
		System.out.println(deletere);
		
		if(deletere==1) {
			String result="삭제가 완료되었습니다.";
			rttr.addFlashAttribute("result", result);
			return "redirect:/storylist";
		}
		return "redirect:/storylist";
	}
	
	@RequestMapping(value = "storyinsert", method = RequestMethod.GET)
	public String storyInsertForm(ModelAndView mv) {
		return "story/storyinsert";
	}

	@RequestMapping(value = "bInsert", method = RequestMethod.POST)
	public ModelAndView storyInsert(Story b, @RequestParam("storyimg") MultipartFile report, @RequestParam("id") String id,
			HttpServletRequest request,HttpServletResponse response, RedirectAttributes rttr, ModelAndView mv) {
		//현재 날짜, 시간 구하기
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("현재 날짜 및 시간 : " + time1);
		
		System.out.println("insert문임");
		System.out.println("report 값 = " + report);
		
		try {
			System.out.println("확인1" + request);
			if (report != null && !report.equals(""))
				storyService.insertStory(time1, report, id);
			
				String result="등록이 완료되었습니다.";
				rttr.addFlashAttribute("result", result);
				mv.setViewName("redirect:/storylist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "storylisttest", method = RequestMethod.GET)
	public ModelAndView storyInquireTest(ModelAndView mv) {
		Story vo = new Story();
		Member member = new Member();
		// vo.setStory_num(1); //test
		
		String viewpage = "";
		List<Story> volist = null;
		List<Member> volist2 = null;
		List<Story> volist3 = null;
		try {
			volist = storyService.getStoryMainList();
			volist3 = storyService.getStoryIdList();
			
			Set<String> set= new HashSet<>();
			ArrayList<String> list = new ArrayList<>(); //중복확인을 위한 arraylist
			
			for(Story vo3 : volist3) {
				String userId=vo3.getId();
//				System.out.println(userId);
				list.add(userId);
			}
			
			
//			System.out.println("asdasdasdasdasdasdasd" + volist );
			viewpage = "story/storylisttest";
			mv.addObject("volist", volist);
			for(Story vo1 : volist) {
				String asd = vo1.getMember().getMember_img();
				System.out.println(asd);
			}
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	
}
