package com.mycompany.artistar.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.artistar.follow.model.service.FollowService;
import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;
import com.mycompany.artistar.post.model.vo.Post;

@Controller
//@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private FollowService followService;

	@Autowired
	private JavaMailSender mailSender;

	// cloudinary
	private static final String CLOUDINARY_CLOUD_NAME = "dcxu8acr5";
	private static final String CLOUDINARY_API_KEY = "871828519422828";
	private static final String CLOUDINARY_API_SECRET = "HLamwy59EVVxgcBr7jG2QfYByVs";

	// 로그인 get
	@RequestMapping(value = "/", method = RequestMethod.GET)
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
			return "redirect:/";
		} else {
			session.setAttribute("member", lo); // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			return "redirect:/post/postlist";
		}
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
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
			return "redirect:/";
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
	@RequestMapping(value = "/pwchange", method = RequestMethod.GET)
	public String pwchange() throws Exception {
		return "member/pwchange";
	}

	// 비밀번호 변경 post
	@RequestMapping(value = "/pwchange", method = RequestMethod.POST)
	public String pwchange(Member member, HttpSession session, RedirectAttributes rttr) {
		try {
			memberService.pwChange(member);
			session.setAttribute("member", member);
			rttr.addFlashAttribute("message", "비밀번호 변경이 완료되었습니다.");
			return "redirect:/pwchange";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
			return "member/pwchange";
		}
	}

	// 회원정보 수정 get
