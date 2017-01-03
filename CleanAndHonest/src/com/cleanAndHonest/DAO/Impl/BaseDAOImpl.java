package com.cleanAndHonest.DAO.Impl;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.Util.Pagination;

public class BaseDAOImpl<T> implements BaseDAO<T>{
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public Serializable save(T o) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Serializable serializable = session.save(o);
		return serializable;
	}

	@Override
	public void delete(T o) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(o);
		session.flush();
	}

	@Override
	public void update(T o) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(o);
		session.flush();
	}

	@Override
	public void saveOrUpdate(T o) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(o);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<T> find(String hql) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List list = session.createQuery(hql).list();
		return list;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<T> find(String hql, Object[] param) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = null;
		
		try{
			q = session.createQuery(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(param != null && param.length > 0){
			for(int i = 0; i < param.length; i ++){
				q.setParameter(i, param[i]);
			}
		}
		
		List list = q.list();
		return list;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<T> find(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		
		if(param != null && param.size() > 0){
			for(int i = 0; i < param.size(); i ++){
				q.setParameter(i, param.get(i));
			}
		}
		
		List list = q.list();
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Pagination find(String hql, Object[] param, Integer page,
			Integer rows) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int indexFrom = hql.indexOf("from");					//查询HQL是否包含关键字from
		if(page == null || page < 1){
			page = 1;
		}
		
		if(rows == null || rows < 1){
			rows = 10;
		}
		
		if(indexFrom == -1){
			throw new Exception("无效语句，没有包含from");
		}
		
		//截取from之后的hql再组装查询总数的hql
		String countHql = "select count(*) " + hql.substring(indexFrom);
		Query q2 = session.createQuery(countHql);			//建立查询，查询总数
		
		if(param != null && param.length > 0){
			for(int i = 0; i < param.length; i ++){
				q2.setParameter(i, param[i]);
			}
		}
		Long total = ((Long) q2.uniqueResult()).longValue();
		
		if(total < 1L){
			return new Pagination(0L, 0, Collections.EMPTY_LIST);
		}
		
		Query q = session.createQuery(hql);				//建立查询，查询数据
		if(param != null && param.length > 0){
			for(int i = 0; i < param.length; i ++){
				q.setParameter(i, param[i]);
			}
		}
		
		List list = q.setFirstResult((page - 1)*rows).setMaxResults(rows).list();
		return new Pagination(total, page, list);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Pagination find(String hql, List<Object> param, Integer page,
			Integer rows) throws Exception {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		int indexFrom = hql.indexOf("from");					//查询HQL是否包含关键字from
		if(page == null || page < 1){
			page = 1;
		}
		
		if(rows == null || rows < 1){
			rows = 10;
		}
		
		if(indexFrom == -1){
			throw new Exception("无效语句，没有包含from");
		}
		
		//截取from之后的hql再组装查询总数的hql
		String countHql = "select count(*) " + hql.substring(indexFrom);
		Query q2 = session.createQuery(countHql);			//建立查询，查询总数
		
		if(param != null && param.size() > 0){
			for(int i = 0; i < param.size(); i ++){
				q2.setParameter(i, param.get(i));
			}
		}
		Long total = ((Long) q2.uniqueResult()).longValue();
		
		if(total < 1L){
			return new Pagination(0L, 0, Collections.EMPTY_LIST);
		}
		
		Query q = session.createQuery(hql);				//建立查询，查询数据
		if(param != null && param.size() > 0){
			for(int i = 0; i < param.size(); i ++){
				q.setParameter(i, param.get(i));
			}
		}
		
		List list = q.setFirstResult((page - 1)*rows).setMaxResults(rows).list();
		return new Pagination(total, page, list);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(Class<T> c, Serializable id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		T t = (T) session.get(c, id);
		
		return t;
	}

	@SuppressWarnings("unused")
	@Override
	public T get(String hql, Object[] param) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<T> l = this.find(hql,param);
		
		if(l != null && l.size()>0){
			return l.get(0);
		}else{
			return null;
		}
	}

	@SuppressWarnings("unused")
	@Override
	public T get(String hql, List<Object> param) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		List<T> l = this.find(hql,param);
		
		if(l != null && l.size()>0){
			return l.get(0);
		}else{
			return null;
		}
	}

}
