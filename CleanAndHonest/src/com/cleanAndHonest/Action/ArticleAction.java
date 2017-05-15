package com.cleanAndHonest.Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.ArticleBiz;
import com.cleanAndHonest.Biz.LanmuBiz;
import com.cleanAndHonest.Util.Constants;
import com.cleanAndHonest.Util.DateUtil;
import com.cleanAndHonest.Util.FileUtils;
import com.cleanAndHonest.Util.Json;
import com.cleanAndHonest.Util.OfficeToSwf;
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
	
	/**
	 * 查询栏目信息
	 * @return ajax请求 重定义返回json对象
	 */
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
	
	/**
	 * 查看文章信息
	 * @return 返回查看的信息“look”
	 */
	public String look(){
		String xxano = request.getParameter("ano");
		ar = article.xxArticle(Integer.valueOf(xxano));
		stat = "look";
		return "look";
	}
	
	/**
	 * 添加一篇文章
	 * @return 文章列表
	 */
	public String add(){
		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String type = request.getParameter("type");
		String text = request.getParameter("text");
		String aname = session.getAttribute("uName").toString();
		String fileNames = request.getParameter("fileNames");
		
		String[] fileName = fileNames.split(",");
		
		Date nowdate = new Date();
		Timestamp st = Timestamp.valueOf(DateUtil.DateToString("yyyy-MM-dd HH:mm:ss", nowdate));
		
		String attach = "";
		for (int i = 0; i < fileName.length; i++) {
			fileName[i] = Constants.ATTACH_PATH + "article/" + DateUtil.DateToString("yyyyMMdd", nowdate) + "/" + fileName[i];
			System.out.println("附件:" + fileName[i]);
		}
		for (int i = 0; i < fileName.length; i++) {
			attach += fileName[i];
			if(i >= 1 && i < fileName.length - 1){
				attach += ",";
			}
		}
		
		Article ar = new Article();
		
		ar.setAtitle(title);
		ar.setAaddress(address);
		ar.setAcontent(text);
		ar.setAtime(st);
		ar.setAtype(type);
		ar.setAname(aname);
		ar.setAattach(attach);
		
		article.addar(ar);
		return "add";
	}
	
	public String edit(){
		
		
		return null;
	}
	
	public String view(){
		
		String dir = request.getParameter("dir");
		String name = request.getParameter("name");
		
		String localPath = "C:/software/CleanAndHonest/WebRoot/viewFileCache/";
		File localPathFile = new File(localPath);
		
		if(!localPathFile.exists()){
			//文件夹不存在，创建文件夹
			localPathFile.mkdir();
		}
		
		String swfFilePath = localPath + FileUtils.getFilePrefix(name) + ".swf";
		File swfFile = new File(swfFilePath);
		String finalSwfFilePath = null;
		if(swfFile.exists()){
			//第二次以后进行的预览
			finalSwfFilePath = "viewFileCache/" + FileUtils.getFilePrefix(name) + ".swf";
		}else{
			//第一次点击预览，把文件下载到localPath并把文件转化为SWF文件
			/*serContext.getResourceAsStream( dir + "/" + name);*/
			// 下载本地文件
	        String fileName = "Operator.doc".toString(); // 文件的默认保存名
	        // 读到流中
	        InputStream inStream = null;
			try {
				System.out.println(dir + name);
				inStream = new FileInputStream(dir + name);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        // 设置输出的格式
	        response.reset();
	        response.setContentType("bin");
	        response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
	        // 循环取出流中的数据
	        byte[] b = new byte[100];
	        int len;
	        try {
	            while ((len = inStream.read(b)) > 0)
	                response.getOutputStream().write(b, 0, len);
	            inStream.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
			String pdfFilePath = FileUtils.getFilePrefix(name) + ".pdf";
			File pdfFile = new File(pdfFilePath);
			if(!pdfFile.exists()){
				OfficeToSwf.convert2PDF(localPath + name);
			}else{
				OfficeToSwf.pdftoswf(pdfFilePath);
			}
			finalSwfFilePath = "viewFileCache/" + FileUtils.getFilePrefix(name) + ".swf";
		}
		
		ActionContext.getContext().put("local", finalSwfFilePath);
		
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
