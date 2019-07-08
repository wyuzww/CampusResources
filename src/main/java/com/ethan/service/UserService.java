package com.ethan.service;

import com.ethan.entity.PageBean;
import com.ethan.entity.Resource;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;


public interface UserService {
    User login(User user);

    User findById(User user);

    Boolean updateUser(User user);

    Boolean updatePwd(User user,String new_password);

    PageBean<User> findAllUser(DetachedCriteria detachedCriteria, PageBean pageBean);

    Boolean delFollow(User follow_user ,User followed_user);

    Boolean addFollow(User follow_user,User followed_user);

    Boolean checkFollow(User follow_user,User followed_user);

    Boolean addUser(User user);

    Boolean delUser(User user);

    Boolean approveUser(User user);
}
