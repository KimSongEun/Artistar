package com.mycompany.artistar.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.alarm.model.service.AlarmService;
import com.mycompany.artistar.alarm.model.vo.Alarm;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value = "header", method=RequestMethod.GET)
	public ModelAndView adminmain(ModelAndView mv
	        , HttpSession session
	        , HttpServletRequest request
			) {
		String viewpage="";
		session = request.getSession();
	    Member m = (Member)session.getAttribute("member");
	    String userId = m.getId();
		try {
			int alarmCount = alarmService.alarmCount(userId);
			viewpage = "index/header";
			mv.addObject("alarmCount", alarmCount);
		} catch(Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
}
