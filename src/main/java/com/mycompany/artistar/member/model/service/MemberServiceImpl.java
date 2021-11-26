package com.mycompany.artistar.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.member.model.dao.MemberDao;
import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberdao;

	// 로그인
	@Override
	public Member memberLogin(Member member) throws Exception {
		return memberdao.memberLogin(member);
	}

	// 회원가입
	@Override
	public void memberJoin(Member member) throws Exception {
		memberdao.memberJoin(member);
	}

	// 아이디 중복 검사
	@Override
	public int idCheck(String id) throws Exception {
		return memberdao.idCheck(id);
	}

	// 이메일 중복 검사
	@Override
	public int emailCheck(String email) throws Exception {
		return memberdao.emailCheck(email);
	}
}
