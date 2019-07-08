package com.ethan.dao;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class BaseDao extends HibernateDaoSupport {

    @Autowired
    public void setMySessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    public Integer count(DetachedCriteria detachedCriteria) {
        detachedCriteria.setProjection(Projections.rowCount());
        List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
        detachedCriteria.setProjection(null);
        detachedCriteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
        if(list.size() > 0){
            return list.get(0).intValue();
        }
        return 0;
    }
}
