package com.mycompany.artistar.story.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycompany.artistar.story.model.vo.Story;

public interface StoryService {
	public List<Story> getStoryList(Story vo) throws Exception; //조회
	
	public List<Story> getStoryDetail(int story_num) throws Exception; //조회
	
//	void insertStory(Story b); //스토리 등록
	
	void insertStory(String time1, MultipartFile report, String id);
	
	public void deleteStory(int sno) ;
	
}
