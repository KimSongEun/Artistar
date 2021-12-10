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
	public String join(Member member, RedirectAttributes rttr) {
		try {
			memberService.memberJoin(member);
			rttr.addFlashAttribute("message", "회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
			return "redirect:/login";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/commonError";
		}
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

	// 비밀번호 변경 get
	@RequestMapping(value = "/pwChange", method = RequestMethod.GET)
	public String pwChange() throws Exception {
		return "member/pwChange2";
	}

	// 비밀번호 변경 post
	@RequestMapping(value = "/pwChange", method = RequestMethod.POST)
	public String pwChange(Member member, HttpSession session, RedirectAttributes rttr)  {
		try {
			memberService.pwChange(member);
			session.setAttribute("member", member);
			rttr.addFlashAttribute("message", "비밀번호 변경이 완료되었습니다.");
			return "redirect:/pwChange";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
			return "member/pwChange";
		}
	}

	// 회원 탈퇴 get
	@RequestMapping(value = "/memberdelete", method = RequestMethod.GET)
	public String memberdelete() throws Exception {
		return "member/memberdelete";
	}
			
	// 회원 탈퇴 post
	@RequestMapping(value = "/memberdelete", method = RequestMethod.POST)
	public String memberdelete(HttpSession session, Member vo, RedirectAttributes rttr) throws Exception {
		Member member = (Member) session.getAttribute("member");
		String oldPass = member.getPw();
		String newPass = vo.getPw();

		if (!(oldPass.equals(newPass))) {			
			rttr.addFlashAttribute("message", "비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해주세요.");
			return "redirect:/memberdelete";
		}
		memberService.memberDelete(vo);
		rttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다. 로그인 페이지로 이동합니다.");
		session.invalidate();
		return "redirect:/login";
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
		String content = "Artistar를 방문해주셔서 감사합니다." + "<br><br>" + "회원가입 인증번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 입력란에 기입하여 주세요.";
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