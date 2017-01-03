package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.ShenPiBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Shenpi;

public class ShenPiBizImpl implements ShenPiBiz {
	
	private BaseDAO<Shenpi> baseDAO;
	
	public void setBaseDAO(BaseDAO<Shenpi> baseDAO) {
		this.baseDAO = baseDAO;
	}
	@Override
	public List<Shenpi> shenpiList() {
		// TODO Auto-generated method stub
		return baseDAO.find("from Shenpi");
	}

	@Override
	public List<Shenpi> myShenpiList(String dep) {
		// TODO Auto-generated method stub
		return baseDAO.find("from Shenpi where sdep="+"'"+dep+"'");
	}
	@Override
	public void delsp(Integer sno) {
		// TODO Auto-generated method stub
		Shenpi sp=baseDAO.get(Shenpi.class, sno);
		baseDAO.delete(sp);
	}
	
	@Override
	public void upstate(Integer sno) {
		// TODO Auto-generated method stub
		Shenpi sp=baseDAO.get(Shenpi.class, sno);
		sp.setSstate(1);
		baseDAO.update(sp);
	}

}
