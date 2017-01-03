package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.ShenpixinxiBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.VSr;

public class ShenpixinxiBizImpl implements ShenpixinxiBiz {

	private BaseDAO<VSr> baseDAO;
	
	public void setBaseDAO(BaseDAO<VSr> baseDAO) {
		this.baseDAO = baseDAO;
	}
	@Override
	public List<VSr> shenpixinxi(String sno) {
		// TODO Auto-generated method stub
		return baseDAO.find("from VSr where sno="+sno);
	}

}
