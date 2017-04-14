package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.Lanmu;

public interface LanmuBiz {

	/**
	 * 查询所有栏目
	 * @return 栏目列表
	 */
	public List<Lanmu> list();

	/**
	 * 添加栏目
	 * @param lm 要保存的lanmu对象
	 */
	public void addLm(Lanmu lm);

	/**
	 * 删除栏目
	 * @param string 栏目id
	 * @return 成功返回true
	 */
	public boolean deleteLm(String string);

}
