package com.cleanAndHonest.Action;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
	private LanmuBiz lanmu;
	private List<Lanmu> lmList;
	private List<Lanmu> lmList2;
	private List<Article> arList;
	private List<Article> arList2;
	
	private Article ar;
	private Lanmu lm;
	
	/**
	 * 按照栏目级别和名称查询出子栏目信息和栏目包含的文章信息
	 * @return
	 */
	public String selLmAr(){
		String type = request.getParameter("type");
		String cont = request.getParameter("cont");
		
		lmList = lanmu.typeList(type,cont);
		lmList2 = lanmu.lmtypeArList(type,cont);
		
		if(lmList.size() > 0){
			List<String> lmIdsList = new ArrayList<String>();
			for(int i = 0; i < lmList2.size(); i++){
				lmIdsList.add(lmList2.get(i).getLno().toString());
			}
			arList = article.typeList(lmIdsList);
		}
		
		//得到7天前的日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -7);
        Date monday = c.getTime();
        String preMonday = sdf.format(monday);
        
		arList2 = article.timeList(preMonday);
		
		return "lanmu_src";
	}
	
	/**
	 * 根据文章ID查询文章的详细信息
	 * @return 
	 */
	public String selAr(){
		String xxano = request.getParameter("arId");
		ar = article.xxArticle(Integer.valueOf(xxano));
		ar.setAhits(ar.getAhits() + 1);
		lm = lanmu.xxLanmu(Integer.valueOf(ar.getAtype()));
		
		//得到7天前的日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -7);
        Date monday = c.getTime();
        String preMonday = sdf.format(monday);
        
		arList = article.timeList(preMonday);
		arList2 = article.hitList();
		return "ar_src";
	}
	
	public String pageLmAr(){
		lmList = lanmu.disList();
		
		if(lmList.size() > 0){
			List<String> lmIdsList = new ArrayList<String>();
			for(int i = 0; i < lmList.size(); i++){
				lmIdsList.add(lmList.get(i).getLno().toString());
			}
			arList = article.typeList(lmIdsList);
		}
		
		Json json = new Json();

		json.setMsg("查询成功");
		json.setSuccess(true);
		json.setObj(lmList);
		json.setObj2(arList);

		WriteJson(json);
		return null;
	}

	/**
	 * 查询栏目列表
	 * 
	 * @return 跳转到栏目显示页面
	 */
	public String lanmu() {
		lmList = lanmu.list();
		ActionContext.getContext().put("lanmu", lmList);
		ActionContext.getContext().getSession().put("lanmu", lmList);
		return "lanmu";
	}
	
	/**
	 * ajax 查询所有栏目
	 * @return
	 */
	public String seleLM(){
		lmList = lanmu.list();
		
		Json json = new Json();

		json.setMsg("查询成功");
		json.setSuccess(true);
		json.setObj(lmList);

		WriteJson(json);
		return null;
	}

	/**
	 * 添加一个栏目
	 * 
	 * @return null
	 */
	public String addlm() {
		String lmtype = request.getParameter("lmtype");
		String lmtype2 = request.getParameter("lmtype2");
		String lmtype3 = request.getParameter("lmtype3");
		Lanmu slm = new Lanmu();
		lmList = lanmu.typeList("1",lmtype);
		if (lmList.size() > 0) {
			lmList = lanmu.typeList("2", lmtype2);
			if (lmList.size() > 0) {
				lmList = lanmu.typeList("3", lmtype3);
				if (lmList.size() > 0) {
					return "addLmError";
				}
			}
		}
		//slm.setLno(i);
		slm.setLtype(lmtype);
		slm.setLtype2(lmtype2);
		slm.setLtype3(lmtype3);
		slm.setLstate(0);

		lanmu.addLm(slm);

		return "addLm";
	}

	/**
	 * 删除栏目
	 * 
	 * @return ajax调用，无返回值
	 */
	public String deleteLm() {
		String ids = request.getParameter("ids");
		System.out.println(ids);

		String[] idsStr = ids.split(",");
		Json json = new Json();

		for (int i = 0; i < idsStr.length; i++) {
			if (lanmu.deleteLms(idsStr[i])) {
				json.setSuccess(true);
				json.setMsg("删除成功");
			} else {
				json.setSuccess(false);
				json.setMsg("删除失败");
			}
		}

		WriteJson(json);
		return null;
	}

	/**
	 * 编辑栏目
	 * 
	 * @return
	 */
	public String renameLm() {
		Lanmu rlm = new Lanmu();
		Integer lno = Integer.valueOf(request.getParameter("lmlno"));
		String ltype = request.getParameter("lmtype").trim();
		String ltype2 = request.getParameter("lmtype2").trim();
		String ltype3 = request.getParameter("lmtype3").trim();
		Integer lstate1 = Integer.valueOf(request.getParameter("auditing"));

		rlm.setLno(lno);
		rlm.setLtype(ltype);
		rlm.setLtype2(ltype2);
		rlm.setLtype3(ltype3);
		if (lstate1 == 0) {
			rlm.setLstate(lstate1);
		} else {
			Integer lstate2 = Integer
					.valueOf(request.getParameter("lmDisplay"));
			System.out.println("栏目状态值：" + lstate2);
			rlm.setLstate(lstate2);
		}

		lanmu.renameLms(rlm);
		return "renameLm";
	}

	/**
	 * 查询栏目信息
	 * 
	 * @return ajax请求 重定义返回json对象
	 */
	public String selectLm() {
		lmList = lanmu.list();

		Json json = new Json();

		if (lmList.size() > 0) {
			json.setSuccess(true);
			json.setObj(lmList);
			json.setMsg("查询到栏目值");
		} else {
			json.setSuccess(false);
			json.setMsg("查询失败");
		}

		WriteJson(json);

		return null;
	}

	/**
	 * 查看所有文章
	 * 
	 * @return 文章列表
	 */
	public String list() {
		arList = article.list();
		ActionContext.getContext().put("article", arList);
		ActionContext.getContext().getSession().put("article", arList);
		session.setAttribute("isEdit", request.getParameter("isEdit"));
		System.out.println(request.getParameter("isEdit"));

		return "arList";
	}

	/**
	 * 查看文章信息
	 * 
	 * @return 返回查看的信息“look”
	 */
	public String look() {
		String xxano = request.getParameter("ano");
		ar = article.xxArticle(Integer.valueOf(xxano));
		return "look";
	}

	/**
	 * 添加一篇文章
	 * 
	 * @return 字符串"add",重定向到文章列表action
	 */
	public String add() {
		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String type = request.getParameter("type");
		String text = request.getParameter("text");
		String aname = session.getAttribute("uName").toString();
		String fileNames = request.getParameter("fileNames");

		String[] fileName = fileNames.split(",");

		Date nowdate = new Date();
		Timestamp st = Timestamp.valueOf(DateUtil.DateToString(
				"yyyy-MM-dd HH:mm:ss", nowdate));

		String attach = "";
		
		for (int i = 0; i < fileName.length; i++) {
			if(fileName[i] !=null && fileName[i] != "" && fileName[i].length() < 10){
			fileName[i] = Constants.ATTACH_PATH + "article/"
					+ DateUtil.DateToString("yyyyMMdd", nowdate) + "/"
					+ fileName[i];
			System.out.println("附件:" + fileName[i] + "时间：" + st);
			}
		}
		for (int i = 0; i < fileName.length; i++) {
			attach += fileName[i];
			if (i >= 1 && i < fileName.length - 1) {
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
	
	/**
	 * 查询我发表的文章
	 * @return
	 */
	public String mytxt(){
		String aname = request.getParameter("name").trim();
		arList = article.myList(aname);
		ActionContext.getContext().put("article", arList);
		ActionContext.getContext().getSession().put("article", arList);
		session.setAttribute("isEdit", request.getParameter("isEdit"));

		return "myArList";
	}

	/**
	 * 编辑文章
	 * @return
	 */
	public String edit() {
		String xxano = request.getParameter("ano");
		ar = article.xxArticle(Integer.valueOf(xxano));
		session.setAttribute("text", ar.getAcontent());
		return "edit";
	}
	
	/**
	 * 删除文章
	 * 
	 * @return ajax调用，无返回值
	 */
	public String deleteAr() {
		String ids = request.getParameter("ids");

		String[] idsStr = ids.split(",");
		Json json = new Json();

		for (int i = 0; i < idsStr.length; i++) {
			if (article.deleteArs(idsStr[i])) {
				json.setSuccess(true);
				json.setMsg("删除成功");
			} else {
				json.setSuccess(false);
				json.setMsg("删除失败");
			}
		}

		WriteJson(json);
		return null;
	}

	/**
	 * 文件预览
	 * @return
	 */
	public String view() {

		String dir = request.getParameter("dir");
		String name = request.getParameter("name").trim();
		String path = dir + name;

		String localPath = "C:/software/CleanAndHonest/WebRoot/viewFileCache/";
		File localPathFile = new File(localPath);

		if (!localPathFile.exists()) {
			// 文件夹不存在，创建文件夹
			localPathFile.mkdirs();
		}

		String swfFilePath = localPath + FileUtils.getFilePrefix(name) + ".swf";
		File swfFile = new File(swfFilePath);
		String finalSwfFilePath = null;
		if (swfFile.exists()) {
			// 第二次以后进行的预览
			finalSwfFilePath = "viewFileCache/" + FileUtils.getFilePrefix(name) + ".swf";
		} else {
			// 第一次点击预览，把文件下载到localPath并把文件转化为SWF文件
			/* serContext.getResourceAsStream( dir + "/" + name); */
			// 下载本地文件
			
			try {
				FileUtils.copyFile(path, localPath + name);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			String pdfFilePath = localPath + FileUtils.getFilePrefix(name) + ".pdf";
			File pdfFile = new File(pdfFilePath);
			if (!pdfFile.exists()) {
				OfficeToSwf.convert2PDF(localPath + name);
			} else {
				OfficeToSwf.pdftoswf(pdfFilePath);
			}
			finalSwfFilePath = localPath + FileUtils.getFilePrefix(name) + ".swf";
		}

		ActionContext.getContext().put("local", finalSwfFilePath);

		return "view";
	}
	
	/**
	 * 修改数据库文章信息
	 * @return 跳转到添加完成页面
	 */
	public String subEdit(){
		String ano = request.getParameter("ano");
		String title = request.getParameter("title");
		String address = request.getParameter("address");
		String type = request.getParameter("type");
		String text = request.getParameter("text");
		String aname = session.getAttribute("uName").toString();
		String fileNames = request.getParameter("fileNames");

		String[] fileName = fileNames.split(",");

		System.out.println("传递的fileNames:" + fileNames);
		Date nowdate = new Date();
		Timestamp st = Timestamp.valueOf(DateUtil.DateToString(
				"yyyy-MM-dd HH:mm:ss", nowdate));

		String attach = "";
		
		for (int i = 0; i < fileName.length; i++) {
			if(fileName[i] !=null && fileName[i] != "" && fileName[i].length() < 10){
			fileName[i] = Constants.ATTACH_PATH + "article/"
					+ DateUtil.DateToString("yyyyMMdd", nowdate) + "/"
					+ fileName[i];
			System.out.println("附件:" + fileName[i] + "时间：" + st);
			}
		}
		for (int i = 0; i < fileName.length; i++) {
			attach += fileName[i];
			if (i >= 1 && i < fileName.length - 1) {
				attach += ",";
			}
		}

		Article ar = article.xxArticle(Integer.valueOf(ano));

		ar.setAtitle(title);
		ar.setAaddress(address);
		ar.setAcontent(text);
		ar.setAtime(st);
		ar.setAtype(type);
		ar.setAname(aname);
		ar.setAattach(attach);

		article.edit(ar);
		return "add";
	}
	
	
	/*******************************get、set函数*********************/

	public void setArticle(ArticleBiz article) {
		this.article = article;
	}

	public void setLanmu(LanmuBiz lanmu) {
		this.lanmu = lanmu;
	}

	public List<Lanmu> getLmList() {
		return lmList;
	}

	public void setLmList(List<Lanmu> lmList) {
		this.lmList = lmList;
	}

	public List<Lanmu> getLmList2() {
		return lmList2;
	}

	public void setLmList2(List<Lanmu> lmList2) {
		this.lmList2 = lmList2;
	}

	public List<Article> getArList() {
		return arList;
	}

	public void setArList(List<Article> arList) {
		this.arList = arList;
	}

	public List<Article> getArList2() {
		return arList2;
	}

	public void setArList2(List<Article> arList2) {
		this.arList2 = arList2;
	}

	public Article getAr() {
		return ar;
	}

	public void setAr(Article ar) {
		this.ar = ar;
	}

	public Lanmu getLm() {
		return lm;
	}

	public void setLm(Lanmu lm) {
		this.lm = lm;
	}

}
