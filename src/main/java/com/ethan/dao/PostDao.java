package com.ethan.dao;


import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.Query;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface PostDao {

//    public List<AllEntity> allPost(AllEntity allEntity, PageBean pagination) throws SQLException;
//
//    public int addPost(Post post) throws SQLException;
//
//    public int delPost(Post post) throws SQLException;
//
//    public long postCount(AllEntity allEntity) throws SQLException;

    List<Post> findAllPost(DetachedCriteria detachedCriteria, PageBean pageBean);

    Integer postCount(DetachedCriteria detachedCriteria);

    Post findById(Post post);

    Boolean delPostByUser(User user, Post post);

    Boolean delPost(Post post);

    Boolean addPost(Post post);

}
