package com.cleanAndHonest.Biz.Impl;

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

}
