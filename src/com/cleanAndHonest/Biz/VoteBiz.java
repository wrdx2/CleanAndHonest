package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.Vote;

public interface VoteBiz {

	/**
	 * 查询投票表的信息
	 * @return
	 */
	List<Vote> selectAll();

	/**
	 * 添加投票信息
	 * @param vote
	 */
	void add(Vote vote);

	/**
	 * 根据ID查询Vote信息
	 * @param integer ID值
	 * @return 查询到的Vote
	 */
	Vote selectVnoOne(Integer integer);

	/**
	 * 根据调查的名称，查询出投票的节点信息列表
	 * @param vname 调查的名称
	 * @return 投票的信息
	 */
	List<Vote> selectVname(String vname);

	/**
	 * 根据ID删除该类调查
	 * @param vno 某调查的ID
	 * @return 成功返回true
	 */
	boolean deleteVno(Integer vno);

	/**
	 * 查询能够在页面上显示的调查信息
	 * @return 调查信息的选项列表
	 */
	List<Vote> selVstate();

	/**
	 * 更新vote信息
	 * @param vote
	 */
	void update(Vote vote);


}
