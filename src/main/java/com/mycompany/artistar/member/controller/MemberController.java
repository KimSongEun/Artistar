package com.mycompany.artistar.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;

@Controller
//@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "membermain")
	public String membermain() {
		System.out.println("membermain 페이지 진입");
		return "member/membermain";
	}

	// 로그인 get
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		System.out.println("로그인 페이지 진입");
		return "member/login";
	}

	// 로그인 post
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Member member, RedirectAttributes rttr) throws Exception {

		System.out.println("login 메서드 진입");
		HttpSession session = request.getSession();
		Member lo = memberService.memberLogin(member);

		if (lo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			rttr.addFlashAttribute("message", "사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.");
			return "redirect:/login";
		} else {
			session.setAttribute("member", lo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			return "redirect:/membermain";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/login";
	}

	// 약관동의 페이지 이동
	@RequestMapping(value = "joinagree", method = RequestMethod.GET)
	public String joinagree() {
		System.out.println("joinagree 페이지 진입");
		return "member/joinagree";
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(Member member, ModelAndView mv) {
		String viewpage = "";
		try {
			memberService.memberJoin(member);
			viewpage = "member/login";
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		System.out.println("member : " + member);
		mv.setViewName(viewpage);
		return mv;
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String id) throws Exception {
		int result = memberService.idCheck(id);
		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 존재 x
		}
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/memberEmailChk", method = RequestMethod.POST)
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		int result = memberService.emailCheck(email);
		if (result != 0) {
			return "fail"; // 중복 이메일 존재
		} else {
			return "success"; // 중복 이메일 존재 x
		}
	}

	// 닉네임 중복 검사
	@RequestMapping(value = "/memberNicknameChk", method = RequestMethod.POST)
	@ResponseBody
	public String nicknameCheck(String nickname) throws Exception {
		int result = memberService.nicknameCheck(nickname);
		if (result != 0) {
			return "fail"; // 중복 닉네임 존재
		} else {
			return "success"; // 중복 닉네임 존재 x
		}
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
	
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : " + email);
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 " + checkNum);

		// 이메일 보내기
		String setFrom = "kh_final_artistar@naver.com";
		String toMail = email;
		String title = "[ Artistar ] 회원가입 인증 이메일입니다.";
		String content = "Artistar를 방문해주셔서 감사합니다." + "<br><br>" + "회원가입 인증 코드는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증 코드 입력란에 기입하여 주세요.";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);
		return num;
	}
}