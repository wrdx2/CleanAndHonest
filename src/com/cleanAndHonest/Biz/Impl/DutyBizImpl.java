package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.DutyBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Duty;

public class DutyBizImpl implements DutyBiz {
	BaseDAO<Duty> baseDAO;

	public void setBaseDAO(BaseDAO<Duty> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public List<Duty> select() {
		// TODO Auto-generated method stub
		
		return baseDAO.find("from duty");
	}

}
