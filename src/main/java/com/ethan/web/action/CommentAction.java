package com.ethan.web.action;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.Comment;
import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.User;
import com.ethan.service.CommentService;
import com.ethan.utils.ResponseUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class CommentAction extends ActionSupport implements ModelDriven<Comment> {
    // 模型驱动使用的对象:
    private Comment comment = new Comment();
    public Comment getModel() {
        return comment;
    }
    // commentService:
    @javax.annotation.Resource(name = "commentService")
    private CommentService commentService;


    public String all() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Comment.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(1);
        pageBean.setPageSize(8);
        List<Comment> list = commentService.findAllComment(detachedCriteria, pageBean).getList();
        System.out.println(list);
        return NONE;
    }

    public String add() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String pid = ServletActionContext.getRequest().getParameter("pid");
        Post post = new Post();
        post.setPost_id(Integer.valueOf(pid));

        comment.setComment_user((User) ActionContext.getContext().getSession().get("currentUser"));
        comment.setComment_post(post);
        comment.setComment_time(new Date());

        if (commentService.saveComment(comment)) {
            map.put("code", "success");
//            ActionContext.getContext().put("success","评论成功!");
        } else {
            map.put("code", "failed");
//            ActionContext.getContext().put("failed","评论失败!");
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
                result = null;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        return NONE;
    }


}
