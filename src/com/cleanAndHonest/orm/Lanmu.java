package com.cleanAndHonest.orm;

/**
 * Lanmu entity. @author MyEclipse Persistence Tools
 */

public class Lanmu implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer lno;
	private String ltype;
	private String ltype2;
	private String ltype3;
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
	public Lanmu(String ltype, String ltype2, String ltype3, Integer lstate) {
		this.ltype = ltype;
		this.ltype2 = ltype2;
		this.ltype3 = ltype3;
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

	public String getLtype2() {
		return this.ltype2;
	}

	public void setLtype2(String ltype2) {
		this.ltype2 = ltype2;
	}

	public String getLtype3() {
		return this.ltype3;
	}

	public void setLtype3(String ltype3) {
		this.ltype3 = ltype3;
	}

	public Integer getLstate() {
		return this.lstate;
	}

	public void setLstate(Integer lstate) {
		this.lstate = lstate;
	}

}