package com.ethan.entity;

public class Register {

    private String register_id;
    private String register_password;
    private String register_name;
    private String register_class;
    private String register_level;
    private Integer register_check;

    public String getRegister_id() {
        return register_id;
    }

    public void setRegister_id(String register_id) {
        this.register_id = register_id;
    }

    public String getRegister_password() {
        return register_password;
    }

    public void setRegister_password(String register_password) {
        this.register_password = register_password;
    }

    public String getRegister_name() {
        return register_name;
    }

    public void setRegister_name(String register_name) {
        this.register_name = register_name;
    }

    public String getRegister_class() {
        return register_class;
    }

    public void setRegister_class(String register_class) {
        this.register_class = register_class;
    }

    public String getRegister_level() {
        return register_level;
    }

    public void setRegister_level(String register_level) {
        this.register_level = register_level;
    }

    public Integer getRegister_check() {
        return register_check;
    }

    public void setRegister_check(Integer register_check) {
        this.register_check = register_check;
    }

    @Override
    public String toString() {
        return "Register{" +
                "register_id='" + register_id + '\'' +
                ", register_password='" + register_password + '\'' +
                ", register_name='" + register_name + '\'' +
                ", register_class='" + register_class + '\'' +
                ", register_level='" + register_level + '\'' +
                ", register_check=" + register_check +
                '}';
    }
}
