package com.mycompany.artistar.follow.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.follow.model.dao.FollowDao;
import com.mycompany.artistar.member.model.vo.Member;

@Service("FollowService")
public class FollowServiceImpl implements FollowService {
	@Autowired
	private FollowDao followDao;

	// 팔로우
	@Override
	public void doFollow(Follow vo) throws Exception {
		followDao.doFollow(vo);
	}

	// 언팔로우
	@Override
	public void unFollow(Follow vo) throws Exception {
		followDao.unFollow(vo);
	}

	// 추천 팔로우 목록
	@Override
	public List<Member> getRecommendFollow(String id) throws Exception {
		return followDao.getRecommendFollow(id);
	}

	// 팔로잉 중 목록
	@Override
	public List<String> getFollow(String id) throws Exception {
		return followDao.getFollow(id);
	}

	// 팔로우 체크
	@Override
	public int checkFollow(Follow vo) throws Exception {
		return followDao.checkFollow(vo);
	}
}
