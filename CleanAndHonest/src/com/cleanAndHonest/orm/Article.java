package com.cleanAndHonest.orm;

import java.util.Date;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer ano;
	private String aname;
	private String atype;
	private String aaddress;
	private String atitle;
	private String aattach;
	private String acontent;
	private Date atime;

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** minimal constructor */
	public Article(String atype, String atitle) {
		this.atype = atype;
		this.atitle = atitle;
	}

	/** full constructor */
	public Article(String aname, String atype, String aaddress, String atitle,
			String aattach, String acontent, Date atime) {
		this.aname = aname;
		this.atype = atype;
		this.aaddress = aaddress;
		this.atitle = atitle;
		this.aattach = aattach;
		this.acontent = acontent;
		this.atime = atime;
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

	public Date getAtime() {
		return this.atime;
	}

	public void setAtime(Date atime) {
		this.atime = atime;
	}

}