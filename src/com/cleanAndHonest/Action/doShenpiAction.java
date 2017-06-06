package com.cleanAndHonest.Action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Map;

import com.cleanAndHonest.Biz.Impl.ShenPiBizImpl;
import com.cleanAndHonest.Biz.Impl.doShenpiBizImpl;
import com.cleanAndHonest.Util.DateUtil;
import com.cleanAndHonest.orm.Reply;
import com.cleanAndHonest.orm.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class doShenpiAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> session = ActionContext.getContext().getSession();
	private doShenpiBizImpl doShenpiBiz;
	private ShenPiBizImpl shenpiBiz;
	private String text;
	private User us = (User) session.get("user");
	private String rno;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		return super.execute();
	}
	
	public String doShenpi() throws Exception {
		// TODO Auto-generated method stub
		Reply sp = doShenpiBiz.sele(Integer.valueOf(rno));
		sp.setRcontent(text);
		sp.setRemail(us.getEmail());
		sp.setRtel(us.getUtel());
		sp.setRtime(Timestamp.valueOf(DateUtil.DateToString(
				"yyyy-MM-dd HH:mm:ss", new Date(new java.util.Date().getTime()))));
		sp.setRname(us.getUname().trim()+"--"+us.getOffice());
		doShenpiBiz.doShenpi(sp);
		shenpiBiz.upstate(Integer.valueOf(rno));
		System.out.println(new Date(new java.util.Date().getTime())+shenpiBiz.toString());
		return "success";
	}
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setDoShenpiBiz(doShenpiBizImpl doShenpiBiz) {
		this.doShenpiBiz = doShenpiBiz;
	}
	
	public void setShenpiBiz(ShenPiBizImpl shenpiBiz) {
		this.shenpiBiz = shenpiBiz;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

}
