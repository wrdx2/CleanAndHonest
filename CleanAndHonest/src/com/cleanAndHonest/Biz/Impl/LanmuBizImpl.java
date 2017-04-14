package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.LanmuBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Lanmu;

public class LanmuBizImpl implements LanmuBiz {
	
	BaseDAO<Lanmu> baseDAO;

	@Override
	public List<Lanmu> list() {
		// TODO Auto-generated method stub
		/*String hql = "select ";
		hql +="new com.cleanAndHonest.orm.Lanmu ";
		hql +="(ano,atype) ";
		hql += "from Lanmu";*/
		String hql = "from Lanmu";
		List<Lanmu> list = baseDAO.find(hql);
		
		return list;
	}

	@Override
	public void addLm(Lanmu lm) {
		// TODO Auto-generated method stub
		baseDAO.save(lm);
	}

	@Override
	public boolean deleteLm(String id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int i = Integer.valueOf(id).intValue();
		baseDAO.delete(baseDAO.get(Lanmu.class, i));
		if(baseDAO.get(Lanmu.class, i) == null){
			flag = true;
		}
		return flag;
	}

	public void setBaseDAO(BaseDAO<Lanmu> baseDAO) {
		this.baseDAO = baseDAO;
	}
}
