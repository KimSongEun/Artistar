package com.mycompany.artistar.member.model.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.member.model.dao.MemberDao;
import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao memberdao;

	@Override
	public Member signin(Member member) throws Exception {
	return memberdao.signin(member);
	}
	
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	
}
