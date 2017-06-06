package com.cleanAndHonest.orm;

import java.sql.Timestamp;

/**
 * VSrId entity. @author MyEclipse Persistence Tools
 */

public class VSr implements java.io.Serializable {

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
	private String rname;
	private String remail;
	private Integer rtel;
	private String rcontent;
	private Timestamp rtime;

	// Constructors

	/** default constructor */
	public VSr() {
	}

	/** minimal constructor */
	public VSr(Integer sno, String sname, String sdep, String semail,
			Integer stel, String saddress, String stitle, String scontent,
			Timestamp stime, String sattach, Integer sstate, String spass,
			String rname, String remail, String rcontent) {
		this.sno = sno;
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
		this.rname = rname;
		this.remail = remail;
		this.rcontent = rcontent;
	}

	/** full constructor */
	public VSr(Integer sno, String sname, String sdep, String semail,
			Integer stel, String saddress, String stitle, String scontent,
			Timestamp stime, String sattach, Integer sstate, String spass,
			String rname, String remail, Integer rtel, String rcontent,
			Timestamp rtime) {
		this.sno = sno;
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
		this.rname = rname;
		this.remail = remail;
		this.rtel = rtel;
		this.rcontent = rcontent;
		this.rtime = rtime;
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

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof VSr))
			return false;
		VSr castOther = (VSr) other;

		return ((this.getSno() == castOther.getSno()) || (this.getSno() != null
				&& castOther.getSno() != null && this.getSno().equals(
				castOther.getSno())))
				&& ((this.getSname() == castOther.getSname()) || (this
						.getSname() != null && castOther.getSname() != null && this
						.getSname().equals(castOther.getSname())))
				&& ((this.getSdep() == castOther.getSdep()) || (this.getSdep() != null
						&& castOther.getSdep() != null && this.getSdep()
						.equals(castOther.getSdep())))
				&& ((this.getSemail() == castOther.getSemail()) || (this
						.getSemail() != null && castOther.getSemail() != null && this
						.getSemail().equals(castOther.getSemail())))
				&& ((this.getStel() == castOther.getStel()) || (this.getStel() != null
						&& castOther.getStel() != null && this.getStel()
						.equals(castOther.getStel())))
				&& ((this.getSaddress() == castOther.getSaddress()) || (this
						.getSaddress() != null
						&& castOther.getSaddress() != null && this
						.getSaddress().equals(castOther.getSaddress())))
				&& ((this.getStitle() == castOther.getStitle()) || (this
						.getStitle() != null && castOther.getStitle() != null && this
						.getStitle().equals(castOther.getStitle())))
				&& ((this.getScontent() == castOther.getScontent()) || (this
						.getScontent() != null
						&& castOther.getScontent() != null && this
						.getScontent().equals(castOther.getScontent())))
				&& ((this.getStime() == castOther.getStime()) || (this
						.getStime() != null && castOther.getStime() != null && this
						.getStime().equals(castOther.getStime())))
				&& ((this.getSattach() == castOther.getSattach()) || (this
						.getSattach() != null && castOther.getSattach() != null && this
						.getSattach().equals(castOther.getSattach())))
				&& ((this.getSstate() == castOther.getSstate()) || (this
						.getSstate() != null && castOther.getSstate() != null && this
						.getSstate().equals(castOther.getSstate())))
				&& ((this.getSpass() == castOther.getSpass()) || (this
						.getSpass() != null && castOther.getSpass() != null && this
						.getSpass().equals(castOther.getSpass())))
				&& ((this.getRname() == castOther.getRname()) || (this
						.getRname() != null && castOther.getRname() != null && this
						.getRname().equals(castOther.getRname())))
				&& ((this.getRemail() == castOther.getRemail()) || (this
						.getRemail() != null && castOther.getRemail() != null && this
						.getRemail().equals(castOther.getRemail())))
				&& ((this.getRtel() == castOther.getRtel()) || (this.getRtel() != null
						&& castOther.getRtel() != null && this.getRtel()
						.equals(castOther.getRtel())))
				&& ((this.getRcontent() == castOther.getRcontent()) || (this
						.getRcontent() != null
						&& castOther.getRcontent() != null && this
						.getRcontent().equals(castOther.getRcontent())))
				&& ((this.getRtime() == castOther.getRtime()) || (this
						.getRtime() != null && castOther.getRtime() != null && this
						.getRtime().equals(castOther.getRtime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getSno() == null ? 0 : this.getSno().hashCode());
		result = 37 * result
				+ (getSname() == null ? 0 : this.getSname().hashCode());
		result = 37 * result
				+ (getSdep() == null ? 0 : this.getSdep().hashCode());
		result = 37 * result
				+ (getSemail() == null ? 0 : this.getSemail().hashCode());
		result = 37 * result
				+ (getStel() == null ? 0 : this.getStel().hashCode());
		result = 37 * result
				+ (getSaddress() == null ? 0 : this.getSaddress().hashCode());
		result = 37 * result
				+ (getStitle() == null ? 0 : this.getStitle().hashCode());
		result = 37 * result
				+ (getScontent() == null ? 0 : this.getScontent().hashCode());
		result = 37 * result
				+ (getStime() == null ? 0 : this.getStime().hashCode());
		result = 37 * result
				+ (getSattach() == null ? 0 : this.getSattach().hashCode());
		result = 37 * result
				+ (getSstate() == null ? 0 : this.getSstate().hashCode());
		result = 37 * result
				+ (getSpass() == null ? 0 : this.getSpass().hashCode());
		result = 37 * result
				+ (getRname() == null ? 0 : this.getRname().hashCode());
		result = 37 * result
				+ (getRemail() == null ? 0 : this.getRemail().hashCode());
		result = 37 * result
				+ (getRtel() == null ? 0 : this.getRtel().hashCode());
		result = 37 * result
				+ (getRcontent() == null ? 0 : this.getRcontent().hashCode());
		result = 37 * result
				+ (getRtime() == null ? 0 : this.getRtime().hashCode());
		return result;
	}

}