package com.ethan.web.interceptor;

import com.ethan.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

public class UserPermission extends MethodFilterInterceptor {
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        User cur_User = (User) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
        if (cur_User == null) {
            ActionContext.getContext().put("unLogin","您还没有权限，请先登录！");
            return "login";
        } else {
            if ("管理员".equals(cur_User.getUser_level()) || "超级管理员".equals(cur_User.getUser_level()) ) {
                return "adminMain";
            } else {
                return actionInvocation.invoke();
            }
        }
    }
}
