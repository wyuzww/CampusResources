package com.ethan.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.HashSet;
import java.util.Set;

public class Category {

    private Integer category_id;
    private String category_name;
    private String category_desc;
    @JSONField(serialize = false)
    private Set<Resource> category_resourceSet = new HashSet<Resource>();

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_desc() {
        return category_desc;
    }

    public void setCategory_desc(String category_desc) {
        this.category_desc = category_desc;
    }

    public Set<Resource> getCategory_resourceSet() {
        return category_resourceSet;
    }

    public void setCategory_resourceSet(Set<Resource> category_resourceSet) {
        this.category_resourceSet = category_resourceSet;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category_id=" + category_id +
                ", category_name='" + category_name + '\'' +
                ", category_desc='" + category_desc + '\'' +
//                ", category_resourceSet=" + category_resourceSet +
                '}';
    }
}
