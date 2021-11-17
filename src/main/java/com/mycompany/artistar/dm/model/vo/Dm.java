package com.mycompany.artistar.dm.model.vo;

public class Dm {
	private int dm_num;
	private String id;
	private String dm_target_id;
	private String dm_char;
	private String dm_date;
	
	public Dm() {}

	
	
	
	public Dm(int dm_num, String id, String dm_target_id, String dm_char, String dm_date) {
		super();
		this.dm_num = dm_num;
		this.id = id;
		this.dm_target_id = dm_target_id;
		this.dm_char = dm_char;
		this.dm_date = dm_date;
	}




	@Override
	public String toString() {
		return "Dm [dm_num=" + dm_num + ", id=" + id + ", dm_target_id=" + dm_target_id + ", dm_char=" + dm_char
				+ ", dm_date=" + dm_date + "]";
	}



	public int getDm_num() {
		return dm_num;
	}

	public void setDm_num(int dm_num) {
		this.dm_num = dm_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDm_target_id() {
		return dm_target_id;
	}

	public void setDm_target_id(String dm_target_id) {
		this.dm_target_id = dm_target_id;
	}

	public String getDm_char() {
		return dm_char;
	}

	public void setDm_char(String dm_char) {
		this.dm_char = dm_char;
	}

	public String getDm_date() {
		return dm_date;
	}

	public void setDm_date(String dm_date) {
		this.dm_date = dm_date;
	}
	
	
}
