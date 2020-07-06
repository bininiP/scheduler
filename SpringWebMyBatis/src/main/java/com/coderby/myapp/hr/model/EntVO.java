package com.coderby.myapp.hr.model;

import java.sql.Date;

public class EntVO {
	
	private int seq_id;
	private int ent_id;
	private String ent_name=null;
	private Date paper_end = null;
	private Date interview1 = null;
	private Date interview2 = null;
	private Date interview3 = null;
	public int getEnt_id() {
		return ent_id;
	}

	
	public int getSeq_id() {
		return seq_id;
	}


	public void setSeq_id(int seq_id) {
		this.seq_id = seq_id;
	}


	public void setEnt_id(int ent_id) {
		this.ent_id = ent_id;
	}

	public String getEnt_name() {
		return ent_name;
	}

	public void setEnt_name(String ent_name) {
		this.ent_name = ent_name;
	}

	public Date getPaper_end() {
		return paper_end;
	}

	public void setPaper_end(Date paper_end) {
		this.paper_end = paper_end;
	}

	public Date getInterview1() {
		return interview1;
	}

	public void setInterview1(Date interview1) {
		this.interview1 = interview1;
	}

	public Date getInterview2() {
		return interview2;
	}

	public void setInterview2(Date interview2) {
		this.interview2 = interview2;
	}

	public Date getInterview3() {
		return interview3;
	}

	public void setInterview3(Date interview3) {
		this.interview3 = interview3;
	}

	
	@Override
	public String toString() {
		return "기업명: " + ent_name
				+"\n서류마감일: " + paper_end +
				"\n 1차면접일: "+interview1 +
				"\n 2차면접일: "+interview2 +
				"\n 3차면접일: "+interview3+
				"\n seq_id: "+seq_id;
	}
}