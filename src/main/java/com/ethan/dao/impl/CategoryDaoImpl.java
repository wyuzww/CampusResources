package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.CategoryDao;
import com.ethan.entity.Category;
import com.ethan.entity.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public class CategoryDaoImpl extends BaseDao implements CategoryDao {
    @Override
    public List<Category> findAllCategory(DetachedCriteria detachedCriteria, PageBean pageBean , Integer order) {
        List<?> list = null;
        switch (order) {
            case 0:
                list =  this.getHibernateTemplate().findByCriteria(detachedCriteria);
                break;
            case 1:
                list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
                break;
                default:;
        }
        return (List<Category>) list;
    }

    @Override
    public Integer cateCount(DetachedCriteria detachedCriteria) {
        return super.count(detachedCriteria);
    }

    @Override
    public Category findById(Category category) {
        return this.getHibernateTemplate().get(Category.class,category.getCategory_id());
    }

    @Override
    public Boolean addCate(Category category) {
        Integer integer = (Integer) this.getHibernateTemplate().save(category);
        if (integer!=null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean updateCate(Category category) {
        category  = this.getHibernateTemplate().get(Category.class,category.getCategory_id());
        this.getHibernateTemplate().update(category);
        return true;
    }
}
