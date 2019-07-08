package com.ethan.service;


import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.Query;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface PostService {
//    public List<AllEntity> allPost(AllEntity allEntity, PageBean pagination) throws SQLException;
//
//    public int addPost(Post post) throws SQLException;
//
//    public int delPost(Post post) throws SQLException;
//
//    public long postCount(AllEntity allEntity) throws SQLException;

    PageBean<Post> findAllPost(DetachedCriteria detachedCriteria, PageBean pageBean);

    Post findById(Post post,PageBean pageBean,Integer pageSize);

    Boolean delPostByUser(User user, Post post);

    Boolean delPost(Post post);

    Boolean addPost(Post post);

}
