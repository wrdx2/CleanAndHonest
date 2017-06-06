package com.cleanAndHonest.Biz.Impl;

import com.cleanAndHonest.Biz.DepBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Deparment;

public class DepBizImpl implements DepBiz {
	BaseDAO<Deparment> baseDAO;

	public void setBaseDAO(BaseDAO<Deparment> baseDAO) {
		this.baseDAO = baseDAO;
	}

}
