package com.ethan.service;


import com.ethan.entity.Category;
import com.ethan.entity.Comment;
import com.ethan.entity.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface CommentService {
//    public List<AllEntity> allComment(Post post) throws SQLException;
//
//    public int addComment(Comment comment) throws SQLException;
//
//    public long allCommentCount() throws SQLException;
//
//    public List<AllEntity> allCommentList(PageBean pagination) throws SQLException;
//
//    public int delComment(Comment comment) throws SQLException;

    PageBean<Comment> findAllComment(DetachedCriteria detachedCriteria, PageBean pageBean);

    Boolean saveComment(Comment comment);

    Boolean delComment(Comment comment);



}
