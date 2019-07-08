package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.HashSet;
import java.util.Set;

public class User {
    private String user_id;
    private String user_password;
    private String user_level;
    @JSONField(serialize = false)
    private Set<Post> user_postSet = new HashSet<Post>();
    @JSONField(serialize = false)
    private Set<Resource> user_uploadResourceSet = new HashSet<Resource>();
    @JSONField(serialize = false)
    private Set<Resource> user_collectResourceSet = new HashSet<Resource>();
    @JSONField(serialize = false)
    private Set<User> user_followUserSet = new HashSet<User>();
    @JSONField(serialize = false)
    private Set<User> user_followedUserSet = new HashSet<User>();
    @JSONField(serialize = false)
    private Set<Comment> user_commentSet = new HashSet<Comment>();
    private Student user_student;
    private Teacher user_teacher;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_level() {
        return user_level;
    }

    public void setUser_level(String user_level) {
        this.user_level = user_level;
    }

    public Set<Post> getUser_postSet() {
        return user_postSet;
    }

    public void setUser_postSet(Set<Post> user_postSet) {
        this.user_postSet = user_postSet;
    }

    public Set<Resource> getUser_uploadResourceSet() {
        return user_uploadResourceSet;
    }

    public void setUser_uploadResourceSet(Set<Resource> user_uploadResourceSet) {
        this.user_uploadResourceSet = user_uploadResourceSet;
    }

    public Set<Resource> getUser_collectResourceSet() {
        return user_collectResourceSet;
    }

    public void setUser_collectResourceSet(Set<Resource> user_collectResourceSet) {
        this.user_collectResourceSet = user_collectResourceSet;
    }

    public Set<User> getUser_followUserSet() {
        return user_followUserSet;
    }

    public void setUser_followUserSet(Set<User> user_followUserSet) {
        this.user_followUserSet = user_followUserSet;
    }

    public Set<Comment> getUser_commentSet() {
        return user_commentSet;
    }

    public void setUser_commentSet(Set<Comment> user_commentSet) {
        this.user_commentSet = user_commentSet;
    }

    public Student getUser_student() {
        return user_student;
    }

    public void setUser_student(Student user_student) {
        this.user_student = user_student;
    }

    public Teacher getUser_teacher() {
        return user_teacher;
    }

    public void setUser_teacher(Teacher user_teacher) {
        this.user_teacher = user_teacher;
    }

    public Set<User> getUser_followedUserSet() {
        return user_followedUserSet;
    }

    public void setUser_followedUserSet(Set<User> user_followedUserSet) {
        this.user_followedUserSet = user_followedUserSet;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_level='" + user_level + '\'' +
//                ", user_postSet=" + user_postSet +
//                ", user_uploadResourceSet=" + user_uploadResourceSet +
//                ", user_collectResourceSet=" + user_collectResourceSet.toString() +
//                ", user_followUserSet=" + user_followUserSet.toString() +
//                ", user_commentSet=" + user_commentSet.toString() +
                ", user_student=" + user_student +
                ", user_teacher=" + user_teacher +
                '}';
    }
}
