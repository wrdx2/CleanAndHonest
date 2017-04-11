package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.cleanAndHonest.Biz.UserBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.User;

public class UserBizImpl implements UserBiz {
	BaseDAO<User> baseDAO;

	@Override
	public boolean login(User user) {
		// TODO Auto-generated method stub
		//System.out.println(user.getUno());
		boolean flag = false;
		String hql = "select ";
		hql +="new com.cleanAndHonest.orm.User ";
		hql +="(uno,uname, usex, ubirthday,tipProblem,answer, upassword,utel,office, email, synopsis,authority) ";
		hql += "from User where uno = ? and upassword = ?";
		List<User> list = baseDAO.find(hql ,new Object []{user.getUno(),user.getUpassword()});
		
		if(list.size() > 0){
			ServletActionContext.getRequest().getSession().setAttribute("uName", list.get(0).getUname());
			ServletActionContext.getRequest().getSession().setAttribute("uOffi", list.get(0).getOffice());
			/*ActionContext.getContext().put("uname", list.get(0));
			ActionContext.getContext().put("uoffi", "qweqewqweq");*/
			flag = true;
		}
		
		return flag;
	}

	public void setBaseDAO(BaseDAO<User> baseDAO) {
		this.baseDAO = baseDAO;
	}
}
