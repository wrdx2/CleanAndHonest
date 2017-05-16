package com.cleanAndHonest.Biz.Impl;

import com.cleanAndHonest.Biz.ReplyBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Reply;

public class ReplyBizImpl implements ReplyBiz {
	
	private BaseDAO<Reply> baseDAO;
	
	@Override
	public void delre(Integer rno) {
		// TODO Auto-generated method stub
		baseDAO.delete(baseDAO.get(Reply.class, rno));
	}

	public void setBaseDAO(BaseDAO<Reply> baseDAO) {
		this.baseDAO = baseDAO;
	}

}
