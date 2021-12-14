package com.mycompany.artistar.dm.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Dm {
	private int dm_num;
	private int dm_room;
	private String dm_chat;
	private String dm_date;
	private String id;
	private int dm_check;
	private String dm_target_id;
	

	public Dm() {
	}


	public Dm(int dm_num, int dm_room, String dm_chat, String dm_date, String id, int dm_check, String dm_target_id) {
		super();
		this.dm_num = dm_num;
		this.dm_room = dm_room;
		this.dm_chat = dm_chat;
		this.dm_date = dm_date;
		this.id = id;
		this.dm_check = dm_check;
		this.dm_target_id = dm_target_id;
	}


	@Override
	public String toString() {
		return "Dm [dm_num=" + dm_num + ", dm_room=" + dm_room + ", dm_chat=" + dm_chat + ", dm_date=" + dm_date
				+ ", id=" + id + ", dm_check=" + dm_check + ", dm_target_id=" + dm_target_id + "]";
	}


	public int getDm_num() {
		return dm_num;
	}


	public void setDm_num(int dm_num) {
		this.dm_num = dm_num;
	}


	public int getDm_room() {
		return dm_room;
	}


	public void setDm_room(int dm_room) {
		this.dm_room = dm_room;
	}


	public String getDm_chat() {
		return dm_chat;
	}


	public void setDm_chat(String dm_chat) {
		this.dm_chat = dm_chat;
	}


	public String getDm_date() {
		return dm_date;
	}


	public void setDm_date(String dm_date) {
		this.dm_date = dm_date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getDm_check() {
		return dm_check;
	}


	public void setDm_check(int dm_check) {
		this.dm_check = dm_check;
	}


	public String getDm_target_id() {
		return dm_target_id;
	}


	public void setDm_target_id(String dm_target_id) {
		this.dm_target_id = dm_target_id;
	}

	

}
