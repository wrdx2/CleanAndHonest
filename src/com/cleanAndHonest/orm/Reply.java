package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * Reply entity. @author MyEclipse Persistence Tools
 */

public class Reply implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer rno;
	private String rname;
	private String remail;
	private Integer rtel;
	private String rcontent;
	private Timestamp rtime;

	// Constructors

	/** default constructor */
	public Reply() {
	}

	/** full constructor */
	public Reply(String rname, String remail, Integer rtel, String rcontent,
			Timestamp rtime) {
		this.rname = rname;
		this.remail = remail;
		this.rtel = rtel;
		this.rcontent = rcontent;
		this.rtime = rtime;
	}

	// Property accessors

	public Integer getRno() {
		return this.rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRemail() {
		return this.remail;
	}

	public void setRemail(String remail) {
		this.remail = remail;
	}

	public Integer getRtel() {
		return this.rtel;
	}

	public void setRtel(Integer rtel) {
		this.rtel = rtel;
	}

	public String getRcontent() {
		return this.rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Timestamp getRtime() {
		return this.rtime;
	}

	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}

}