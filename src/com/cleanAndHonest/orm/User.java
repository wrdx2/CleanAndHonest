package com.cleanAndHonest.orm;

import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3238293073451225129L;
	private Integer id;
	private String uno;
	private String uname;
	private String usex;
	private Date ubirthday;
	private String tipProblem;
	private String answer;
	private String upassword;
	private Integer utel;
	private String office;
	private String email;
	private String synopsis;
	private Integer authority;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String uno, String uname, String upassword, String office) {
		this.uno = uno;
		this.uname = uname;
		this.upassword = upassword;
		this.office = office;
	}

	/** full constructor */
	public User(String uno, String uname, String usex, Date ubirthday,
			String tipProblem, String answer, String upassword, Integer utel,
			String office, String email, String synopsis, Integer authority) {
		this.uno = uno;
		this.uname = uname;
		this.usex = usex;
		this.ubirthday = ubirthday;
		this.tipProblem = tipProblem;
		this.answer = answer;
		this.upassword = upassword;
		this.utel = utel;
		this.office = office;
		this.email = email;
		this.synopsis = synopsis;
		this.authority = authority;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUno() {
		return this.uno;
	}

	public void setUno(String uno) {
		this.uno = uno;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsex() {
		return this.usex;
	}

	public void setUsex(String usex) {
		this.usex = usex;
	}

	public Date getUbirthday() {
		return this.ubirthday;
	}

	public void setUbirthday(Date ubirthday) {
		this.ubirthday = ubirthday;
	}

	public String getTipProblem() {
		return this.tipProblem;
	}

	public void setTipProblem(String tipProblem) {
		this.tipProblem = tipProblem;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getUpassword() {
		return this.upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}

	public Integer getUtel() {
		return this.utel;
	}

	public void setUtel(Integer utel) {
		this.utel = utel;
	}

	public String getOffice() {
		return this.office;
	}

	public void setOffice(String office) {
		this.office = office;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSynopsis() {
		return this.synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public Integer getAuthority() {
		return this.authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

}