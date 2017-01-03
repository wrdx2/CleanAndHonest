package com.cleanAndHonest.Biz.Impl;

import java.util.List;

import com.cleanAndHonest.Biz.UserBiz;
import com.cleanAndHonest.DAO.BaseDAO;
import com.cleanAndHonest.orm.User;

public class UserBizImpl implements UserBiz {
	BaseDAO<User> baseDAO;

	public void setBaseDAO(BaseDAO<User> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Override
	public List<User> login(User user) {
		// TODO Auto-generated method stub
		//System.out.println(user.getUno());
		return baseDAO.find("select new com.cleanAndHonest.orm.User(uno,uname, usex, ubirthday,tipProblem,answer, upassword,utel,office, email, synopsis,authority) from User where uno = ? and upassword = ?",new Object []{user.getUno(),user.getUpassword()});
	}
	
}
