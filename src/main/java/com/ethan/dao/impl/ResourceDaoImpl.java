package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.ResourceDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Resource;
import com.ethan.entity.User;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;


import java.io.Serializable;
import java.util.List;


public class ResourceDaoImpl extends BaseDao implements ResourceDao {


    @Override
    public List<Resource> findAllResource(DetachedCriteria detachedCriteria, PageBean pageBean) {
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
        return (List<Resource>) list;
    }

    @Override
    public Integer resCount(DetachedCriteria detachedCriteria) {
//        detachedCriteria.setProjection(Projections.rowCount());
//        List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
//        detachedCriteria.setProjection(null);
//        detachedCriteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
//        if(list.size() > 0){
//            return list.get(0).intValue();
//        }
//        return 0;
        return super.count(detachedCriteria);
    }

    @Override
    public Resource findById(Resource resource) {
        return this.getHibernateTemplate().get(Resource.class, resource.getResource_id());
    }

    @Override
    public Boolean addCollect(User user ,Resource resource) {
        User u = this.getHibernateTemplate().get(User.class,user.getUser_id());
        Resource r = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        return u.getUser_collectResourceSet().add(r);
    }

    @Override
    public Boolean checkCollect(User user,Resource resource) {
        User u = this.getHibernateTemplate().get(User.class,user.getUser_id());
        Resource r = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        return u.getUser_collectResourceSet().contains(r);
    }

    @Override
    public Boolean delResByUser(User user, Resource resource) {
        User u = this.getHibernateTemplate().get(User.class,user.getUser_id());
        Resource r = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        if (u!=null) {
            this.getHibernateTemplate().delete(r);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean delCollect(User user, Resource resource) {
        User u = this.getHibernateTemplate().get(User.class,user.getUser_id());
        Resource r = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        return u.getUser_collectResourceSet().remove(r);
    }

    @Override
    public Boolean addRes(Resource resource) {
        this.getHibernateTemplate().save(resource);
        return true;
    }

    @Override
    public Boolean updateRes(Resource resource) {
        resource = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        resource.setResource_good(1);
        this.getHibernateTemplate().update(resource);
        return true;
    }

    @Override
    public Boolean delRes(Resource resource) {
        resource = this.getHibernateTemplate().get(Resource.class,resource.getResource_id());
        this.getHibernateTemplate().delete(resource);
        return true;
    }
}
