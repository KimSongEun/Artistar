package com.mycompany.artistar.artist_follower.vo;

import org.springframework.stereotype.Component;

import com.mycompany.artistar.member.model.vo.Member;

@Component
public class ArtistFollower {
	private int follower_num;
	private int artist_num;
	private String follower_date;
	private String id;
	private Member member;
	
	public ArtistFollower() {}

	public ArtistFollower(int follower_num, int artist_num, String follower_date, String id, Member member) {
		super();
		this.follower_num = follower_num;
		this.artist_num = artist_num;
		this.follower_date = follower_date;
		this.id = id;
		this.member = member;
	}

	@Override
	public String toString() {
		return "ArtistFollower [follower_num=" + follower_num + ", artist_num=" + artist_num + ", follower_date="
				+ follower_date + ", id=" + id + ", member=" + member + "]";
	}

	public int getFollower_num() {
		return follower_num;
	}

	public void setFollower_num(int follower_num) {
		this.follower_num = follower_num;
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getFollower_date() {
		return follower_date;
	}

	public void setFollower_date(String follower_date) {
		this.follower_date = follower_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	
}
