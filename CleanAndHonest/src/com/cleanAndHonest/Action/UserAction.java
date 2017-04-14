package com.cleanAndHonest.Action;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Biz.UserBiz;
import com.cleanAndHonest.orm.User;

public class UserAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loginName;
	private String loginPassword;
	
	private UserBiz userBiz;
	
	/**
	 * 用户登录
	 * @return 登陆状态
	 * @throws Exception
	 */
	public String login() {
		// TODO Auto-generated method stub
		User man = new User();
		
		man.setUno(loginName);
		man.setUpassword(loginPassword);
		//System.out.println(man.getUno());
		
		//Map<String, Object> session = ActionContext.getContext().getSession();
		
		if(userBiz.login(man)){
			//session.put("user", loginName);
			return "loginSuccess";
		} else {
			return "loginError";
		}
	}
	
	public String logout(){
		/*session.removeAttribute("uName");
		session.removeAttribute("uOffi");*/
		session.invalidate();
		//session.setAttribute(Constants.SESSION_USERNAME, null);
		
		return "logout";
	}
	
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

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
}
