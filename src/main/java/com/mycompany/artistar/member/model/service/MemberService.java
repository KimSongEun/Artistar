package com.mycompany.artistar.member.model.service;

import com.mycompany.artistar.member.model.vo.Member;

public interface MemberService {
	// 로그인
	public Member memberLogin(Member member) throws Exception;

	// 회원가입
	public void memberJoin(Member member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String id) throws Exception;

	// 이메일 중복 검사
	public int emailCheck(String email) throws Exception;

	// 닉네임 중복 검사
	public int nicknameCheck(String nickname) throws Exception;

	// 회원 탈퇴
	public void memberDelete(Member member) throws Exception;
}
