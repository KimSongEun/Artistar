package com.mycompany.artistar.story.model.service;

import java.util.List;

import com.mycompany.artistar.story.model.vo.Story;

public interface StoryService {
	public List<Story> getStoryList(Story vo) throws Exception; //조회
	
	public List<Story> getStoryDetail(int story_num) throws Exception; //조회
	
	void insertStory(Story b); //스토리 등록
	
	public void deleteStory(int sno) ;
	
}
