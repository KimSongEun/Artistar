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
@RequestMapping(value="/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/logintest", method = RequestMethod.GET)
	public String logintest(Locale locale, Model model) {
		return "member/test";
	}

	// 로그인 get
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGET() {
		System.out.println("로그인 페이지 진입");
	}

	// 로그인 post
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, Member member, RedirectAttributes rttr) throws Exception {

		System.out.println("login 메서드 진입");
		HttpSession session = request.getSession();
		Member lo = memberService.memberLogin(member);

		if (lo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		} else {
			session.setAttribute("member", lo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			return "redirect:/member/logintest";
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/member/login";
	}

}