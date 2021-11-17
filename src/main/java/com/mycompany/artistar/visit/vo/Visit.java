package com.mycompany.artistar.visit.vo;

public class Visit {
	private String id;
	private int visit_count;
	private int visit_date;
	
	public Visit() {}

	public Visit(String id, int visit_count, int visit_date) {
		super();
		this.id = id;
		this.visit_count = visit_count;
		this.visit_date = visit_date;
	}

	@Override
	public String toString() {
		return "Visit [id=" + id + ", visit_count=" + visit_count + ", visit_date=" + visit_date + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getVisit_count() {
		return visit_count;
	}

	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}

	public int getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(int visit_date) {
		this.visit_date = visit_date;
	}
	
	
}
