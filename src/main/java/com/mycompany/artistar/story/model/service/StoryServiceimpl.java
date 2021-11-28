package com.mycompany.artistar.story.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.artistar.story.model.dao.StroyDao;
import com.mycompany.artistar.story.model.vo.Story;


@Service("storyService")
public class StoryServiceimpl implements StoryService{
	@Autowired
	private StroyDao storyDao;
	
	@Override
	public List<Story> getStoryList(Story vo) throws Exception{
		List<Story> volist = null;
		try {
			volist = storyDao.getStroyList();
			System.out.println("volist Value 2 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	@Override
	public List<Story> getStoryDetail(int story_num) throws Exception{
		List<Story> volist = null;
		System.out.println("ServiceImpl storynum = : " + story_num);
		try {
			volist = storyDao.getStroydetail(story_num);
			System.out.println("스토리 상세정보 조회 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	@Override 
	 public void insertStory(Story b) { 
		System.out.println("여기는 insert Serviceimpl");
		storyDao.insertStory(b); 
	 }
	
	@Override 
	 public void deleteStory(int sno) { 
		System.out.println("여기는 delete Serviceimpl");
		storyDao.deleteStory(sno) ;
	 }
}
