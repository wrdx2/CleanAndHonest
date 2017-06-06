package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * Consult entity. @author MyEclipse Persistence Tools
 */

public class Consult implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cno;
	private String ctype;
	private String cname;
	private String cemail;
	private Integer ctel;
	private String caddress;
	private String ctitle;
	private String ccontent;
	private Timestamp ctime;
	private String cattach;
	private Integer creply;
	private String cpass;

	// Constructors

	/** default constructor */
	public Consult() {
	}

	/** minimal constructor */
	public Consult(String ctype, String cname, String cemail, Integer ctel,
			String caddress, String ctitle, String ccontent, Timestamp ctime,
			Integer creply, String cpass) {
		this.ctype = ctype;
		this.cname = cname;
		this.cemail = cemail;
		this.ctel = ctel;
		this.caddress = caddress;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.creply = creply;
		this.cpass = cpass;
	}

	/** full constructor */
	public Consult(String ctype, String cname, String cemail, Integer ctel,
			String caddress, String ctitle, String ccontent, Timestamp ctime,
			String cattach, Integer creply, String cpass) {
		this.ctype = ctype;
		this.cname = cname;
		this.cemail = cemail;
		this.ctel = ctel;
		this.caddress = caddress;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.cattach = cattach;
		this.creply = creply;
		this.cpass = cpass;
	}

	// Property accessors

	public Integer getCno() {
		return this.cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public String getCtype() {
		return this.ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCemail() {
		return this.cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	public Integer getCtel() {
		return this.ctel;
	}

	public void setCtel(Integer ctel) {
		this.ctel = ctel;
	}

	public String getCaddress() {
		return this.caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}

	public String getCtitle() {
		return this.ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return this.ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Timestamp getCtime() {
		return this.ctime;
	}

	public void setCtime(Timestamp ctime) {
		this.ctime = ctime;
	}

	public String getCattach() {
		return this.cattach;
	}

	public void setCattach(String cattach) {
		this.cattach = cattach;
	}

	public Integer getCreply() {
		return this.creply;
	}

	public void setCreply(Integer creply) {
		this.creply = creply;
	}

	public String getCpass() {
		return this.cpass;
	}

	public void setCpass(String cpass) {
		this.cpass = cpass;
	}

}