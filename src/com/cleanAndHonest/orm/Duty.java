package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * Duty entity. @author MyEclipse Persistence Tools
 */

public class Duty implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer dno;
	private String dname;
	private String ddep;
	private Integer dstate;
	private Timestamp dstarTime;
	private Timestamp dendTime;

	// Constructors

	/** default constructor */
	public Duty() {
	}

	/** minimal constructor */
	public Duty(Integer dstate) {
		this.dstate = dstate;
	}

	/** full constructor */
	public Duty(String dname, String ddep, Integer dstate, Timestamp dstarTime,
			Timestamp dendTime) {
		this.dname = dname;
		this.ddep = ddep;
		this.dstate = dstate;
		this.dstarTime = dstarTime;
		this.dendTime = dendTime;
	}

	// Property accessors

	public Integer getDno() {
		return this.dno;
	}

	public void setDno(Integer dno) {
		this.dno = dno;
	}

	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDdep() {
		return this.ddep;
	}

	public void setDdep(String ddep) {
		this.ddep = ddep;
	}

	public Integer getDstate() {
		return this.dstate;
	}

	public void setDstate(Integer dstate) {
		this.dstate = dstate;
	}

	public Timestamp getDstarTime() {
		return this.dstarTime;
	}

	public void setDstarTime(Timestamp dstarTime) {
		this.dstarTime = dstarTime;
	}

	public Timestamp getDendTime() {
		return this.dendTime;
	}

	public void setDendTime(Timestamp dendTime) {
		this.dendTime = dendTime;
	}

}