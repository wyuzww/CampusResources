package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.RegisterDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Register;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;


public class RegisterDaoImpl extends BaseDao implements RegisterDao {

    @Override
    public Boolean userRegister(Register register) {
        String user_id = (String) this.getHibernateTemplate().save(register);
        if (register.getRegister_id().equals(user_id)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean checkUser(String user_id) {
        User user = this.getHibernateTemplate().get(User.class,user_id);
        Register register = this.getHibernateTemplate().get(Register.class,user_id);
        if (user != null || register != null ) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Register approveRegister(String user_id) {
        Register register = this.getHibernateTemplate().get(Register.class,user_id);
        register.setRegister_check(1);
        return register;
    }

    @Override
    public List<Register> findAllRegister(DetachedCriteria detachedCriteria, PageBean pageBean) {
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
        return (List<Register>) list;
    }

    @Override
    public Integer registerCount(DetachedCriteria detachedCriteria) {
        return super.count(detachedCriteria);
    }
}
