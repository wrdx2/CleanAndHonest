package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.LanmuBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Lanmu;

public class LanmuBizImpl implements LanmuBiz {
	
	BaseDAO<Lanmu> baseDAO;

	public void setBaseDAO(BaseDAO<Lanmu> baseDAO) {
		this.baseDAO = baseDAO;
	}
	
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
	public boolean deleteLms(String id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int i = Integer.valueOf(id).intValue();
		baseDAO.delete(baseDAO.get(Lanmu.class, i));
		if(baseDAO.get(Lanmu.class, i) == null){
			flag = true;
		}
		return flag;
	}

	@Override
	public void renameLms(Lanmu rlm) {
		// TODO Auto-generated method stub
		baseDAO.update(rlm);
		
	}

	@Override
	public List<Lanmu> typeList(String type, String cont) {
		// TODO Auto-generated method stub
		if("1".equals(type)){
			return baseDAO.find("from Lanmu where ltype = '" + cont + "' and ltype2<>null and ltype3=null");
		}else if ("2".equals(type)) {
			return baseDAO.find("from Lanmu where ltype2 = '" + cont + "' and ltype3<>null");
		}else {
			return baseDAO.find("from Lanmu where ltype3 = '" + cont + "' and ltype=null");
		}
	}

	@Override
	public List<Lanmu> lmtypeArList(String type, String cont) {
		// TODO Auto-generated method stub
		if("1".equals(type)){
			return baseDAO.find("from Lanmu where ltype = '" + cont + "'");
		}else if ("2".equals(type)) {
			return baseDAO.find("from Lanmu where ltype2 = '" + cont + "'");
		}else {
			return baseDAO.find("from Lanmu where ltype3 = '" + cont + "'");
		}
	}

	@Override
	public Lanmu xxLanmu(Integer lno) {
		// TODO Auto-generated method stub
		return baseDAO.get(Lanmu.class, lno);
	}

	@Override
	public List<Lanmu> disList() {
		// TODO Auto-generated method stub
		return baseDAO.find("from Lanmu where lstate = 2");
	}

}
