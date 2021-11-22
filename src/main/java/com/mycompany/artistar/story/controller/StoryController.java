package com.mycompany.artistar.story.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.mycompany.artistar.story.model.service.StoryService;
import com.mycompany.artistar.story.model.vo.Story;

@Controller
public class StoryController {
	@Autowired
	private StoryService storyService;

	@RequestMapping(value = "/storylist", method = RequestMethod.GET)
	public ModelAndView getStoryList(ModelAndView mv) {
		Story vo = new Story();
		// vo.setStory_num(1); //test

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
			
//			String result="insert success";
//			mv.addObject("result",result);
			
			viewpage = "story/storylist";
			mv.addObject("volist", volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
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
	public String boardInsertForm(ModelAndView mv) {
		return "story/storyinsert";
	}

	@RequestMapping(value = "bInsert", method = RequestMethod.POST)
	public ModelAndView storyInsert(Story b, @RequestParam("storyimg") MultipartFile report,@RequestParam("insertre") int insertre,
			HttpServletRequest request,HttpServletResponse response, RedirectAttributes rttr, ModelAndView mv) {
		//현재 날짜, 시간 구하기
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("현재 날짜 및 시간 : " + time1);
		
		System.out.println("insert문임");
		System.out.println("report 값 = " + report);
		
		try {
			System.out.println("확인1");
			if (report != null && !report.equals(""))
				saveFile(report, request);
			b.setStory_date(time1);
			b.setStory_img(report.getOriginalFilename());
			storyService.insertStory(b);
			
			String result="등록이 완료되었습니다.";
			rttr.addFlashAttribute("result", result);
			mv.setViewName("redirect:/storylist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		System.out.println("순서 확인 차 sout");
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
//		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			System.out.println("폴더 생성");
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}
}
