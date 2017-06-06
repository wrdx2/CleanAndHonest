package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.DepBiz;
import com.cleanAndHonest.orm.Deparment;

public class DepAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private DepBiz depBiz;
	private Deparment dep;
	private List<Deparment> list;

	public void setDepBiz(DepBiz depBiz) {
		this.depBiz = depBiz;
	}
	
	
	
	
	/****************************get/set函数***********************/
	public Deparment getDep() {
		return dep;
	}
	public void setDep(Deparment dep) {
		this.dep = dep;
	}
	public List<Deparment> getList() {
		return list;
	}
	public void setList(List<Deparment> list) {
		this.list = list;
	}
	

}
