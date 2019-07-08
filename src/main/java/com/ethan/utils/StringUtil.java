package com.ethan.utils;

public class StringUtil {

    public static boolean isEmpty(String str) {
        if ("".equals(str) || str == null) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isNotEmpty(String str) {
        if (!"".equals(str) && str != null) {
            return true;
        } else {
            return false;
        }
    }

    public static String getBorrowCardId(int id) {
        if (id > 0 && id < 10) {
            return "WYU" + id + ("" + System.currentTimeMillis()).toString().substring(3, 5) + ("" + System.currentTimeMillis()).toString().substring(9, 12);
        } else if (id >= 10 && id < 100) {
            return "WYU" + id + ("" + System.currentTimeMillis()).toString().substring(4, 5) + ("" + System.currentTimeMillis()).toString().substring(9, 12);
        } else {
            return "WYU" + id + ("" + System.currentTimeMillis()).toString().substring(5, 5) + ("" + System.currentTimeMillis()).toString().substring(9, 12);
        }
    }
}
