package com.cleanAndHonest.orm;

/**
 * Lanmu entity. @author MyEclipse Persistence Tools
 */

public class Lanmu implements java.io.Serializable {

	// Fields

	private Integer lno;
	private String ltype;
	private Integer lstate;

	// Constructors

	/** default constructor */
	public Lanmu() {
	}

	/** minimal constructor */
	public Lanmu(String ltype) {
		this.ltype = ltype;
	}

	/** full constructor */
	public Lanmu(String ltype, Integer lstate) {
		this.ltype = ltype;
		this.lstate = lstate;
	}

	// Property accessors

	public Integer getLno() {
		return this.lno;
	}

	public void setLno(Integer lno) {
		this.lno = lno;
	}

	public String getLtype() {
		return this.ltype;
	}

	public void setLtype(String ltype) {
		this.ltype = ltype;
	}

	public Integer getLstate() {
		return this.lstate;
	}

	public void setLstate(Integer lstate) {
		this.lstate = lstate;
	}

}