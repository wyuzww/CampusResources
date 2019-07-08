package com.ethan.web.action;

import com.ethan.entity.*;
import com.ethan.service.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;

import javax.annotation.Resource;
import java.util.List;

public class RegisterAction extends ActionSupport implements ModelDriven<Register> {
    // 模型驱动使用的对象:
    private Register register = new Register();
    public Register getModel() {
        return register;
    }
    // registerService:
    @Resource(name = "registerService")
    private RegisterService registerService;

    public String register() {

        String register_password_confirm = ServletActionContext.getRequest().getParameter("register_password_confirm");
        register.setRegister_name(register.getRegister_id());
        register.setRegister_check(0);
        if (!register_password_confirm.equals(register.getRegister_password())) {
            ActionContext.getContext().put("error","两次密码不一致!");
        }
        else if (registerService.checkUser(register.getRegister_id())) {
            ActionContext.getContext().put("error","该帐号已存在!");
        }
        else if (registerService.userRegister(register)) {
            ActionContext.getContext().put("msg","提交成功!等待管理员审核!");
        } else {
            ActionContext.getContext().put("error","注册失败，请联系管理员!");
        }
        ActionContext.getContext().put("inputRegister",register);
        ActionContext.getContext().put("register_password_confirm",register_password_confirm);

        return INPUT;
    }

}
