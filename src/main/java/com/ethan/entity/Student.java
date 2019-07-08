package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Student {

    private String student_id;
    private String student_name;
    private String student_sex;
    @JSONField(format = "yyyy-MM-dd")
    private Date student_birth;
    private String student_class;
    private String student_desc;
    @JSONField(serialize = false)
    private User student_user;


    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_sex() {
        return student_sex;
    }

    public void setStudent_sex(String student_sex) {
        this.student_sex = student_sex;
    }

    public Date getStudent_birth() {
        return student_birth;
    }

    public void setStudent_birth(Date student_birth) {
        this.student_birth = student_birth;
    }

    public String getStudent_class() {
        return student_class;
    }

    public void setStudent_class(String student_class) {
        this.student_class = student_class;
    }

    public String getStudent_desc() {
        return student_desc;
    }

    public void setStudent_desc(String student_desc) {
        this.student_desc = student_desc;
    }

    public User getStudent_user() {
        return student_user;
    }

    public void setStudent_user(User student_user) {
        this.student_user = student_user;
    }

    @Override
    public String toString() {
        return "Student{" +
                "student_id='" + student_id + '\'' +
                ", student_name='" + student_name + '\'' +
                ", student_sex='" + student_sex + '\'' +
                ", student_birth=" + student_birth +
                ", student_class='" + student_class + '\'' +
                ", student_desc='" + student_desc + '\'' +
//                ", student_user=" + student_user +
                '}';
    }
}
