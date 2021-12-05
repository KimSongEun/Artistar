package com.mycompany.artistar.story.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.artistar.story.model.vo.Story;
import com.mycompany.artistar.story_inquire.vo.StoryInquire;

@Repository("storyDao")
public class StroyDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Story> getStoryList(Story vo) throws Exception { //자신스토리 리스트
		return sqlSession.selectList("StoryNS.storylist",vo);	
		//return sqlSession.selectList("StoryNS.storyviewer");
	}
	
	public List<Story> getStoryMainList(/* String userId */) throws Exception { //메인스토리 리스트	
		return sqlSession.selectList("StoryNS.storyviewer"/*,userId*/);
	}
	
	public List<Story> getStoryIdList() throws Exception { //메인스토리 리스트	
		return sqlSession.selectList("StoryNS.storyOverlap");
	}
	
	public List<StoryInquire> getStoryInquireList(int story_num) throws Exception {
		//return sqlSession.selectList("StoryNS.storylist");	
		//System.out.println("DAO 스토리 조회 인원 조회 :: " + story_num);
		return sqlSession.selectList("StoryInquireNS.selectInquire",story_num);
	}
	

	public List<Story> getStoryid() throws Exception {
		return sqlSession.selectList("StoryNS.storylist");
//		return sqlSession.selectList("StoryNS.storylistmain");
	}
	public List<Story> getStorydetail(/* int story_num */String id, int startRnum, int endRnum) throws Exception {
		System.out.println("Dao story_num 값 : " + id);
		Map<String, String> myMap = new HashMap<String, String>();
		String start = Integer.toString(startRnum);
		String end = Integer.toString(endRnum);
		myMap.put("id", id);
		myMap.put("start", start);
		myMap.put("end", end);
		
		return sqlSession.selectList("StoryNS.storydetail",myMap);
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
	
	public int insertStoryInquire(StoryInquire Si) { //스토리 조회한 사람 확인
		System.out.println(Si+"----DAO에서의 sno값??");
		return sqlSession.insert("StoryInquireNS.insertInquire", Si);
	}

	public int getStoryCount(String id) {
		System.out.println(id+"----DAO에서의 id값??");
		return sqlSession.selectOne("StoryNS.storycount",id);
	}

}
