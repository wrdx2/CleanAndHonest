package com.cleanAndHonest.Action;

import java.util.List;

import com.cleanAndHonest.Biz.ReplyBiz;
import com.cleanAndHonest.Biz.ShenPiBiz;
import com.cleanAndHonest.Biz.ShenpixinxiBiz;
import com.cleanAndHonest.orm.Shenpi;
import com.cleanAndHonest.orm.VSr;
import com.opensymphony.xwork2.ActionSupport;

public class shenpiList extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ShenPiBiz shenpiBiz;
	private ShenpixinxiBiz shenpixinxiBiz;
	private ReplyBiz replyBiz;
	private String sno;
	private String dep;
	List<Shenpi> list;
	List<VSr> list2;
	Shenpi sp = new Shenpi();
	VSr sr = new VSr();

	//查询全部审批事项
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		list = shenpiBiz.shenpiList();
		
		if(list.size() > 0){
			return "success";
		} else {
			return "error";
		}
	}
	
	//查询"我"的审批事项
	public String myshenpi() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(dep);
		list = shenpiBiz.myShenpiList(dep);
		if(list.size() > 0){
			return "success";
		} else {
			return "error";
		}
	}

	//查询事项的详细信息
	public String spxinxi() throws Exception {
		// TODO Auto-generated method stub
		
		list2 = shenpixinxiBiz.shenpixinxi(sno);
		
		if(list2.size()>0){
			sr=list2.get(0);
			return "success";
		}else{
			return "error";
		}
	}
	
	//删除事项
	public String delsp() throws Exception{
		replyBiz.delre(Integer.valueOf(sno));
		shenpiBiz.delsp(Integer.valueOf(sno));
		return "success";
	}

	//get set方法
	public List<Shenpi> getList() {
		return list;
	}

	public void setList(List<Shenpi> list) {
		this.list = list;
	}

	public void setShenpiBiz(ShenPiBiz shenpiBiz) {
		this.shenpiBiz = shenpiBiz;
	}
	
	public void setShenpixinxiBiz(ShenpixinxiBiz shenpixinxiBiz) {
		this.shenpixinxiBiz = shenpixinxiBiz;
	}
	
	public void setReplyBiz(ReplyBiz replyBiz) {
		this.replyBiz = replyBiz;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public Shenpi getSp() {
		return sp;
	}

	public void setSp(Shenpi sp) {
		this.sp = sp;
	}

	public VSr getSr() {
		return sr;
	}

	public void setSr(VSr sr) {
		this.sr = sr;
	}

	public String getDep() {
		return dep;
	}

	public void setDep(String dep) {
		this.dep = dep;
	}
}
