package com.mycompany.artistar.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.alarm.model.service.AlarmService;
import com.mycompany.artistar.alarm.model.vo.Alarm;
import com.mycompany.artistar.artinfo.model.vo.ArtInfo;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping("header")
	public ModelAndView alarmHeader(ModelAndView mv
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage="";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
	    String userId = m.getId();
		try {
			int alarmCount = alarmService.alarmCount(userId);
			mv.addObject("alarmCount", alarmCount);
			viewpage = "index/header";
			System.out.println("알람카운트는??" + alarmCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@RequestMapping(value="alarmContent", method=RequestMethod.GET)
	public ModelAndView alarmContent(
			ModelAndView mv
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage="";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
		String userId = m.getId();
		try {
			List<Alarm> alarmList = alarmService.alarmList(userId);
			alarmService.alarmStatus(userId);
			mv.addObject("alarmList", alarmList);
			viewpage = "artist/alarmModal";
		} catch (Exception e) {
			e.printStackTrace();
			viewpage = "error/commonError";
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
