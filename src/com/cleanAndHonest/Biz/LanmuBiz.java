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
	public boolean deleteLms(String string);

	/**
	 * 编辑栏目信息
	 * @param rlm
	 */
	public void renameLms(Lanmu rlm);

	/**
	 * 按栏目类型查询子栏目信息
	 * @param type 所属类别
	 * @param cont 要查询栏目所属类别的名称
	 * @return 栏目列表
	 */
	public List<Lanmu> typeList(String type, String cont);

	/**
	 * 按栏目类型查询所有栏目信息
	 * @param type 所属类别
	 * @param cont 要查询栏目所属类别的名称
	 * @return 栏目列表
	 */
	public List<Lanmu> lmtypeArList(String type, String cont);

	/**
	 * 查询栏目的详细信息
	 * @param lno 栏目id
	 * @return 某栏目的详细信息
	 */
	public Lanmu xxLanmu(Integer lno);

	/**
	 * 查询出要在前台显示的栏目的信息
	 * @return 栏目列表
	 */
	public List<Lanmu> disList();

}
