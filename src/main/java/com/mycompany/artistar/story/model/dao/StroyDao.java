package com.mycompany.artistar.story.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.story.model.vo.Story;

@Repository("storyDao")
public class StroyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Story> getStroyList() throws Exception {
		return sqlSession.selectList("StoryNS.storylist");
	}
	
	public List<Story> getStroyid() throws Exception {
		return sqlSession.selectList("StoryNS.storylist");
//		return sqlSession.selectList("StoryNS.storylistmain");
	}
}
