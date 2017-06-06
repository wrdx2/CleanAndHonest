package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.VoteBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Vote;

public class VoteBizImpl implements VoteBiz {
	BaseDAO<Vote> baseDAO;

	public void setBaseDAO(BaseDAO<Vote> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public List<Vote> selectAll() {
		// TODO Auto-generated method stub
		
		return baseDAO.find("from Vote");
	}

	@Override
	public void add(Vote vote) {
		// TODO Auto-generated method stub
		baseDAO.save(vote);
	}

	@Override
	public Vote selectVnoOne(Integer id) {
		// TODO Auto-generated method stub
		return baseDAO.get(Vote.class, id);
	}

	@Override
	public List<Vote> selectVname(String vname) {
		// TODO Auto-generated method stub
		return baseDAO.find("from Vote where vname='" + vname + "'");
	}

	@Override
	public boolean deleteVno(Integer vno) {
		// TODO Auto-generated method stub
		boolean flag = false;
		baseDAO.delete(baseDAO.get(Vote.class, vno));
		if(baseDAO.get(Vote.class, vno) == null){
			flag = true;
		}
		return flag;
	}

	@Override
	public List<Vote> selVstate() {
		// TODO Auto-generated method stub
		return baseDAO.find("from Vote where vstate = 2");
	}

	@Override
	public void update(Vote vote) {
		// TODO Auto-generated method stub
		baseDAO.update(vote);
	}

}
