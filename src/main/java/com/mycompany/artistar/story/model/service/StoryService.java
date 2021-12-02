package com.mycompany.artistar.story.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.story.model.vo.Story;
import com.mycompany.artistar.story_inquire.vo.StoryInquire;

public interface StoryService {
	public List<Story> getStoryList(Story vo) throws Exception; //조회
	
	public List<Story> getStoryMainList(/* String userId */) throws Exception; //조회
	
	public List<Story> getStoryDetail(int story_num) throws Exception; //조회
	
	public List<Story> getStoryIdList() throws Exception; //스토리 아이디 중복 가져오기
	
//	void insertStory(Story b); //스토리 등록
	
	void insertStory(String time1, MultipartFile report, String id);
	
	public void deleteStory(int sno) ;

	//void insertStoryInquire(StoryInquire vo1);

	int insertStoryInquire(String id, int story_num);

	List<StoryInquire> getStoryInquireList(int story_num) throws Exception;
	
//	void insertStory(String time1, MultipartFile report, String id);
}
