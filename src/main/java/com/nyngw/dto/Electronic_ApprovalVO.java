package com.nyngw.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 전자결재
 * @author pc09
 *
 */
public class Electronic_ApprovalVO {
	private String ea_number;		//전자결재번호
	private String ea_title;		//제목
	private String ea_content;		//내용
	private Date ea_startdate;		//시행일,기안일
	private Date ea_enddate;		//마감일
	private String ea_doc_number;	//문서번호
	private String ea_mem_number;	//시행자
	private Date ea_writedate;		//기안일
	private Date ea_ah_time; //결재이력 날짜..
	private String common_name;// 문서이름을 저장하는 변수
	private String write_name; //기안자이름
	
	public String getWrite_name() {
		return write_name;
	}
	public void setWrite_name(String write_name) {
		this.write_name = write_name;
	}
	public String getCommon_name() {
		return common_name;
	}
	public void setCommon_name(String common_name) {
		this.common_name = common_name;
	}
	public Date getEa_ah_time() {
		return ea_ah_time;
	}
	public void setEa_ah_time(Date ea_ah_time) {
		this.ea_ah_time = ea_ah_time;
	}
	public String getEa_writedate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(ea_writedate);
		return to;
	}
	public void setEa_writedate(Date ea_writedate) {
		this.ea_writedate = ea_writedate;
	}
	public String getEa_number() {
		return ea_number;
	}
	public void setEa_number(String ea_number) {
		this.ea_number = ea_number;
	}
	public String getEa_title() {
		return ea_title;
	}
	public void setEa_title(String ea_title) {
		this.ea_title = ea_title;
	}
	public String getEa_content() {
		return ea_content;
	}
	public void setEa_content(String ea_content) {
		this.ea_content = ea_content;
	}
	public String getEa_startdate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(ea_startdate);
		return to;
	}
	public void setEa_startdate(Date ea_startdate) {
		this.ea_startdate = ea_startdate;
	}
	public String getEa_enddate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(ea_enddate);
		return to;
	}
	public void setEa_enddate(Date ea_enddate) {
		this.ea_enddate = ea_enddate;
	}
	public String getEa_doc_number() {
		return ea_doc_number;
	}
	public void setEa_doc_number(String ea_doc_number) {
		this.ea_doc_number = ea_doc_number;
	}
	public String getEa_mem_number() {
		return ea_mem_number;
	}
	public void setEa_mem_number(String ea_mem_number) {
		this.ea_mem_number = ea_mem_number;
	}
	@Override
	public String toString() {
		return "Electronic_ApprovalVO [ea_number=" + ea_number + ", ea_title="
				+ ea_title + ", ea_content=" + ea_content + ", ea_startdate="
				+ ea_startdate + ", ea_enddate=" + ea_enddate
				+ ", ea_doc_number=" + ea_doc_number + ", ea_mem_number="
				+ ea_mem_number + ", ea_writedate=" + ea_writedate
				+ ", ea_ah_time=" + ea_ah_time + "]";
	}
	
}
