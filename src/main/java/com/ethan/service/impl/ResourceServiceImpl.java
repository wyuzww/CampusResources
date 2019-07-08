package com.ethan.service.impl;

import com.ethan.dao.ResourceDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Resource;
import com.ethan.entity.User;
import com.ethan.service.ResourceService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Transactional
public class ResourceServiceImpl implements ResourceService {
    // 注入DAO;
    @javax.annotation.Resource(name = "resourceDao")
    private ResourceDao resourceDao;

    @Override
    public PageBean<Resource> findAllResource(DetachedCriteria detachedCriteria, PageBean pageBean) {
        Integer items = resourceDao.resCount(detachedCriteria);
        pageBean.setItems(items);
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());
        List<Resource> list = resourceDao.findAllResource(detachedCriteria, pageBean);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public Resource findById(Resource resource) {
        return resourceDao.findById(resource);
    }

    @Override
    public Boolean addCollect(User user,Resource resource) {
        return resourceDao.addCollect(user,resource);
    }

    @Override
    public Boolean checkCollect(User user,Resource resource) {
        return resourceDao.checkCollect(user,resource);
    }

    @Override
    public Boolean delResByUser(User user, Resource resource) {
        return resourceDao.delResByUser(user,resource);
    }

    @Override
    public Boolean delCollect(User user, Resource resource) {
        return resourceDao.delCollect(user,resource);
    }

    @Override
    public Boolean addRes(Resource resource) {
        return resourceDao.addRes(resource);
    }

    @Override
    public Boolean updateRes(Resource resource) {
        return resourceDao.updateRes(resource);
    }

    @Override
    public Boolean delRes(Resource resource) {
        return resourceDao.delRes(resource);
    }
}
