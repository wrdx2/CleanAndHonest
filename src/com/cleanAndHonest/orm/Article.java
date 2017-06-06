package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer ano;
	private String aname;
	private String atype;
	private String aaddress;
	private String atitle;
	private String aattach;
	private String acontent;
	private Timestamp atime;
	private Integer ahits;
	private String adep;

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** minimal constructor */
	public Article(String atype, String atitle, Integer ahits) {
		this.atype = atype;
		this.atitle = atitle;
		this.ahits = ahits;
	}

	/** full constructor */
	public Article(String aname, String atype, String aaddress, String atitle,
			String aattach, String acontent, Timestamp atime, Integer ahits,
			String adep) {
		this.aname = aname;
		this.atype = atype;
		this.aaddress = aaddress;
		this.atitle = atitle;
		this.aattach = aattach;
		this.acontent = acontent;
		this.atime = atime;
		this.ahits = ahits;
		this.adep = adep;
	}

	// Property accessors

	public Integer getAno() {
		return this.ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getAname() {
		return this.aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAtype() {
		return this.atype;
	}

	public void setAtype(String atype) {
		this.atype = atype;
	}

	public String getAaddress() {
		return this.aaddress;
	}

	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}

	public String getAtitle() {
		return this.atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public String getAattach() {
		return this.aattach;
	}

	public void setAattach(String aattach) {
		this.aattach = aattach;
	}

	public String getAcontent() {
		return this.acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public Timestamp getAtime() {
		return this.atime;
	}

	public void setAtime(Timestamp atime) {
		this.atime = atime;
	}

	public Integer getAhits() {
		return this.ahits;
	}

	public void setAhits(Integer ahits) {
		this.ahits = ahits;
	}

	public String getAdep() {
		return this.adep;
	}

	public void setAdep(String adep) {
		this.adep = adep;
	}

}