package com.ethan.service.impl;

import com.ethan.dao.CommentDao;
import com.ethan.entity.Category;
import com.ethan.entity.Comment;
import com.ethan.entity.PageBean;
import com.ethan.service.CommentService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class CommentServiceImpl implements CommentService {
    // 注入DAO;
    @javax.annotation.Resource(name = "commentDao")
    private CommentDao commentDao;

    @Override
    public PageBean<Comment> findAllComment(DetachedCriteria detachedCriteria, PageBean pageBean) {
        Integer items = commentDao.commentCount(detachedCriteria);
        pageBean.setItems(items);
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());
        List<Comment> list = commentDao.findAllComment(detachedCriteria, pageBean);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public Boolean saveComment(Comment comment) {
        return commentDao.saveComment(comment);
    }

    @Override
    public Boolean delComment(Comment comment) {
        return commentDao.delComment(comment);
    }



}