//	@RequestMapping(value = "/memberupdate", method = RequestMethod.GET)
//	public String memberupdate() throws Exception {
//		return "member/memberupdate";
//	}

	// 회원 정보 수정 get
	@RequestMapping(value = "memberupdate", method = RequestMethod.GET)
	public ModelAndView memberupdate(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member vo = (Member) session.getAttribute("member");
		vo.getId();
		System.out.println("id : " + vo.getId());
		System.out.println("vo : " + vo);
		String viewpage = "";
		List<Member> volist = null;
		try {
			volist = memberService.getMemberProfile(vo);
			viewpage = "member/memberupdate";
			mv.addObject("volist", volist);
			System.out.println("volist : " + volist);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}

	// 회원정보 수정 post
	@RequestMapping(value = "/memberupdate", method = RequestMethod.POST)
	public ModelAndView memberupdate(Member member, ModelAndView mv, HttpSession session) {
		String viewpage = "";
		Member login_info = (Member) session.getAttribute("member");
		if (login_info == null) {
			mv.addObject("message", "로그인 후 회원 정보를 수정해주세요.");
			viewpage = "member/login";
		} else {
			try {
				memberService.memberUpdate(member);
				session.setAttribute("member", member);
				mv.addObject("message", "회원정보 수정이 완료되었습니다.");
				System.out.println("memberupdate 처리");
				viewpage = "member/memberupdate";
			} catch (Exception e) {
				viewpage = "error/commonError";
				e.printStackTrace();
			}
		}
		mv.setViewName(viewpage);
		return mv;
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
		return "redirect:/";
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

	// 비밀번호 찾기 - 회원정보 조회
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public String pwfind() {
		System.out.println("비밀번호 찾기 페이지 이동");
		return "member/pwfind";
	}

	// 비밀번호 찾기 - 회원정보 조회
	@RequestMapping(value = "/pwfind", method = RequestMethod.POST)
	public ModelAndView pwfind(Member member, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		String email = (String) request.getParameter("email");
		String name = (String) request.getParameter("uname");

		try {
			Member vo = memberService.pwSelectMember(member);
			System.out.println("VO : " + vo);

			if (vo != null) {
				Random random = new Random();
				int num = random.nextInt(888888) + 111111;

				if (vo.getUname().equals(name)) {
					session.setAttribute("email", vo.getEmail());
					String setfrom = "kh_final_artistar@naver.com";
					String tomail = email;
					String title = "[ Artistar ] 비밀번호 변경 인증 이메일 입니다";
					String content = "Artistar를 방문해주셔서 감사합니다." + "<br><br>" + "Artistar 비밀번호 찾기(변경) 인증번호는 " + num
							+ " 입니다." + "<br><br>" + "해당 인증번호를 인증번호 입력란에 기입하여 주세요.";

					try {
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

						messageHelper.setFrom(setfrom);
						messageHelper.setTo(tomail);
						messageHelper.setSubject(title);
						messageHelper.setText(content);

						mailSender.send(message);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					ModelAndView mv = new ModelAndView();
					mv.setViewName("member/pwauth");
					mv.addObject("vo", vo);
					mv.addObject("num", num);
					mv.addObject("email", email);
					System.out.println("num ==============" + num);
					mv.addObject("message", "메일로 인증번호를 전송했습니다. 인증번호를 입력해주세요.");
					return mv;
				} else {
					ModelAndView mv = new ModelAndView();
					mv.setViewName("member/pwfind");
					mv.addObject("message", "회원정보가 일치하지 않습니다.");
					return mv;
				}
			} else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pwfind");
				mv.addObject("message", "회원정보가 일치하지 않습니다.");
				return mv;
			}
		} catch (Exception e) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("error/commonError");
			return mv;
		}
	}

	// 비밀번호 찾기 - 인증번호 입력
	@RequestMapping(value = "/pwauth", method = RequestMethod.POST)
	public ModelAndView pwauth(@RequestParam(value = "email_injeung") String email_injeung,
			@RequestParam(value = "num") String num) {

		try {
			if (email_injeung.equals(num)) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pwnew");
				mv.addObject("message", "이메일 인증에 성공했습니다. 새로운 비밀번호를 입력해주세요.");
				System.out.println("인증코드가 일치!!!!!!!!!!!!!!!!");
				System.out.println("num 인증번호 ================" + num);
				return mv;
			} else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("member/pwauth");
				mv.addObject("num", num);
				mv.addObject("message", "인증코드가 일치하지 않습니다. 인증코드를 다시 확인해주세요.");
				System.out.println("인증코드가 일치하지 않습니다. 인증코드를 다시 확인해주세요.");
				System.out.println("num 인증번호 ================" + num);
				return mv;
			}
		} catch (Exception e) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("error/commonError");
			return mv;
		}
	}

	// 비밀번호 찾기 - 새 비밀번호 업데이트
	@RequestMapping(value = "/pwnew", method = RequestMethod.POST)
	public String pwnew(Member vo, HttpSession session, RedirectAttributes rttr) {
		System.out.println("새 비밀번호 입력페이지!!!!!!!!!!!!!");
		try {
			int result = memberService.pwFindUpdate(vo);
			System.out.println("result  : " + result);
			if (result == 1) {
				rttr.addFlashAttribute("message", "비밀번호 변경이 완료되었습니다. 로그인 후 이용해주세요.");
				return "redirect:/";
			} else {
				session.setAttribute("member", vo);
				rttr.addFlashAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
				return "member/pwnew";
			}
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
			return "error/commonError";
		}
	}

	// 회원 프로필사진 수정
	@RequestMapping(value = "memberProfileUpdate", method = RequestMethod.POST)
	public ModelAndView memberProfileUpdate(Member vo, @RequestParam("memberimg") MultipartFile report,
			@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, ModelAndView mv) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		System.out.println("report 값 = " + report);
		String Mid = member.getId();
		String Vid = vo.getId();

		String MgetMember_img = member.getMember_img();
		String VgetMember_img = vo.getMember_img();

		try {
			System.out.println("확인1" + request);
			if (report != null && !report.equals(""))

				memberService.memberProfileUpdate(report, id);
			session.setAttribute("member", member);
			session.setAttribute("vo", vo);
			System.out.println("member : " + member);
			System.out.println("vo : " + vo);

			String message = "등록이 완료되었습니다.";
			rttr.addFlashAttribute("message", message);
			mv.setViewName("redirect:/memberupdate");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// 회원 프로필사진 삭제
	@RequestMapping(value = "memberProfileDelete", method = RequestMethod.POST)
	public ModelAndView memberProfileDelete(Member vo, @RequestParam("memberimg2") MultipartFile report,
			@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr, ModelAndView mv) {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		System.out.println("report 값 = " + report);
		String Mid = member.getId();
		String Vid = vo.getId();

		String MgetMember_img = member.getMember_img();
		String VgetMember_img = vo.getMember_img();

		try {
			System.out.println("확인1" + request);
			if (report != null && !report.equals(""))

				memberService.memberProfileDelete(report, id);
			session.setAttribute("member", member);
			session.setAttribute("vo", vo);
			System.out.println("member : " + member);
			System.out.println("vo : " + vo);

			String message = "삭제가 완료되었습니다.";
			rttr.addFlashAttribute("message", message);
			mv.setViewName("redirect:/memberupdate");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// MyPost
	@RequestMapping(value = "mypost/{id}", method = RequestMethod.GET)
	public ModelAndView myPost(@PathVariable String id, ModelAndView mv, HttpServletRequest request,
			RedirectAttributes rttr) {
		String viewpage = "";
		HttpSession session = request.getSession();
		Member vo = (Member) session.getAttribute("member");
		System.out.println("mvo: " + vo);

		Follow follow = new Follow();

		try {
			List<Post> list = memberService.getMyPostList(id);
			System.out.println("list: =====================" + list);

			Member p = memberService.memberList(id);
			follow.setFollowId(p.getId());
			follow.setId(vo.getId());
			int checkFollow = followService.checkFollow(follow);
			int myPostCount = memberService.myPostCount(id);
			int myFollowerCount = memberService.myFollowerCount(id);
			int myFollowCount = memberService.myFollowCount(id);
			viewpage = "member/mypost";
			mv.addObject("id", id);
			mv.addObject("myPostCount", myPostCount);
			mv.addObject("myFollowerCount", myFollowerCount);
			mv.addObject("myFollowCount", myFollowCount);
			mv.addObject("postlist", list);
			mv.addObject("checkFollow", checkFollow);
		} catch (Exception e) {
			viewpage = "error/commonError";
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}

	// 팔로우 임시
	@RequestMapping(value = "follow/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String follow(@PathVariable String id, HttpSession session, HttpServletRequest request) throws Exception {

		session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Member pmember = memberService.memberList(id);
		System.out.println("follow/{id} : " + id); // 로그인한 아이디

		Follow follow = new Follow();
		follow.setFollowId(pmember.getId());
		follow.setId(member.getId());
		System.out.println("p.getId() : ==========" + pmember.getId());
		System.out.println("a.getId() : ===========" + member.getId());
		try {
			// memberService.memberList(id);
			followService.doFollow(follow);
			return "FollowOK";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/commonError";
		}
	}

	// 언팔로우 임시
	@RequestMapping(value = "unfollow/{id}", method = RequestMethod.POST)
	@ResponseBody
	public String unfollow(@PathVariable String id, HttpSession session, HttpServletRequest request) throws Exception {

		session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Member pmember = memberService.memberList(id);
		System.out.println("follow/{id} : " + id); // 로그인한 아이디

		Follow follow = new Follow();
		follow.setFollowId(pmember.getId());
		follow.setId(member.getId());
		System.out.println("p.getId() : ==========" + pmember.getId());
		System.out.println("a.getId() : ===========" + member.getId());
		try {
			// memberService.memberList(id);
			followService.unFollow(follow);
			return "unFollowOK";
		} catch (Exception e) {
			e.printStackTrace();
			return "error/commonError";
		}

	}
}