package com.ethan.dao;

import com.ethan.entity.PageBean;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface UserDao {
    User login(User user);

    User findById(User user);

    Boolean updateUser(User user);

    Boolean updatePwd(User user);

    List<User> findAllUser(DetachedCriteria detachedCriteria, PageBean pageBean);

    Integer userCount(DetachedCriteria detachedCriteria);

    Boolean delFollow(User follow_user ,User followed_user);

    Boolean addFollow(User follow_user,User followed_user);

    Boolean checkFollow(User follow_user,User followed_user);

    Boolean addUser(User user);

    Boolean delUser(User user);

}
