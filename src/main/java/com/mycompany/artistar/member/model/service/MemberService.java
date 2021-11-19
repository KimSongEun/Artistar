package com.mycompany.artistar.member.model.service;

import javax.servlet.http.HttpSession;

import com.mycompany.artistar.member.model.vo.Member;

public interface MemberService {
	public Member signin(Member member) throws Exception;
	public void signout(HttpSession session) throws Exception;

}
