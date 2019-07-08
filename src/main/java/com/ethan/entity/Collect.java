package com.ethan.entity;

public class Collect {

    private String collect_uid;
    private Integer collect_rid;

    public String getCollect_uid() {
        return collect_uid;
    }

    public void setCollect_uid(String collect_uid) {
        this.collect_uid = collect_uid;
    }

    public Integer getCollect_rid() {
        return collect_rid;
    }

    public void setCollect_rid(Integer collect_rid) {
        this.collect_rid = collect_rid;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collect_uid='" + collect_uid + '\'' +
                ", collect_rid=" + collect_rid +
                '}';
    }
}
