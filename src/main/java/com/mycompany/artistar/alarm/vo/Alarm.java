package com.mycompany.artistar.alarm.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Alarm {
	private int artist_num;
	private int artinfo_num;
	private String user_id;
	private int alarm_status;
	private String alarm_From_Id;
	private Date alarm_date;
	private int alarm_kind;
	public Alarm() {
		super();
	}
	public Alarm(int artist_num, int artinfo_num, String user_id, int alarm_status, String alarm_From_Id,
			Date alarm_date, int alarm_kind) {
		super();
		this.artist_num = artist_num;
		this.artinfo_num = artinfo_num;
		this.user_id = user_id;
		this.alarm_status = alarm_status;
		this.alarm_From_Id = alarm_From_Id;
		this.alarm_date = alarm_date;
		this.alarm_kind = alarm_kind;
	}
	@Override
	public String toString() {
		return "Alarm [artist_num=" + artist_num + ", artinfo_num=" + artinfo_num + ", user_id=" + user_id
				+ ", alarm_status=" + alarm_status + ", alarm_From_Id=" + alarm_From_Id + ", alarm_date=" + alarm_date
				+ ", alarm_kind=" + alarm_kind + "]";
	}
	public int getArtist_num() {
		return artist_num;
	}
	public void setArtist_num(int artist_num) {
		this.artist_num = artist_num;
	}
	public int getArtinfo_num() {
		return artinfo_num;
	}
	public void setArtinfo_num(int artinfo_num) {
		this.artinfo_num = artinfo_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getAlarm_status() {
		return alarm_status;
	}
	public void setAlarm_status(int alarm_status) {
		this.alarm_status = alarm_status;
	}
	public String getAlarm_From_Id() {
		return alarm_From_Id;
	}
	public void setAlarm_From_Id(String alarm_From_Id) {
		this.alarm_From_Id = alarm_From_Id;
	}
	public Date getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(Date alarm_date) {
		this.alarm_date = alarm_date;
	}
	public int getAlarm_kind() {
		return alarm_kind;
	}
	public void setAlarm_kind(int alarm_kind) {
		this.alarm_kind = alarm_kind;
	}
	
	
}
