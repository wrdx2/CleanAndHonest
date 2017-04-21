package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.ArticleBiz;
import com.cleanAndHonest.Biz.LanmuBiz;
import com.cleanAndHonest.Util.Json;
import com.cleanAndHonest.orm.Article;
import com.cleanAndHonest.orm.Lanmu;
import com.opensymphony.xwork2.ActionContext;

public class ArticleAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ArticleBiz article;
	private LanmuBiz lm;
	private List<Lanmu> lmList;
	private List<Article> arList;
	private Article ar;
	private String stat;

	/**
	 * 查询栏目列表
	 * @return 跳转到栏目显示页面
	 */
	public String lanmu(){
		lmList = lm.list();
		ActionContext.getContext().put("lanmu", lmList);
		ActionContext.getContext().getSession().put("lanmu", lmList);
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
		lmList = lm.list();
		int i;
		if(lmList.size() > 0){
			i = lmList.get(lmList.size()-1).getLno() + 1;
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
	
	/**
	 * 删除栏目
	 * @return ajax调用，无返回值
	 */
	public String deleteLm() {
		String ids = request.getParameter("ids");
		
		String[] idsStr = ids.split(",");
		Json json = new Json();
		
		for(int i = 0 ; i < idsStr.length ; i ++){
			if(lm.deleteLms(idsStr[i])){
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
	
	/**
	 * 编辑栏目
	 * @return
	 */
	public String renameLm(){
		Lanmu rlm = new Lanmu();
		Integer lno = Integer.valueOf(request.getParameter("lmlno"));
		String ltype = request.getParameter("lmtype").trim();
		Integer lstate1 = Integer.valueOf(request.getParameter("auditing"));
		
		rlm.setLno(lno);
		rlm.setLtype(ltype);
		if (lstate1 == 0) {
			rlm.setLstate(lstate1);
		}else{
			Integer lstate2 = Integer.valueOf(request.getParameter("lmDisplay"));
			System.out.println("栏目状态值：" + lstate2);
			rlm.setLstate(lstate2);
		}
		
		lm.renameLms(rlm);
		return "renameLm";
	}
	
	public String selectLm(){
		lmList = lm.list();
		
		Json json = new Json();
		
		if(lmList.size() > 0){
			json.setSuccess(true);
			json.setObj(lmList);
			json.setMsg("查询到栏目值");
		}else{
			json.setSuccess(false);
			json.setMsg("查询失败");
		}
		
		WriteJson(json);
		
		return null;
	}
	
	/**
	 * 查看所有文章
	 * @return 文章列表
	 */
	public String list(){
		arList = article.list();
		ActionContext.getContext().put("article", arList);
		ActionContext.getContext().getSession().put("article", arList);
		
		return "arList";
	}
	
	public String look(){
		String xxano = request.getParameter("ano");
		ar = article.xxArticle(Integer.valueOf(xxano));
		stat = "look";
		return "look";
	}
	
	public String edit(){
		
		
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

	public List<Lanmu> getLmList() {
		return lmList;
	}

	public void setLmList(List<Lanmu> lmList) {
		this.lmList = lmList;
	}

	public List<Article> getArList() {
		return arList;
	}

	public void setArList(List<Article> arList) {
		this.arList = arList;
	}

	public Article getAr() {
		return ar;
	}

	public void setAr(Article ar) {
		this.ar = ar;
	}
	
	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

}
