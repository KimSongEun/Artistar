package com.mycompany.artistar.member.model.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.artistar.member.model.dao.MemberDao;
import com.mycompany.artistar.member.model.service.MemberService;
import com.mycompany.artistar.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberdao;

	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));
	
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
    @Override
    public int pwChange(Member member) throws Exception{		
		 return memberdao.pwChange(member);		
	}
    
    // 회원정보 수정
    @Override
    public int memberUpdate(Member member) throws Exception{
		 return memberdao.memberUpdate(member);
	}
    
    // 회원 탈퇴
    @Override
    public void memberDelete(Member member) throws Exception{
		  memberdao.memberDelete(member);
	}	
    
    // 비밀번호 찾기 회원정보 조회
    @Override
 	public Member pwSelectMember(Member member) throws Exception{
 		 return memberdao.pwSelectMember(member);	
 	}
 	
    // 비밀번호 찾기 비밀번호 업데이트
    @Override
 	public int pwFindUpdate(Member member) throws Exception{
 		return memberdao.pwFindUpdate(member);
 	}
    
	// 회원 프로필사진 수정
	@Override
	public void memberProfileUpdate(MultipartFile report, String id) {
		String urlPhoto = null;
		Map uploadResult = null;

		if (!report.isEmpty()) {
			try {
				File f = Files.createTempFile("temp", report.getOriginalFilename()).toFile();
				report.transferTo(f);

				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
			} catch (IOException e) {
				System.out.println("error with upload photo to cloudinary");
			}
		}

		Member member = new Member();
		member.setId(id);
		member.setMember_img(urlPhoto);

		try {
			memberdao.memberProfileUpdate(member);
		} catch (Exception e) {
			System.out.println("Error saveOrUpdate in AdService: " + e);
		}
	}
	
	// 프로필 사진 가져오기
	public List<Member> getMemberProfile(Member vo) throws Exception {
		List<Member> volist = null;
		try {
			volist = memberdao.getMemberProfile(vo);
			System.out.println("volist: " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	// 회원 프로필사진 삭제
	@Override
	public void memberProfileDelete(MultipartFile report, String id) {
		String urlPhoto = null;
		Map uploadResult = null;

		if (!report.isEmpty()) {
			try {
				File f = Files.createTempFile("temp", report.getOriginalFilename()).toFile();
				report.transferTo(f);

				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
			} catch (IOException e) {
				System.out.println("error with upload photo to cloudinary");
			}
		}
		Member member = new Member();
		member.setId(id);
		member.setMember_img(urlPhoto);

		try {
			memberdao.memberProfileDelete(member);
		} catch (Exception e) {
			System.out.println("Error saveOrUpdate in AdService: " + e);
		}
	}
	
	// 포스트 개수
	@Override
	public int myPostCount(String id) {
		int myPostCount = 0;
		try {
			myPostCount = memberdao.myPostCount(id);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return myPostCount;
	}
}
