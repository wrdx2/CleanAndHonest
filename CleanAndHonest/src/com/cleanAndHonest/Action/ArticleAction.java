package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.ArticleBiz;
import com.cleanAndHonest.Biz.LanmuBiz;
import com.cleanAndHonest.Util.Json;
import com.cleanAndHonest.orm.Lanmu;
import com.opensymphony.xwork2.ActionContext;

public class ArticleAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ArticleBiz article;
	private LanmuBiz lm;
	private List<Lanmu> list;
	
	/**
	 * 查询栏目列表
	 * @return 跳转到栏目显示页面
	 */
	public String lanmu(){
		list = lm.list();
		ActionContext.getContext().put("lanmu", list);
		ActionContext.getContext().getSession().put("lanmu", list);
		return "lanmu";
	}
	
	/**
	 * ajax请求，添加一个栏目
	 * 
	 * @return null
	 */
	public String addlm(){
		String lmName = request.getParameter("addlm");
		Lanmu slm = new Lanmu();
		list = lm.list();
		int i;
		if(list.size() > 0){
			i = list.get(list.size()-1).getLno() + 1;
		}else{
			i = 1;
		}
		slm.setLno(i);
		slm.setLtype(lmName);
		slm.setLstate(0);
		
		lm.addLm(slm);
		
		Json json = new Json();
		
		json.setMsg("添加成功");
		json.setSuccess(true);
		json.setObj(slm);
		
		WriteJson(json);
		return null;
	}
	
	public String deleteLm() {
		String ids = request.getParameter("ids");
		
		String[] idsStr = ids.split(",");
		Json json = new Json();
		
		for(int i = 0 ; i < idsStr.length ; i ++){
			if(lm.deleteLm(idsStr[i])){
				json.setSuccess(true);
				json.setMsg("删除成功");
			}else{
				json.setSuccess(false);
				json.setMsg("删除失败");
			}
		}
		
		WriteJson(json);
		return null;
	}
	
	public String view(){
		
		
		return "view";
	}

	public void setArticle(ArticleBiz article) {
		this.article = article;
	}

	public void setLm(LanmuBiz lm) {
		this.lm = lm;
	}

	public List<Lanmu> getList() {
		return list;
	}

	public void setList(List<Lanmu> list) {
		this.list = list;
	}

}
