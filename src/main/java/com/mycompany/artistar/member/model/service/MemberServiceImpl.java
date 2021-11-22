package com.mycompany.artistar.member.model.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

}
