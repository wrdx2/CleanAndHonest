package com.cleanAndHonest.orm;

/**
 * Deparment entity. @author MyEclipse Persistence Tools
 */

public class Deparment implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 821043241967008005L;
	private Integer id;
	private String unit;
	private String depar;
	private String website;
	private String banner;
	private String overview;
	private String duty;
	private String orgin;
	private String division;
	private String tel;

	// Constructors

	/** default constructor */
	public Deparment() {
	}

	/** minimal constructor */
	public Deparment(String unit, String depar) {
		this.unit = unit;
		this.depar = depar;
	}

	/** full constructor */
	public Deparment(String unit, String depar, String website, String banner,
			String overview, String duty, String orgin, String division,
			String tel) {
		this.unit = unit;
		this.depar = depar;
		this.website = website;
		this.banner = banner;
		this.overview = overview;
		this.duty = duty;
		this.orgin = orgin;
		this.division = division;
		this.tel = tel;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDepar() {
		return this.depar;
	}

	public void setDepar(String depar) {
		this.depar = depar;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getBanner() {
		return this.banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getOverview() {
		return this.overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getOrgin() {
		return this.orgin;
	}

	public void setOrgin(String orgin) {
		this.orgin = orgin;
	}

	public String getDivision() {
		return this.division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}