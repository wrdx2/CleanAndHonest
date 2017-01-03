package com.cleanAndHonest.Action;

import java.util.List;
import java.util.Map;

import com.cleanAndHonest.orm.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.cleanAndHonest.Biz.UserBiz;

public class LoginManagerAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String loginName;
	private String loginPassword;
	
	//Map<String, Object> session = getSession();
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	private UserBiz userBiz;

	public void setUserBiz(UserBiz managerBiz) {
		this.userBiz = managerBiz;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		User man = new User();
		
		man.setUno(loginName);
		man.setUpassword(loginPassword);
		//System.out.println(man.getUno());
		List<User> list = userBiz.login(man);
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if(list.size() > 0){
			session.put("user", list.get(0));
			return "success";
		} else {
			return "error";
		}
	}
	
}
