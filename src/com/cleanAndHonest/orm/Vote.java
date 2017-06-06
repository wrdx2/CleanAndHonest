package com.cleanAndHonest.orm;

/**
 * Vote entity. @author MyEclipse Persistence Tools
 */

public class Vote implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer vno;
	private String vname;
	private String vnode;
	private Integer vhits;
	private Integer vstate;

	// Constructors

	/** default constructor */
	public Vote() {
	}

	/** minimal constructor */
	public Vote(Integer vstate) {
		this.vstate = vstate;
	}

	/** full constructor */
	public Vote(String vname, String vnode, Integer vhits, Integer vstate) {
		this.vname = vname;
		this.vnode = vnode;
		this.vhits = vhits;
		this.vstate = vstate;
	}

	// Property accessors

	public Integer getVno() {
		return this.vno;
	}

	public void setVno(Integer vno) {
		this.vno = vno;
	}

	public String getVname() {
		return this.vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getVnode() {
		return this.vnode;
	}

	public void setVnode(String vnode) {
		this.vnode = vnode;
	}

	public Integer getVhits() {
		return this.vhits;
	}

	public void setVhits(Integer vhits) {
		this.vhits = vhits;
	}

	public Integer getVstate() {
		return this.vstate;
	}

	public void setVstate(Integer vstate) {
		this.vstate = vstate;
	}

}