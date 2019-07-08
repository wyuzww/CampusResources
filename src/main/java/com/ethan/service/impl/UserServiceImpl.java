package com.ethan.service.impl;

import com.ethan.dao.RegisterDao;
import com.ethan.dao.UserDao;
import com.ethan.entity.*;
import com.ethan.service.UserService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
public class UserServiceImpl implements UserService {
    // 注入DAO;
    @Resource(name = "userDao")
    private UserDao userDao;
    @Resource(name = "registerDao")
    private RegisterDao registerDao;

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public User findById(User user) {
        return userDao.findById(user);
    }

    @Override
    public Boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public Boolean updatePwd(User user, String new_password) {
        if(login(user)!=null) {
            user.setUser_password(new_password);
            return userDao.updatePwd(user);
        } else {
            return false;
        }
    }

    @Override
    public PageBean<User> findAllUser(DetachedCriteria detachedCriteria, PageBean pageBean) {
        Integer items = userDao.userCount(detachedCriteria);
        pageBean.setItems(items);
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());
        List<User> list = userDao.findAllUser(detachedCriteria, pageBean);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public Boolean delFollow(User follow_user, User followed_user) {
        return userDao.delFollow(follow_user,followed_user);
    }

    @Override
    public Boolean addFollow(User follow_user, User followed_user) {
        return userDao.addFollow(follow_user,followed_user);
    }

    @Override
    public Boolean checkFollow(User follow_user, User followed_user) {
        return userDao.checkFollow(follow_user,followed_user);
    }

    @Override
    public Boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public Boolean delUser(User user) {
        return userDao.delUser(user);
    }

    @Override
    public Boolean approveUser(User user) {
        Register register = registerDao.approveRegister(user.getUser_id());
        user.setUser_password(register.getRegister_password());
        user.setUser_level(register.getRegister_level());

        if (register.getRegister_level().equals("学生")) {
            Student student = new Student();
            student.setStudent_id(register.getRegister_id());
            student.setStudent_name(register.getRegister_name());
            student.setStudent_class(register.getRegister_class());
            user.setUser_student(student);

        } else if (register.getRegister_level().equals("教师")){
            Teacher teacher = new Teacher();
            teacher.setTeacher_id(register.getRegister_id());
            teacher.setTeacher_name(register.getRegister_name());
            user.setUser_teacher(teacher);

        } else {
            return false;
        }

        if (userDao.addUser(user)) {
            return true;
        } else {
            return false;
        }
    }
}
