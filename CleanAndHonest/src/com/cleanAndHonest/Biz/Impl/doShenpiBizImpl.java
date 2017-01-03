package com.cleanAndHonest.Biz.Impl;

import com.cleanAndHonest.Biz.doShenpiBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Reply;

public class doShenpiBizImpl implements doShenpiBiz {

	BaseDAO<Reply> baseDAO;
	
	public void setBaseDAO(BaseDAO<Reply> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public Reply sele(int rno) {
		// TODO Auto-generated method stub
		return baseDAO.get(Reply.class, rno);
	}

	@Override
	public void doShenpi(Reply sp) {
		// TODO Auto-generated method stub
		baseDAO.update(sp);
	}

}
