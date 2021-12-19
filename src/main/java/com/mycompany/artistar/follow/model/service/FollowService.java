package com.mycompany.artistar.follow.model.service;

import java.util.List;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.member.model.vo.Member;

public interface FollowService {
	// 팔로잉
	void doFollow(Follow vo) throws Exception;
	// 언팔로우
	void unFollow(Follow vo) throws Exception;
	// 추천 팔로우
	List<Member> getRecommendFollow(String id) throws Exception;
	// 팔로잉 중 목록
	List<String> getFollow(String id) throws Exception;
	// 팔로우 체크
	int checkFollow(Follow vo) throws Exception;
}
