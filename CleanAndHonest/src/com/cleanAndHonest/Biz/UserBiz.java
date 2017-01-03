package com.cleanAndHonest.Biz;

import java.util.List;

import com.cleanAndHonest.orm.User;

public interface UserBiz {
	public List<User> login(User user);
}
