package com.mycompany.artistar.dm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.artistar.dm.model.service.DmService;
import com.mycompany.artistar.dm.model.vo.Dm;
import com.mycompany.artistar.member.model.vo.Member;


@Controller
public class DmController {
	@Autowired
	private DmService dmService;
	 
	@RequestMapping(value = "/dm" , method = RequestMethod.GET)
	public ModelAndView message_list(ModelAndView mv,HttpServletRequest request, HttpSession session) {
		
		/* String sessionid = (String) session.getAttribute("id"); */
		String sessionid="test";
		String viewpage = "";
		String id = null;
		String userImg = null;
		Dm dm = new Dm();
		List<Dm> volist=null;
		List<Member> volist2=null;
		HashMap<String,String> a = new HashMap<String,String>();
		
		dm.setId(sessionid);
		
		try {
			volist = dmService.messageList(dm);
			System.out.println(volist);
			for(Dm vo : volist) {
				String user_id = vo.getId();
				String target_id = vo.getDm_target_id();
				if(sessionid.equals(vo.getId())) {
					id=vo.getDm_target_id();
					System.out.println("if문 걸림");
					volist2=dmService.MemberList(id);
					System.out.println("사용자 LIST if문"+ volist2);
					
					for(Member vo2 : volist2) {
						userImg=vo2.getMember_img();
						System.out.println("사용자 프로필 " +vo2.getMember_img());
//						mv.addObject("userImg",userImg);
						a.put(vo2.getId(), vo2.getMember_img());
//						System.out.println("list test " + a);
					}
				}
				else if(sessionid.equals(vo.getDm_target_id())) {
					id=vo.getId();
					System.out.println("else if문 걸림");
					volist2=dmService.MemberList(id);
					System.out.println("사용자 LIST else if 문"+ volist2);
					for(Member vo2 : volist2) {
						userImg=vo2.getMember_img();
						System.out.println("사용자 프로필 " + vo2.getMember_img());
//						mv.addObject("userImg",userImg);
						a.put(vo2.getId(), vo2.getMember_img());
					}
				}
				System.out.println("사용자 아이디 : " + user_id + " / 타겟 아이디 : " + target_id);
			}
			viewpage = "DM/dm";
			System.out.println("사용자 이미지!!!!" + userImg);
			System.out.println("list test2 " + a);
			mv.addObject("a",a);
			mv.addObject("sessionid",sessionid);
			mv.addObject("volist",volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		return mv;
	}
}
