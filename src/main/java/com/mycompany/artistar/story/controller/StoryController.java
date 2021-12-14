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
	public ModelAndView getStoryList(ModelAndView mv, HttpServletRequest request) {
		Story vo = new Story();
		// vo.setStory_num(1); //test
		vo.setId("test"); // 사용자 아이디 넣어야함
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

	@RequestMapping(value = "storydetail", method = RequestMethod.GET)
	public ModelAndView storydetail(ModelAndView mv, /* @RequestParam("story_num") int story_num, */
			@RequestParam("id") String id, @RequestParam(value = "pagenum", defaultValue = "1") String pageNum) {
		List<Story> detail = null;
		List<StoryInquire> detail1 = null;
		int result=0;
		int count=0;
		String Uid="test";
		
		final int PAGE_SIZE = 1; // 한 페이지 당 글수
		final int PAGE_BLOCK = 1; // 한 화면에 나타날 페이지 링크 수
		int bCount = 0; // 총 글수
		int pageCount = 0; // 총 페이지수
		int startPage = 1; // 화면에 나타날 시작페이지
		int endPage = 1; // 화면에 나타날 마지막페이지
		int currentPage = 1;
		int startRnum = 1; // 화면에 글
		int endRnum = 1; // 화면에 글
		
		String viewpage = "";
		if (pageNum != null) { // 눌려진 페이지가 있음.
			currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
		}

		try {
			

			bCount =storyService.getStoryCount(id);
			
			System.out.println("test : " + bCount);

			// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)
			pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
			// rownum 조건 계산
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
			
			System.out.println("처음 " + startRnum+ "끝" + endRnum);
			
			detail = storyService.getStoryDetail(id, startRnum, endRnum);// 상세 정보들 가져오기
			System.out.println("상세 정보 :: " + detail);
			for(Story vo : detail) {
				System.out.println(vo.getStory_num()+"==========");
				System.out.println(vo.getId()+"==========");
				result = storyService.insertStoryInquire(Uid, vo.getStory_num());
				System.out.println("스토리 조회 아이디 스토리 번호 들어갔나 확인 : " + result);
				detail1 = storyService.getStoryInquireList(vo.getStory_num());
				count = detail1.size();
				System.out.println("조회 수 : " + count);
			}

			System.out.println("for문 밖 조회 수 : " + count);
			
			viewpage = "story/storydetail";
			mv.addObject("detail",detail);
			mv.addObject("startPage",startPage);
			mv.addObject("endPage",endPage);
			mv.addObject("pageCount",pageCount);
			mv.addObject("bCount",bCount);
			mv.addObject("count",count);
			mv.addObject("detail1",detail1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}

	@RequestMapping(value = "storyDetail", method = RequestMethod.POST)
	public ModelAndView storyDetail(ModelAndView mv, @RequestParam("story_num") int story_num,
			@RequestParam("id") String id) {

		return mv;
	}

	@RequestMapping(value = "storydelete", method = RequestMethod.GET)
	public String storyDelete(@RequestParam("storynum") int sno, @RequestParam("deletere") int deletere,
			RedirectAttributes rttr) {
		System.out.println(sno + "== controller에서의 값");
		storyService.deleteStory(sno);
		System.out.println(deletere);

		if (deletere == 1) {
			String result = "삭제가 완료되었습니다.";
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
	public ModelAndView storyInsert(Story b, @RequestParam("storyimg") MultipartFile report,
			@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, ModelAndView mv) {
		// 현재 날짜, 시간 구하기
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("현재 날짜 및 시간 : " + time1);

		System.out.println("insert문임");
		System.out.println("report 값 = " + report);

		try {
			System.out.println("확인1" + request);
			if (report != null && !report.equals(""))
				storyService.insertStory(time1, report, id);

			String result = "등록이 완료되었습니다.";
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
		String viewpage = "";
		List<Story> volist = null;
		List<Story> volist3 = null;
		try {
			volist = storyService.getStoryMainList();
			volist3 = storyService.getStoryIdList();

			Set<String> set = new HashSet<>();
			ArrayList<String> list = new ArrayList<>(); // 중복확인을 위한 arraylist

			for (Story vo3 : volist3) {
				String userId = vo3.getId();
				list.add(userId);
			}

			viewpage = "story/storylisttest";
			mv.addObject("volist", volist);
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
