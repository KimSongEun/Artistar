package com.mycompany.artistar.artist_contributor.vo;

import com.mycompany.artistar.member.model.vo.Member;

public class ArtistContributor {
	private int artist_num;
	private String id;
	private int contributor_count;
	private Member member;
	
	public ArtistContributor() {}

	public ArtistContributor(int artist_num, String id, int contributor_count, Member member) {
		super();
		this.artist_num = artist_num;
		this.id = id;
		this.contributor_count = contributor_count;
		this.member = member;
	}

	@Override
	public String toString() {
		return "ArtistContributor [artist_num=" + artist_num + ", id=" + id
				+ ", contributor_count=" + contributor_count + ", member=" + member + "]";
	}

	public int getArtist_num() {
		return artist_num;
	}

	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public int getContributor_count() {
		return contributor_count;
	}

	public void setContributor_count(int contributor_count) {
		this.contributor_count = contributor_count;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	
}
