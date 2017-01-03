package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.Shenpi;

public interface ShenPiBiz {
	public List<Shenpi> shenpiList();					//查询所有审批信息
	public List<Shenpi> myShenpiList(String dep);		//查询“我”的审批项的信息
	public void delsp(Integer sno);						//删除审批信息
	public void upstate(Integer sno);					//改变审批状态
}
