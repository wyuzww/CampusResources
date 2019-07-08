package com.ethan.dao;


import com.ethan.entity.Category;
import com.ethan.entity.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface CategoryDao {
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
    List<Category> findAllCategory(DetachedCriteria detachedCriteria, PageBean pageBean , Integer order);

    Integer cateCount(DetachedCriteria detachedCriteria);

    Category findById(Category category);

    Boolean addCate(Category category);

    Boolean updateCate(Category category);
}
