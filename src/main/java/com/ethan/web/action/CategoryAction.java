package com.ethan.web.action;

import com.ethan.entity.Category;
import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.Query;
import com.ethan.service.CategoryService;
import com.ethan.service.PostService;
import com.ethan.utils.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


public class CategoryAction extends ActionSupport implements ModelDriven<Category> {
    // 模型驱动使用的对象:
    private Category category = new Category();
    public Category getModel() {
        return category;
    }
    // categoryService:
    @javax.annotation.Resource(name = "categoryService")
    private CategoryService categoryService;

    private Query query = new Query();
    public Query getQuery() {
        return query;
    }
    public void setQuery(Query query) {
        this.query = query;
    }

    private Integer page = 1;
    private Integer rows = 8;
    public void setPage(Integer page) {
        if (page == null) {
            page = 1;
        }
        this.page = page;
    }
    public void setRows(Integer rows) {
        if (rows == null) {
            rows = 8;
        }
        this.rows = rows;
    }

    public String all() {

        return NONE;

    }





}
