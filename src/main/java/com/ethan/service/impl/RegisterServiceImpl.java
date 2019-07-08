package com.ethan.service.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.RegisterDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Register;
import com.ethan.service.RegisterService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
public class RegisterServiceImpl extends BaseDao implements RegisterService {

    @Resource(name = "registerDao")
    private RegisterDao registerDao;

    @Override
    public Boolean userRegister(Register register) {
        return registerDao.userRegister(register);
    }

    @Override
    public Boolean checkUser(String user_id) {
        return registerDao.checkUser(user_id);
    }

    @Override
    public PageBean<Register> findAllRegister(DetachedCriteria detachedCriteria, PageBean pageBean) {
        Integer items = registerDao.registerCount(detachedCriteria);
        pageBean.setItems(items);
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());
        List<Register> list = registerDao.findAllRegister(detachedCriteria, pageBean);
        pageBean.setList(list);
        return pageBean;
    }

}
