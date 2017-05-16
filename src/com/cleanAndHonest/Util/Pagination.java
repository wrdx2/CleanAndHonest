package com.cleanAndHonest.Util;

import java.util.List;

public class Pagination {
	//总记录数
	private Long total;
	//当前页码
	private Integer page;
	//返回的对象数据
	@SuppressWarnings("rawtypes")
	private List rows;
	
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	@SuppressWarnings("rawtypes")
	public List getRows() {
		return rows;
	}
	@SuppressWarnings("rawtypes")
	public void setRows(List rows) {
		this.rows = rows;
	}
	
	@SuppressWarnings("rawtypes")
	public Pagination(Long total,Integer page, List rows){
		super();
		this.total = total;
		this.page = page;
		this.rows = rows;
	}
	
	public Pagination(){
		super();
	}

}
