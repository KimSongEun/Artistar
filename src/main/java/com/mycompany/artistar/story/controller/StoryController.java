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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.story.model.service.StoryService;
import com.mycompany.artistar.story.model.vo.Story;
import com.mycompany.artistar.story_inquire.vo.StoryInquire;

@Controller
@SessionAttributes("member")
public class StoryController {
	
	@Autowired
	private StoryService storyService;
//	cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";
	
	@RequestMapping(value = "/storylist", method = RequestMethod.GET)
	public ModelAndView getStoryList(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id ??? : " + sessionid);
		
		Story vo = new Story();
		// vo.setStory_num(1); //test
		vo.setId(sessionid); // ????????? ????????? ????????????
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
	@RequestMapping(value = "/post/storydetail", method = RequestMethod.GET)
	public ModelAndView storyDetail(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam("id") String id, @RequestParam(value = "pagenum", defaultValue = "1") String pageNum) {
		List<Story> detail = null;
		List<StoryInquire> detail1 = null;
		int result=0;
		int count=0;
		
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id ??? : " + sessionid);
		
		String Uid=sessionid;
		
		final int PAGE_SIZE = 1; // ??? ????????? ??? ??????
		final int PAGE_BLOCK = 1; // ??? ????????? ????????? ????????? ?????? ???
		int bCount = 0; // ??? ??????
		int pageCount = 0; // ??? ????????????
		int startPage = 1; // ????????? ????????? ???????????????
		int endPage = 1; // ????????? ????????? ??????????????????
		int currentPage = 1;
		int startRnum = 1; // ????????? ???
		int endRnum = 1; // ????????? ???
		
		String viewpage = "";
		if (pageNum != null) { // ????????? ???????????? ??????.
			currentPage = Integer.parseInt(pageNum); // ????????? ?????????
		}

		try {
			

			bCount =storyService.getStoryCount(id);
			
			System.out.println("test : " + bCount);

			// ??? ???????????? = (???????????? / ??????????????????) + (?????????????????? ????????????????????? ?????? ???????????? 0??? ???????????? ?????????????????? 1 ??????)
			pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
			// rownum ?????? ??????
			startRnum = (currentPage - 1) * PAGE_SIZE + 1; // 1//6//11/16//21
			endRnum = startRnum + PAGE_SIZE - 1;
			if (endRnum > bCount)
				endRnum = bCount;

			if (currentPage % PAGE_BLOCK == 0) {
				startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
			} else {
				startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
			}
			endPage = startPage + PAGE_BLOCK - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			System.out.println("?????? " + startRnum+ "???" + endRnum);
			
			detail = storyService.getStoryDetail(id, startRnum, endRnum);// ?????? ????????? ????????????
			System.out.println("?????? ?????? :: " + detail);
			for(Story vo : detail) {
				System.out.println(vo.getStory_num()+"==========");
				System.out.println(vo.getId()+"==========");
				result = storyService.insertStoryInquire(Uid, vo.getStory_num());
				System.out.println("????????? ?????? ????????? ????????? ?????? ???????????? ?????? : " + result);
				detail1 = storyService.getStoryInquireList(vo.getStory_num());
				count = detail1.size();
				System.out.println("?????? ??? : " + count);
			}

			System.out.println("for??? ??? ?????? ??? : " + count);
			
			viewpage = "story/storydetail";
			mv.addObject("detail",detail);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("pageCount",pageCount);
			mv.addObject("bCount",bCount);
			mv.addObject("count",count);
			mv.addObject("detail1",detail1);
			mv.addObject("sessionid",sessionid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}

	@RequestMapping(value = "storydetail", method = RequestMethod.GET)
	public ModelAndView storydetail(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam("id") String id, @RequestParam(value = "pagenum", defaultValue = "1") String pageNum) {
		List<Story> detail = null;
		List<StoryInquire> detail1 = null;
		int result=0;
		int count=0;
		
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id ??? : " + sessionid);
		
		String Uid=sessionid;
		
		final int PAGE_SIZE = 1; // ??? ????????? ??? ??????
		final int PAGE_BLOCK = 1; // ??? ????????? ????????? ????????? ?????? ???
		int bCount = 0; // ??? ??????
		int pageCount = 0; // ??? ????????????
		int startPage = 1; // ????????? ????????? ???????????????
		int endPage = 1; // ????????? ????????? ??????????????????
		int currentPage = 1;
		int startRnum = 1; // ????????? ???
		int endRnum = 1; // ????????? ???
		
		String viewpage = "";
		if (pageNum != null) { // ????????? ???????????? ??????.
			currentPage = Integer.parseInt(pageNum); // ????????? ?????????
		}

		try {
			

			bCount =storyService.getStoryCount(id);
			
			System.out.println("test : " + bCount);

			// ??? ???????????? = (???????????? / ??????????????????) + (?????????????????? ????????????????????? ?????? ???????????? 0??? ???????????? ?????????????????? 1 ??????)
			pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
			// rownum ?????? ??????
			startRnum = (currentPage - 1) * PAGE_SIZE + 1; // 1//6//11/16//21
			endRnum = startRnum + PAGE_SIZE - 1;
			if (endRnum > bCount)
				endRnum = bCount;

			if (currentPage % PAGE_BLOCK == 0) {
				startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
			} else {
				startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
			}
			endPage = startPage + PAGE_BLOCK - 1;
			if (endPage > pageCount) endPage = pageCount;
			
			System.out.println("?????? " + startRnum+ "???" + endRnum);
			
			detail = storyService.getStoryDetail(id, startRnum, endRnum);// ?????? ????????? ????????????
			System.out.println("?????? ?????? :: " + detail);
			for(Story vo : detail) {
				System.out.println(vo.getStory_num()+"==========");
				System.out.println(vo.getId()+"==========");
				result = storyService.insertStoryInquire(Uid, vo.getStory_num());
				System.out.println("????????? ?????? ????????? ????????? ?????? ???????????? ?????? : " + result);
				detail1 = storyService.getStoryInquireList(vo.getStory_num());
				count = detail1.size();
				System.out.println("?????? ??? : " + count);
			}

			System.out.println("for??? ??? ?????? ??? : " + count);
			
			viewpage = "story/storydetail";
			mv.addObject("detail",detail);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("pageCount",pageCount);
			mv.addObject("bCount",bCount);
			mv.addObject("count",count);
			mv.addObject("detail1",detail1);
			mv.addObject("sessionid",sessionid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}

	@RequestMapping(value = "storydelete", method = RequestMethod.GET)
	public String storyDelete(@RequestParam("storynum") int sno, @RequestParam("deletere") int deletere,
			RedirectAttributes rttr) {
		System.out.println(sno + "== controller????????? ???");
		storyService.deleteStory(sno);
		System.out.println(deletere);

		if (deletere == 1) {
			String result = "????????? ?????????????????????.";
			rttr.addFlashAttribute("result", result);
			return "redirect:/storylist";
		}
		return "redirect:/storylist";
	}
	

	@RequestMapping(value = "storyinsert", method = RequestMethod.GET)
	public ModelAndView storyInsertForm(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String id = mvo.getId();
		System.out.println("session id ??? : " + id);
		
		String viewpage = "story/storyinsert";
		
		mv.addObject("id",id);
		mv.setViewName(viewpage);
		return mv;
	}

	@RequestMapping(value = "bInsert", method = RequestMethod.POST)
	public ModelAndView storyInsert(Story b, @RequestParam("storyimg") MultipartFile report,
			@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, ModelAndView mv) {
		// ?????? ??????, ?????? ?????????
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("?????? ?????? ??? ?????? : " + time1);

		System.out.println("insert??????");
		System.out.println("report ??? = " + report);

		try {
			System.out.println("??????1" + request);
			if (report != null && !report.equals(""))
				storyService.insertStory(time1, report, id);

			String result = "????????? ?????????????????????.";
			rttr.addFlashAttribute("result", result);
			mv.setViewName("redirect:/storylist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "storylisttest", method = RequestMethod.GET)
	public ModelAndView storyInquireTest(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session = request.getSession();
		Member mvo = (Member)session.getAttribute("member");
		String sessionid = mvo.getId();
		System.out.println("session id ??? : " + sessionid);
		
		String viewpage = "";
		List<Story> volist = null;
		List<Story> volist3 = null;
		List<Follow> followid=null;
		
		try {
			followid=storyService.getStoryFollowList(sessionid);
			volist = storyService.getStoryMainList();
			volist3 = storyService.getStoryIdList();
			System.out.println("test1 : " + followid);
			System.out.println("test2 : " + volist);
			System.out.println("test3 : " + volist3);
			
			Set<String> set = new HashSet<>();
			ArrayList<String> list = new ArrayList<>(); // ??????????????? ?????? arraylist

			for (Story vo3 : volist3) {
				String userId = vo3.getId();
				list.add(userId);
			}

			viewpage = "story/storylisttest";
			mv.addObject("volist", volist);
			mv.addObject("followid", followid);
			for (Story vo1 : volist) {
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
	
	@Scheduled(cron = "0 0/1 * * * *") 
	public void test2() { 
		storyService.updateStory();
		}

}