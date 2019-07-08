package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.PostDao;
import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.Query;
import com.ethan.entity.User;
import javafx.geometry.Pos;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;

import java.util.List;


public class PostDaoImpl extends BaseDao implements PostDao {


    @Override
    public List<Post> findAllPost(DetachedCriteria detachedCriteria, PageBean pageBean) {
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
        return (List<Post>) list;
    }

    @Override
    public Integer postCount(DetachedCriteria detachedCriteria) {
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
    public Post findById(Post post) {
        return this.getHibernateTemplate().get(Post.class, post.getPost_id());
    }

    @Override
    public Boolean delPostByUser(User user, Post post) {
        User u = this.getHibernateTemplate().get(User.class,user.getUser_id());
        Post p = this.getHibernateTemplate().get(Post.class,post.getPost_id());
        if (u!=null) {
            this.getHibernateTemplate().delete(p);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean delPost(Post post) {
        post = this.getHibernateTemplate().get(Post.class,post.getPost_id());
        this.getHibernateTemplate().delete(post);
        return true;
    }

    @Override
    public Boolean addPost(Post post) {
        this.getHibernateTemplate().save(post);
        return true;
    }

}
