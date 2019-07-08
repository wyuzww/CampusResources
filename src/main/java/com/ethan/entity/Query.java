package com.ethan.entity;

public class Query {
    String query_name;
    String query_type;
    Integer query_cate = -1;

    public String getQuery_name() {
        return query_name;
    }

    public void setQuery_name(String query_name) {
        this.query_name = query_name;
    }

    public String getQuery_type() {
        return query_type;
    }

    public void setQuery_type(String query_type) {
        this.query_type = query_type;
    }

    public Integer getQuery_cate() {
        return query_cate;
    }

    public void setQuery_cate(Integer query_cate) {
        this.query_cate = query_cate;
    }

}
