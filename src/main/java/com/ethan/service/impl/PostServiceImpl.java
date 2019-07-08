package com.ethan.service.impl;

import com.ethan.dao.PostDao;
import com.ethan.entity.*;
import com.ethan.service.PostService;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Transactional
public class PostServiceImpl implements PostService {
    // 注入DAO;
    @javax.annotation.Resource(name = "postDao")
    private PostDao postDao;

    @Override
    public PageBean<Post> findAllPost(DetachedCriteria detachedCriteria, PageBean pageBean) {
        Integer items = postDao.postCount(detachedCriteria);
        pageBean.setItems(items);
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());
        List<Post> list = postDao.findAllPost(detachedCriteria, pageBean);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public Post findById(Post post,PageBean pageBean,Integer pageSize) {

        Post result = postDao.findById(post);
        pageBean.setPageSize(result.getPost_commentSet().size()/(pageBean.getCurPage()*pageSize)>0?pageSize:result.getPost_commentSet().size() - (pageBean.getCurPage()-1)*pageSize);
        pageBean.setItems(result.getPost_commentSet().size());
        Double num  = Math.ceil( pageBean.getItems()*1.0/pageBean.getPageSize() );
        pageBean.setPageNumber(num.intValue());

        List<Comment> list = new ArrayList<Comment>();
        list.addAll(result.getPost_commentSet());
        Collections.sort(list, new Comparator<Comment>() {
            @Override
            public int compare(Comment o1, Comment o2) {
                if (o1.getComment_time().before(o2.getComment_time())) return 1;
                else {
                    return o2.getComment_id()-o1.getComment_id();
                }
            }
        });

        list = list.subList((pageBean.getCurPage() - 1) * pageBean.getPageSize(),(pageBean.getCurPage() - 1) * pageBean.getPageSize()+pageBean.getPageSize());
        pageBean.setList(list);

        return result;
    }

    @Override
    public Boolean delPostByUser(User user, Post post) {
        return postDao.delPostByUser(user,post);
    }

    @Override
    public Boolean delPost(Post post) {
        return postDao.delPost(post);
    }

    @Override
    public Boolean addPost(Post post) {
        return postDao.addPost(post);
    }

}
