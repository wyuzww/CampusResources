package com.ethan.dao.impl;

import com.ethan.dao.BaseDao;
import com.ethan.dao.CommentDao;
import com.ethan.entity.Comment;
import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.utils.StringUtil;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;


public class CommentDaoImpl extends BaseDao implements CommentDao {


    @Override
    public List<Comment> findAllComment(DetachedCriteria detachedCriteria, PageBean pageBean) {
        List<?> list =  this.getHibernateTemplate().findByCriteria(detachedCriteria,(pageBean.getCurPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
        return (List<Comment>) list;
    }

    @Override
    public Integer commentCount(DetachedCriteria detachedCriteria) {
        return super.count(detachedCriteria);
    }

    @Override
    public Boolean saveComment(Comment comment) {
        Post post = this.getHibernateTemplate().get(Post.class,comment.getComment_post().getPost_id());
        comment.setComment_post(post);
        Integer comment_id = (Integer) this.getHibernateTemplate().save(comment);
        if (StringUtil.isNotEmpty(String.valueOf(comment_id))) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean delComment(Comment comment) {
        comment = this.getHibernateTemplate().get(Comment.class,comment.getComment_id());
        this.getHibernateTemplate().delete(comment);
        return true;
    }
}
