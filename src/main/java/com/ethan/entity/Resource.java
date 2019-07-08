package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Resource {

    private Integer resource_id;
    private String resource_name;
    private String resource_image;
    private String resource_url;
    private String resource_desc;
    private String resource_level;
    @JSONField(format = "yyyy-MM-dd")
    private Date resource_time;
    private Integer resource_good;
    private User resource_uploadUser;
    @JSONField(serialize = false)
    private Set<User> resource_collectUserSet = new HashSet<User>();
    private Category resource_category;


    public Integer getResource_id() {
        return resource_id;
    }

    public void setResource_id(Integer resource_id) {
        this.resource_id = resource_id;
    }

    public String getResource_name() {
        return resource_name;
    }

    public void setResource_name(String resource_name) {
        this.resource_name = resource_name;
    }

    public String getResource_image() {
        return resource_image;
    }

    public void setResource_image(String resource_image) {
        this.resource_image = resource_image;
    }

    public String getResource_url() {
        return resource_url;
    }

    public void setResource_url(String resource_url) {
        this.resource_url = resource_url;
    }

    public String getResource_desc() {
        return resource_desc;
    }

    public void setResource_desc(String resource_desc) {
        this.resource_desc = resource_desc;
    }

    public String getResource_level() {
        return resource_level;
    }

    public void setResource_level(String resource_level) {
        this.resource_level = resource_level;
    }

    public Date getResource_time() {
        return resource_time;
    }

    public void setResource_time(Date resource_time) {
        this.resource_time = resource_time;
    }

    public Integer getResource_good() {
        return resource_good;
    }

    public void setResource_good(Integer resource_good) {
        this.resource_good = resource_good;
    }

    public User getResource_uploadUser() {
        return resource_uploadUser;
    }

    public void setResource_uploadUser(User resource_uploadUser) {
        this.resource_uploadUser = resource_uploadUser;
    }

    public Set<User> getResource_collectUserSet() {
        return resource_collectUserSet;
    }

    public void setResource_collectUserSet(Set<User> resource_collectUserSet) {
        this.resource_collectUserSet = resource_collectUserSet;
    }

    public Category getResource_category() {
        return resource_category;
    }

    public void setResource_category(Category resource_category) {
        this.resource_category = resource_category;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "resource_id=" + resource_id +
                ", resource_name='" + resource_name + '\'' +
                ", resource_image='" + resource_image + '\'' +
                ", resource_url='" + resource_url + '\'' +
                ", resource_desc='" + resource_desc + '\'' +
                ", resource_level='" + resource_level + '\'' +
                ", resource_time=" + resource_time +
                ", resource_good=" + resource_good +
                ", resource_uploadUser=" + resource_uploadUser +
//                ", resource_collectUserSet=" + resource_collectUserSet +
                ", resource_category=" + resource_category +
                '}';
    }
}
