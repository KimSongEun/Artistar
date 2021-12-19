package com.mycompany.artistar.follow.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.follow.vo.Follow;
import com.mycompany.artistar.follower.model.dao.FollowDao;
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
		// 이미 팔로잉 한 사람과 본인 포함한 목록
		List<Member> recIdList = new ArrayList<Member>();
		recIdList = followDao.getRecommendFollow();
		
		// 세션에서 받아 올 id
		Follow vo = new Follow();
		vo.setId(id);
		
		// 추천 목록에서 이름 받아오기...
		// 세션 id랑 비교해서 팔로우 여부 알 수 있음
		for(Member recId : recIdList) {
			String followId = recId.getId();
			vo.setFollowId(followId);
			int result = followDao.checkFollow(vo);
			
			if(result > 0) {
				// 만약 팔로우 한 사실을 알았으면 리스트에서 어떻게 빼지..?
			}
		}
		return null;
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
