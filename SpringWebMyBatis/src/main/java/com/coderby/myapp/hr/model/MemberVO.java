package com.coderby.myapp.hr.model;

public class MemberVO {
	private int seq_id;
	private String mem_id=null;
	private String mem_pw=null;
	private String mem_name=null;
	
	public int getSeq_id() {
		return seq_id;
	}
	public void setSeq_id(int seq_id) {
		this.seq_id = seq_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	@Override
	public String toString() {
		return "MemberVO [seq_id=" + seq_id + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ "]";
	}
	
	
	

}
