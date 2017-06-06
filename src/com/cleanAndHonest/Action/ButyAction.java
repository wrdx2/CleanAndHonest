package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.DutyBiz;
import com.cleanAndHonest.orm.Duty;

public class ButyAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private DutyBiz dutyBiz;
	
	public List<Duty> dutyDuties;
	
	public void setDutyBiz(DutyBiz dutyBiz) {
		this.dutyBiz = dutyBiz;
	}
	
	public String look(){
		List<Duty> list = dutyBiz.select();
		if(list.size() > 0){
			for(int i = 0; i < list.size(); i++){
				
			}
		}
		
		return null;
	}

}
