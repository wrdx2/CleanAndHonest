package com.cleanAndHonest.Biz;

import com.cleanAndHonest.orm.User;

public interface UserBiz {
	/**
	 * 用户登录
	 * @param user 用户信息
	 * @return 登陆成功返回true
	 */
	public boolean login(User user);
}
