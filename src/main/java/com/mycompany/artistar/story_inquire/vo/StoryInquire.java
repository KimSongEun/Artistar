package com.mycompany.artistar.story_inquire.vo;

public class StoryInquire {
	private int post_inquire_num;
	private int story_num;
	private String id;
	
	public StoryInquire() {}

	public StoryInquire(int post_inquire_num, int story_num, String id) {
		super();
		this.post_inquire_num = post_inquire_num;
		this.story_num = story_num;
		this.id = id;
	}

	@Override
	public String toString() {
		return "StroyInquire [post_inquire_num=" + post_inquire_num + ", story_num=" + story_num + ", id=" + id + "]";
	}

	public int getPost_inquire_num() {
		return post_inquire_num;
	}

	public void setPost_inquire_num(int post_inquire_num) {
		this.post_inquire_num = post_inquire_num;
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
	
	
	
}
