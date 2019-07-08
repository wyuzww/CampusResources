package com.ethan.service.impl;


import com.ethan.dao.CategoryDao;
import com.ethan.entity.Category;
import com.ethan.entity.PageBean;
import com.ethan.service.CategoryService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Resource(name = "categoryDao")
    private CategoryDao categoryDao;

    @Override
    public PageBean<Category> findAllCategory(DetachedCriteria detachedCriteria, PageBean pageBean , Integer order) {
        List<Category> list = null;
        switch (order) {
            case 0:
                list = categoryDao.findAllCategory(detachedCriteria, pageBean,order);
                pageBean.setList(list);
                break;
            case 1:
                Integer items = categoryDao.cateCount(detachedCriteria);
                pageBean.setItems(items);
                Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize());
                pageBean.setPageNumber(num.intValue());
                list = categoryDao.findAllCategory(detachedCriteria, pageBean,order);
                pageBean.setList(list);
                break;
        }
        return pageBean;
    }

    @Override
    public Category findById(Category category) {
        return categoryDao.findById(category);
    }

    @Override
    public Boolean addCate(Category category) {
        return categoryDao.addCate(category);
    }

    @Override
    public Boolean updateCate(Category category) {
        return categoryDao.updateCate(category);
    }
}
