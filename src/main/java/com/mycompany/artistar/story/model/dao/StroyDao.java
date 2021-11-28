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
	public List<Story> getStroydetail(int story_num) throws Exception {
		System.out.println("Dao story_num 값 : " + story_num);
		return sqlSession.selectList("StoryNS.storydetail",story_num);
//		return sqlSession.selectList("StoryNS.storylistmain");
	}

	public int insertStory(Story b) { // 글 입력
		System.out.println("여기는 insert DAO");
		System.out.println(b + "파일업로드!!!!");
		return sqlSession.insert("StoryNS.insertStory", b);
	}
	
	public int deleteStory(int sno) {
		System.out.println("여기는 delete DAO");
		System.out.println(sno+"----DAO에서의 sno값??");
		return sqlSession.delete("StoryNS.deleteStory",sno);
	}

}
