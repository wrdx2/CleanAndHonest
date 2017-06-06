package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * Shenpi entity. @author MyEclipse Persistence Tools
 */

public class Shenpi implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer sno;
	private String sname;
	private String sdep;
	private String semail;
	private Integer stel;
	private String saddress;
	private String stitle;
	private String scontent;
	private Timestamp stime;
	private String sattach;
	private Integer sstate;
	private String spass;

	// Constructors

	/** default constructor */
	public Shenpi() {
	}

	/** minimal constructor */
	public Shenpi(String sname, String sdep, String semail, Integer stel,
			String saddress, String stitle, String scontent, Timestamp stime,
			Integer sstate, String spass) {
		this.sname = sname;
		this.sdep = sdep;
		this.semail = semail;
		this.stel = stel;
		this.saddress = saddress;
		this.stitle = stitle;
		this.scontent = scontent;
		this.stime = stime;
		this.sstate = sstate;
		this.spass = spass;
	}

	/** full constructor */
	public Shenpi(String sname, String sdep, String semail, Integer stel,
			String saddress, String stitle, String scontent, Timestamp stime,
			String sattach, Integer sstate, String spass) {
		this.sname = sname;
		this.sdep = sdep;
		this.semail = semail;
		this.stel = stel;
		this.saddress = saddress;
		this.stitle = stitle;
		this.scontent = scontent;
		this.stime = stime;
		this.sattach = sattach;
		this.sstate = sstate;
		this.spass = spass;
	}

	// Property accessors

	public Integer getSno() {
		return this.sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSdep() {
		return this.sdep;
	}

	public void setSdep(String sdep) {
		this.sdep = sdep;
	}

	public String getSemail() {
		return this.semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	public Integer getStel() {
		return this.stel;
	}

	public void setStel(Integer stel) {
		this.stel = stel;
	}

	public String getSaddress() {
		return this.saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public String getStitle() {
		return this.stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getScontent() {
		return this.scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public Timestamp getStime() {
		return this.stime;
	}

	public void setStime(Timestamp stime) {
		this.stime = stime;
	}

	public String getSattach() {
		return this.sattach;
	}

	public void setSattach(String sattach) {
		this.sattach = sattach;
	}

	public Integer getSstate() {
		return this.sstate;
	}

	public void setSstate(Integer sstate) {
		this.sstate = sstate;
	}

	public String getSpass() {
		return this.spass;
	}

	public void setSpass(String spass) {
		this.spass = spass;
	}

}