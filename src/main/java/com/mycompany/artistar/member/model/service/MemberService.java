package com.mycompany.artistar.member.model.service;

import javax.servlet.http.HttpSession;

import com.mycompany.artistar.member.model.vo.Member;

public interface MemberService {
	// 로그인
	public Member memberLogin(Member member) throws Exception;

}
