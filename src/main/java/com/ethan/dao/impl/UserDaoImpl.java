package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.UserDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Student;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;


import java.io.Serializable;
import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {

    @Override
    public User login(User user){
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);

        detachedCriteria.add(Restrictions.eq("user_id", user.getUser_id()));
        detachedCriteria.add(Restrictions.eq("user_password", user.getUser_password()));
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria);

        if (list.size()>0) {
            return (User) list.get(0);
        }
        else
            return null;
    }

    @Override
    public User findById(User user) {
        User result = this.getHibernateTemplate().get(User.class,user.getUser_id());
        return result;
    }

    @Override
    public Boolean updateUser(User user) {
        User u = findById(user);
        currentSession().clear();
        if (user.getUser_student()!=null) {
            user.getUser_student().setStudent_id(user.getUser_id());
            u.setUser_student(user.getUser_student());
            user.getUser_student().setStudent_user(u);
        } else if (user.getUser_teacher()!=null) {
            user.getUser_teacher().setTeacher_id(user.getUser_id());
            u.setUser_teacher(user.getUser_teacher());
            user.getUser_teacher().setTeacher_user(u);
        }
        this.getHibernateTemplate().update(u);
        return true;
    }

    @Override
    public Boolean updatePwd(User user) {
        User u = findById(user);
        u.setUser_password(user.getUser_password());
        this.getHibernateTemplate().update(u);
        return true;
    }

    @Override
    public List<User> findAllUser(DetachedCriteria detachedCriteria, PageBean pageBean) {
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
        return (List<User>) list;
    }

    @Override
    public Integer userCount(DetachedCriteria detachedCriteria) {
        return super.count(detachedCriteria);
    }

    @Override
    public Boolean delFollow(User follow_user, User followed_user) {
        User u1 = this.getHibernateTemplate().get(User.class,follow_user.getUser_id());
        User u2 = this.getHibernateTemplate().get(User.class,followed_user.getUser_id());
        return u1.getUser_followUserSet().remove(u2);
    }

    @Override
    public Boolean addFollow(User follow_user, User followed_user) {
        follow_user = this.getHibernateTemplate().get(User.class,follow_user.getUser_id());
        followed_user = this.getHibernateTemplate().get(User.class,followed_user.getUser_id());
        return follow_user.getUser_followUserSet().add(followed_user );
    }

    @Override
    public Boolean checkFollow(User follow_user, User followed_user) {
        follow_user = this.getHibernateTemplate().get(User.class,follow_user.getUser_id());
        followed_user = this.getHibernateTemplate().get(User.class,followed_user.getUser_id());
        return follow_user.getUser_followUserSet().contains(followed_user );
    }

    @Override
    public Boolean addUser(User user) {
        String user_id = (String) this.getHibernateTemplate().save(user);
        if (user.getUser_id().equals(user_id)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean delUser(User user) {
        user = this.getHibernateTemplate().get(User.class,user.getUser_id());
        this.getHibernateTemplate().delete(user);
        return true;
    }

}
