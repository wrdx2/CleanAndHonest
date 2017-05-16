package com.cleanAndHonest.DAO;

import java.io.Serializable;
import java.util.List;

import com.cleanAndHonest.Util.Pagination;

public interface BaseDAO<T> {
	//保存对象
	public Serializable save(T o);
	//删除对象
	public void delete(T o);
	//更新对象
	public void update(T o);
	//保存或更新对象
	public void saveOrUpdate(T o);
	//查询
	public List<T> find(String hql);
	//查询集合
	public List<T> find(String hql,Object[] param);
	//查询集合
	public List<T> find(String hql,List<Object> param);
	//查询集合（带分页）
	public Pagination find(String hql,Object[] param,Integer page,Integer rows) throws Exception;
	//查询集合（带分页）
	public Pagination find(String hql,List<Object> param,Integer page,Integer rows) throws Exception;
	//根据标识获得对象
	public T get(Class<T> c,Serializable id);
	//根据条件获得对象
	public T get (String hql, Object[] param);
	//根据条件获得对象
	public T get (String hql, List<Object> param);
		
}
