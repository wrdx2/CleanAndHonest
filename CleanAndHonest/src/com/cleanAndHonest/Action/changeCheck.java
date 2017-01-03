package com.cleanAndHonest.Action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.cleanAndHonest.Util.newCheckCode;

public class changeCheck extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private HttpServletRequest request ;
	private String chcode;
	private newCheckCode checkCode = new newCheckCode();

	/** 获取response对象 */  
    HttpServletResponse response = ServletActionContext.getResponse();  
    
	public void setCheckCode(newCheckCode checkCode) {
		this.checkCode = checkCode;
	}

	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	
	public String execute() throws Exception{
		/** 获取输出out对象 */  
	    PrintWriter out = response.getWriter();
	    
		checkCode.createCode();
		chcode=checkCode.getValcode();
		Map<String,Object> session = ActionContext.getContext().getSession();
		session.put("valcode",chcode);
		//request.setAttribute("valcode2", chcode);
		//System.out.println(code.getValcode());
		
        out.write(chcode);
        out.flush();
		return null;
	}
	
}