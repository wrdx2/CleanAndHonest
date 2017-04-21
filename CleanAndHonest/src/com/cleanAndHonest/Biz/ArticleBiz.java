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
	 * 查看文章详细信息
	 * @param ano 所要查看的文章id
	 * @return 文章信息
	 */
	Article xxArticle(Integer ano);

}
