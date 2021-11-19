package com.mycompany.artistar.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 로그인  get
	@RequestMapping(value = "/logintest", method = RequestMethod.GET)
	public String logintest(Locale locale, Model model) {
		 return "member/test" ;
		}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String getSignin() throws Exception {
		return "member/signin" ;
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(Member member, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	
		System.out.println("member : " + member);
	   
	 HttpSession session = req.getSession();
	 Member lo = memberService.signin(member);
	 System.out.println("session : " + session);
	 System.out.println("lo : " + lo);
	 System.out.println("member : " + member);
	 
	 if(lo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
         
         int result = 0;
         rttr.addFlashAttribute("result", result);
         //return "redirect:/signin";
         return "redirect:/signin";
         
     }else {
     
     session.setAttribute("member", lo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
     
     return "redirect:/";
	}}
	// 로그아웃
		@RequestMapping(value = "/signout", method = RequestMethod.GET)
		public String signout(HttpSession session) throws Exception {
		
		 
			memberService.signout(session);
		   
		 return "redirect:/";
		}
}