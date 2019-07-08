package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Post {
    private Integer post_id;
    private String post_title;
    private String post_text;
    private String post_image;
    @JSONField(format = "yyyy-MM-dd")
    private Date post_time;
    private User post_user;
    @JSONField(serialize = false)
    private Set<Comment> post_commentSet = new HashSet<Comment>();

    public Integer getPost_id() {
        return post_id;
    }

    public void setPost_id(Integer post_id) {
        this.post_id = post_id;
    }

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_text() {
        return post_text;
    }

    public void setPost_text(String post_text) {
        this.post_text = post_text;
    }

    public String getPost_image() {
        return post_image;
    }

    public void setPost_image(String post_image) {
        this.post_image = post_image;
    }

    public Date getPost_time() {
        return post_time;
    }

    public void setPost_time(Date post_time) {
        this.post_time = post_time;
    }

    public User getPost_user() {
        return post_user;
    }

    public void setPost_user(User post_user) {
        this.post_user = post_user;
    }

    public Set<Comment> getPost_commentSet() {
        return post_commentSet;
    }

    public void setPost_commentSet(Set<Comment> post_commentSet) {
        this.post_commentSet = post_commentSet;
    }

    @Override
    public String toString() {
        return "Post{" +
                "post_id=" + post_id +
                ", post_title='" + post_title + '\'' +
                ", post_text='" + post_text + '\'' +
                ", post_image='" + post_image + '\'' +
                ", post_time=" + post_time +
                ", post_user=" + post_user +
//                ", post_commentSet=" + post_commentSet +
                '}';
    }
}
