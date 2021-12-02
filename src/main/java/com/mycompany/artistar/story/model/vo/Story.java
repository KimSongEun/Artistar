package com.mycompany.artistar.story.model.vo;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.member.model.vo.Member;

@Component
public class Story {
   private int story_num;
   private String id;
   private String story_img;
   private String story_date;
   private Member member;

   public Story() {
   }

public Story(int story_num, String id, String story_img, String story_date, Member member) {
	super();
	this.story_num = story_num;
	this.id = id;
	this.story_img = story_img;
	this.story_date = story_date;
	this.member = member;
}

@Override
public String toString() {
	return "Story [story_num=" + story_num + ", id=" + id + ", story_img=" + story_img + ", story_date=" + story_date
			+ ", member=" + member + "]";
}

public int getStory_num() {
	return story_num;
}

public void setStory_num(int story_num) {
	this.story_num = story_num;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getStory_img() {
	return story_img;
}

public void setStory_img(String story_img) {
	this.story_img = story_img;
}

public String getStory_date() {
	return story_date;
}

public void setStory_date(String story_date) {
	this.story_date = story_date;
}

public Member getMember() {
	return member;
}

public void setMember(Member member) {
	this.member = member;
}

   
   

}