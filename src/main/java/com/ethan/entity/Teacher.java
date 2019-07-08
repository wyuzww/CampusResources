package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class Teacher {
    private String teacher_id;
    private String teacher_name;
    private String teacher_sex;
    @JSONField(format = "yyyy-MM-dd")
    private Date teacher_birth;
    private String teacher_desc;
    @JSONField(serialize = false)
    private User teacher_user;

    public String getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(String teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getTeacher_sex() {
        return teacher_sex;
    }

    public void setTeacher_sex(String teacher_sex) {
        this.teacher_sex = teacher_sex;
    }

    public Date getTeacher_birth() {
        return teacher_birth;
    }

    public void setTeacher_birth(Date teacher_birth) {
        this.teacher_birth = teacher_birth;
    }

    public String getTeacher_desc() {
        return teacher_desc;
    }

    public void setTeacher_desc(String teacher_desc) {
        this.teacher_desc = teacher_desc;
    }

    public User getTeacher_user() {
        return teacher_user;
    }

    public void setTeacher_user(User teacher_user) {
        this.teacher_user = teacher_user;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teacher_id='" + teacher_id + '\'' +
                ", teacher_name='" + teacher_name + '\'' +
                ", teacher_sex='" + teacher_sex + '\'' +
                ", teacher_birth=" + teacher_birth +
                ", teacher_desc='" + teacher_desc + '\'' +
//                ", teacher_user=" + teacher_user +
                '}';
    }
}
