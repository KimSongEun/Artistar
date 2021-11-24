package com.mycompany.artistar.member.model.service;

import com.mycompany.artistar.member.model.vo.Member;

public interface MemberService {
	// 로그인
	public Member memberLogin(Member member) throws Exception;

	// 회원가입
	public void memberJoin(Member member) throws Exception;

}
