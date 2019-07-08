package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class Comment {

    private Integer comment_id;
    private String comment_text;
    @JSONField(format = "yyyy-MM-dd")
    private Date comment_time;
    private User comment_user;
    private Post comment_post;

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_text() {
        return comment_text;
    }

    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }

    public Date getComment_time() {
        return comment_time;
    }

    public void setComment_time(Date comment_time) {
        this.comment_time = comment_time;
    }

    public User getComment_user() {
        return comment_user;
    }

    public void setComment_user(User comment_user) {
        this.comment_user = comment_user;
    }

    public Post getComment_post() {
        return comment_post;
    }

    public void setComment_post(Post comment_post) {
        this.comment_post = comment_post;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", comment_text='" + comment_text + '\'' +
                ", comment_time=" + comment_time +
//                ", comment_user=" + comment_user +
//                ", comment_post=" + comment_post +
                '}';
    }
}
