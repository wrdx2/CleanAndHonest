package com.cleanAndHonest.Biz.Impl;

import com.cleanAndHonest.Biz.ConsBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Consult;

public class ConsBizImpl implements ConsBiz{
	BaseDAO<Consult> baseDAO;

	public void setBaseDAO(BaseDAO<Consult> baseDAO) {
		this.baseDAO = baseDAO;
	}

}
