package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.Duty;

public interface DutyBiz {

	/**
	 * 查询值班表中的人物信息
	 * @return 值班信息列表
	 */
	List<Duty> select();

}
