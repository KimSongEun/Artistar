package com.mycompany.artistar.story.model.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mycompany.artistar.story.model.dao.StroyDao;
import com.mycompany.artistar.story.model.vo.Story;
import com.mycompany.artistar.story_inquire.vo.StoryInquire;


@Service("storyService")
public class StoryServiceimpl implements StoryService{
	@Autowired
	private StroyDao storyDao;
	
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "dcxu8acr5",
            "api_key", "871828519422828",
            "api_secret", "HLamwy59EVVxgcBr7jG2QfYByVs"));
	
	@Override
	public List<Story> getStoryList(Story vo) throws Exception{
		List<Story> volist = null;
		try {
			volist = storyDao.getStoryList(vo);
			System.out.println("volist Value 2 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	public List<Story> getStoryIdList() throws Exception{
		List<Story> volist = null;
		try {
			volist = storyDao.getStoryIdList();
			System.out.println("volist Value 2 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	@Override
	public List<Story> getStoryMainList(/* String userId */) throws Exception{
		List<Story> volist = null;
		try {
//			System.out.println("DAO userID 값임니다. -----12-02 "+ userId );
			volist = storyDao.getStoryMainList(/* userId */);
			System.out.println("volist Value 2 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	@Override
	public List<StoryInquire> getStoryInquireList(int story_num) throws Exception{
		List<StoryInquire> volist = null;
		System.out.println("ServiceImpl storynum11 = : " + story_num);
		try {
			volist = storyDao.getStoryInquireList(story_num);
			System.out.println("스토리 상세 정보 조회 아이디 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	
	
	@Override
	public List<Story> getStoryDetail(/* int story_num */String id, int startRnum, int endRnum) throws Exception{
		List<Story> volist = null;
		System.out.println("ServiceImpl ididid = : " + id);
		try {
			volist = storyDao.getStorydetail(id,startRnum, endRnum);
			System.out.println("스토리 상세정보 조회 : " + volist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return volist;
	}
	@Override
	public int insertStoryInquire(String id, int story_num) {
		StoryInquire Si = new StoryInquire();
		System.out.println("serviceimpl id, num check : " + id + " / " + story_num);
		Si.setId(id);
		Si.setStory_num(story_num);
		int result=0;
		try {
			result = storyDao.insertStoryInquire(Si);
		} catch (Exception e) {
			System.out.println("Error saveOrUpdate in AdService: " + e);
		}
		return result;
	}
	@Override 
	 public void insertStory(String time1, MultipartFile report, String id) { 
		String urlPhoto = null;
        Map uploadResult = null;
        
		if(!report.isEmpty()) {
			try {
				File f = Files.createTempFile("temp",report.getOriginalFilename()).toFile();
				report.transferTo(f);
				
				uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
				urlPhoto = (String) uploadResult.get("url");
			} catch (IOException e) {
				System.out.println("error with upload photo to cloudinary");
			}
		}
		System.out.println("여기는 insert Serviceimpl");
		Story b = new Story();
		b.setId(id);
		b.setStory_img(urlPhoto);
		b.setStory_date(time1);
		try {
			storyDao.insertStory(b); 

        } catch (Exception e) {
           System.out.println("Error saveOrUpdate in AdService: " + e);
        }
		
	 }
	
	
	@Override 
	 public void deleteStory(int sno) { 
		System.out.println("여기는 delete Serviceimpl");
		storyDao.deleteStory(sno) ;
	 }
	
	@Override 
	public int getStoryCount(String id) {
		int storyCount=0;
		System.out.println("아이디 불러올 떄 아이디 : " + id);
		try {
			storyCount=storyDao.getStoryCount(id);
			System.out.println("serviceImpl 스토리 갯수 불러오는 값"+storyCount);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return storyCount;
	}
	@Override 
	 public void updateStory() { 
		System.out.println("여기는 update Serviceimpl");
		storyDao.updateStory() ;
	 }
}
