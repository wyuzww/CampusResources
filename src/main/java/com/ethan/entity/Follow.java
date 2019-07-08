package com.ethan.entity;

public class Follow {

    private String follow_uid;
    private String followed_uid;

    public String getFollow_uid() {
        return follow_uid;
    }

    public void setFollow_uid(String follow_uid) {
        this.follow_uid = follow_uid;
    }

    public String getFollowed_uid() {
        return followed_uid;
    }

    public void setFollowed_uid(String followed_uid) {
        this.followed_uid = followed_uid;
    }

    @Override
    public String toString() {
        return "Follow{" +
                "follow_uid='" + follow_uid + '\'' +
                ", followed_uid='" + followed_uid + '\'' +
                '}';
    }
}
