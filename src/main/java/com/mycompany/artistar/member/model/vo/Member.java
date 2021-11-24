package com.mycompany.artistar.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private String id;
	private String pw;
	private String uname;
	private String nickname;
	private String intro;
	private char gender;
	private String email;
	private String phone;
	private String address;
	private String join_date;
	private char kind;
	private String member_img;
	
	
	public Member() {}


	public Member(String id, String pw, String uname, String nickname, String intro, char gender, String email,
			String phone, String address, String join_date, char kind, String member_img) {
		super();
		this.id = id;
		this.pw = pw;
		this.uname = uname;
		this.nickname = nickname;
		this.intro = intro;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.join_date = join_date;
		this.kind = kind;
		this.member_img = member_img;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", uname=" + uname + ", nickname=" + nickname + ", intro=" + intro
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", join_date=" + join_date + ", kind=" + kind + ", member_img=" + member_img + "]";
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}


	public char getGender() {
		return gender;
	}


	public void setGender(char gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getJoin_date() {
		return join_date;
	}


	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}


	public char getKind() {
		return kind;
	}


	public void setKind(char kind) {
		this.kind = kind;
	}


	public String getMember_img() {
		return member_img;
	}


	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	
	
}
