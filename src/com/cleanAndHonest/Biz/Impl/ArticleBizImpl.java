package com.cleanAndHonest.Biz.Impl;

import java.util.ArrayList;
import java.util.List;

import com.cleanAndHonest.Biz.ArticleBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.Article;

public class ArticleBizImpl implements ArticleBiz {

	BaseDAO<Article> baseDAO;

	public void setBaseDAO(BaseDAO<Article> baseDAO) {
		this.baseDAO = baseDAO;
	}
	
	@Override
	public List<Article> list() {
		// TODO Auto-generated method stub
		String hql = "from Article";
		List<Article> list = baseDAO.find(hql);
		
		return list;
	}

	@Override
	public Article xxArticle(Integer ano) {
		// TODO Auto-generated method stub
		
		return baseDAO.get(Article.class, ano);
	}

	@Override
	public void addar(Article ar) {
		// TODO Auto-generated method stub
		baseDAO.save(ar);
	}

	@Override
	public List<Article> myList(String aname) {
		// TODO Auto-generated method stub
		String hql = "from Article where aname='" + aname + "'";
		List<Article> list = baseDAO.find(hql);
		return list;
	}

	@Override
	public void edit(Article ar) {
		// TODO Auto-generated method stub
		baseDAO.update(ar);
	}

	@Override
	public boolean deleteArs(String id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int i = Integer.valueOf(id).intValue();
		baseDAO.delete(baseDAO.get(Article.class, i));
		if(baseDAO.get(Article.class, i) == null){
			flag = true;
		}
		return flag;
	}

	@Override
	public List<Article> typeList(List<String> lmIdsList) {
		// TODO Auto-generated method stub
		List<Article> list = new ArrayList<Article>();
		
		for (int i = 0; i < lmIdsList.size(); i++) {
			list.addAll(baseDAO.find("from Article where atype = " + lmIdsList.get(i)));
		}
		
		return list;
	}

	@Override
	public List<Article> hitList() {
		// TODO Auto-generated method stub
		List<Article> list = baseDAO.find("from Article order by ahits desc");
		if(list.size() > 10){
			return list.subList(0, 9);
		}else {
			return list;
		}
		
	}

	@Override
	public List<Article> timeList(String preMonday) {
		// TODO Auto-generated method stub
		return baseDAO.find("from Article where DateDiff(day,'" + preMonday + "',getdate())<=7");
	}

}
