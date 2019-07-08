package com.ethan.service;


import com.ethan.entity.Category;
import com.ethan.entity.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface CategoryService {
//    public List<Category> allCategory(Category category) throws SQLException;
//
//    public List<Category> allCategoryList(Category category, PageBean pagination) throws SQLException;
//
//    public int addCategory(Category category)throws SQLException;
//
//    public int delCategory(Category category) throws SQLException;
//
//    public int updateCateGory(Category category) throws SQLException;
//
//    public long categoryCount(Category category)throws SQLException;

    PageBean<Category> findAllCategory(DetachedCriteria detachedCriteria, PageBean pageBean , Integer order);

    Category findById(Category category);

    Boolean addCate(Category category);

    Boolean updateCate(Category category);

}
