package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.Article;

public interface ArticleBiz {

	/**
	 * 查询所有的文章
	 * @return 文章列表
	 */
	List<Article> list();
	
	/**
	 * 查询我发表的文章
	 * @param aname 我的姓名
	 * @return
	 */
	List<Article> myList(String aname);

	/**
	 * 查看文章详细信息
	 * @param ano 所要查看的文章id
	 * @return 文章信息
	 */
	Article xxArticle(Integer ano);

	/**
	 * 添加一篇文章
	 * @param ar 所要添加的文章信息
	 */
	void addar(Article ar);

	/**
	 * 修改文章信息
	 * @param ar 所要修改的文章
	 */
	void edit(Article ar);

	/**
	 * 删除文章
	 * @param string 要删除的文章id
	 * @return 成功返回true
	 */
	boolean deleteArs(String string);

	/**
	 * 按文章所在栏目查询
	 * @param lmIdsList 栏目ID列表
	 * @return 文章列表
	 */
	List<Article> typeList(List<String> lmIdsList);

	/**
	 * 查询7天内的文章信息
	 * @param preMonday 七天前的日期
	 * @return 文章列表
	 */
	List<Article> timeList(String preMonday);

	/**
	 * 查询点击量最高的文章
	 * @return 文章列表
	 */
	List<Article> hitList();

}
