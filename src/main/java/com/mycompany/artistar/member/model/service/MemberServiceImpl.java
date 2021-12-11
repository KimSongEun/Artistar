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
	
	 // 닉네임 중복 검사
    @Override
 	public int nicknameCheck(String nickname) throws Exception{
		return memberdao.nicknameCheck(nickname);
	}
    
    // 비밀번호 변경
    public int pwChange(Member member) throws Exception{		
		 return memberdao.pwChange(member);		
	}
    
    // 회원정보 수정
    public int memberUpdate(Member member) throws Exception{
		 return memberdao.memberUpdate(member);
	}
    
    // 회원 탈퇴
    public void memberDelete(Member member) throws Exception{
		  memberdao.memberDelete(member);
	}	
}
