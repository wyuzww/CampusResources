package com.ethan.web.action;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.*;
import com.ethan.service.*;
import com.ethan.utils.ResponseUtil;
import com.ethan.utils.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserAction extends ActionSupport implements ModelDriven<User> {
    // 模型驱动使用的对象:
    private User user = new User();
    public User getModel() {
        return user;
    }
    // userService:
    @Resource(name = "userService")
    private UserService userService;
    // resourceService:
    @Resource(name = "resourceService")
    private ResourceService resourceService;
    // postService:
    @javax.annotation.Resource(name = "postService")
    private PostService postService;
    // commentService:
    @javax.annotation.Resource(name = "commentService")
    private CommentService commentService;
    // categoryService:
    @javax.annotation.Resource(name = "categoryService")
    private CategoryService categoryService;

    private Query query = new Query();
    public Query getQuery() {
        return query;
    }
    public void setQuery(Query query) {
        this.query = query;
    }

    private Integer page = 1;
    private Integer rows = 8;
    public void setPage(Integer page) {
        if (page == null) {
            page = 1;
        }
        this.page = page;
    }
    public void setRows(Integer rows) {
        if (rows == null) {
            rows = 8;
        }
        this.rows = rows;
    }


    public String login() {
        User cur_User = userService.login(user);
//        System.out.println(cur_User==null?"登录失败":cur_User.toString());

        if (cur_User == null) {
            ActionContext.getContext().put("error","帐号或密码错误！");
            ActionContext.getContext().put("inputUser",user);
            return INPUT;
        } else {
            ActionContext.getContext().getSession().put("currentUser",cur_User);
            if ("管理员".equals(cur_User.getUser_level()) || "超级管理员".equals(cur_User.getUser_level()) ) {
                return "adminMain";
            } else {
                return "userMain";
            }
        }
    }

    public String toLogin() {
        return "login";
    }

    public String main() {
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(1);
        pageBean.setPageSize(8);

        DetachedCriteria r_detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        DetachedCriteria p_detachedCriteria = DetachedCriteria.forClass(Post.class);
        DetachedCriteria c_detachedCriteria = DetachedCriteria.forClass(Comment.class);

        r_detachedCriteria.addOrder(Order.desc("resource_good"));
        r_detachedCriteria.addOrder(Order.desc("resource_id"));

        p_detachedCriteria.addOrder(Order.desc("post_id"));

        c_detachedCriteria.addOrder(Order.desc("comment_id"));

        List<com.ethan.entity.Resource> r_list = resourceService.findAllResource(r_detachedCriteria, pageBean).getList();
        List<Post> p_list = postService.findAllPost(p_detachedCriteria, pageBean).getList();
        List<Comment> c_list = commentService.findAllComment(c_detachedCriteria, pageBean).getList();

        ActionContext.getContext().put("resourceList",r_list);
        ActionContext.getContext().put("postList",p_list);
        ActionContext.getContext().put("commentList",c_list);

//        System.out.println(p_list);

        return "main";
    }

    public String register() {

        return "register";
    }

    public String exit() {
        return "exit";
    }

    public String center() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","修改成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","修改失败！");
                    break;
                    default:;
            }
        }
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");
        User result = userService.findById(currentUser);
        ActionContext.getContext().put("user",result);
        return "center";
    }

    public String updateInfo() {
        Map<String, Object> map = new HashMap();
        String result = null;

        System.out.println(user);
        if (userService.updateUser(user)) {
            map.put("code", "success");
        } else {
            map.put("code", "failed");
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
                result = null;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return NONE;
    }

    public String toUpdatePwd() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","修改成功！请重新登录！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","修改失败,密码错误！");
                    break;
                case "differ":
                    ActionContext.getContext().put("differ","两次密码不一致！");
                    break;
                default:;
            }
        }
        return "toUpdatePwd";
    }

    public String updatePwd() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String user_password_old = ServletActionContext.getRequest().getParameter("user_password_old");
        String user_password_new = ServletActionContext.getRequest().getParameter("user_password_new");
        String user_password_confirm = ServletActionContext.getRequest().getParameter("user_password_confirm");

        if (StringUtil.isNotEmpty(user_password_new) && !user_password_new.equals(user_password_confirm)) {
            map.put("code", "differ");
        } else if (StringUtil.isNotEmpty(user_password_new) && StringUtil.isNotEmpty(user_password_old) && user_password_new.equals(user_password_confirm)) {
            User u = new User();
            User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");
            u.setUser_id(currentUser.getUser_id());
            u.setUser_password(user_password_old);
            if (userService.updatePwd(u,user_password_new)) {
                map.put("code", "success");
            } else {
                map.put("code", "failed");
            }
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
                result = null;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return NONE;
    }

    public String myRes() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","删除成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","删除失败！");
                    break;
                default:;
            }
        }

        String resource_level = ServletActionContext.getRequest().getParameter("resource_level");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        DetachedCriteria r_detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        DetachedCriteria c_detachedCriteria = DetachedCriteria.forClass(Category.class);

        PageBean r_pageBean = new PageBean();
        PageBean c_pageBean = new PageBean();
        r_pageBean.setCurPage(page);
        r_pageBean.setPageSize(rows);

        if (currentUser!=null) {
            r_detachedCriteria.createAlias("resource_uploadUser", "r_user");
            r_detachedCriteria.add(Restrictions.eq("r_user.user_id", currentUser.getUser_id()));
        }
        if (StringUtil.isNotEmpty(String.valueOf(query.getQuery_cate())) && query.getQuery_cate()>0) {
            r_detachedCriteria.createAlias("resource_category", "r_category");
            r_detachedCriteria.add(Restrictions.eq("r_category.category_id", query.getQuery_cate()));
        }
        if (StringUtil.isNotEmpty(resource_level)) {
            r_detachedCriteria.add(Restrictions.like("resource_level", resource_level, MatchMode.EXACT));
            ActionContext.getContext().put("resource_level",resource_level);
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            r_detachedCriteria.add(Restrictions.like("resource_name",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        r_detachedCriteria.addOrder(Order.desc("resource_id"));


        PageBean<Category> categoryPageBean = categoryService.findAllCategory(c_detachedCriteria,c_pageBean,0);


        PageBean<com.ethan.entity.Resource> resourcePageBean = resourceService.findAllResource(r_detachedCriteria, r_pageBean);

        ActionContext.getContext().put("pageBean",resourcePageBean);
        ActionContext.getContext().put("categories",categoryPageBean.getList());

        return "myRes";
    }

    public String myPost() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","删除成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","删除失败！");
                    break;
                default:;
            }
        }

        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Post.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if (currentUser!=null) {
            detachedCriteria.createAlias("post_user", "p_user");
            detachedCriteria.add(Restrictions.eq("p_user.user_id", currentUser.getUser_id()));
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("post_title",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        detachedCriteria.addOrder(Order.desc("post_id"));

        PageBean<Post> postPageBean = postService.findAllPost(detachedCriteria, pageBean);

        ActionContext.getContext().put("pageBean",postPageBean);

        return "myPost";
    }

    public String myCollect() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","操作成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","操作失败！");
                    break;
                default:;
            }
        }
        String resource_level = ServletActionContext.getRequest().getParameter("resource_level");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        DetachedCriteria r_detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        DetachedCriteria c_detachedCriteria = DetachedCriteria.forClass(Category.class);

        PageBean r_pageBean = new PageBean();
        PageBean c_pageBean = new PageBean();
        r_pageBean.setCurPage(page);
        r_pageBean.setPageSize(rows);

        if (currentUser!=null) {
            r_detachedCriteria.createAlias("resource_collectUserSet", "r_user");
            r_detachedCriteria.add(Restrictions.eq("r_user.user_id", currentUser.getUser_id()));
        }
        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            r_detachedCriteria.createAlias("resource_uploadUser", "r_user");
            r_detachedCriteria.add(Restrictions.like("r_user.user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if (StringUtil.isNotEmpty(String.valueOf(query.getQuery_cate())) && query.getQuery_cate()>0) {
            r_detachedCriteria.createAlias("resource_category", "r_category");
            r_detachedCriteria.add(Restrictions.eq("r_category.category_id", query.getQuery_cate()));
        }
        if (StringUtil.isNotEmpty(resource_level)) {
            r_detachedCriteria.add(Restrictions.like("resource_level", resource_level, MatchMode.EXACT));
            ActionContext.getContext().put("resource_level",resource_level);
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            r_detachedCriteria.add(Restrictions.like("resource_name",query.getQuery_name(), MatchMode.ANYWHERE));
        }
//        r_detachedCriteria.addOrder(Order.desc("resource_id"));


        PageBean<Category> categoryPageBean = categoryService.findAllCategory(c_detachedCriteria,c_pageBean,0);


        PageBean<com.ethan.entity.Resource> resourcePageBean = resourceService.findAllResource(r_detachedCriteria, r_pageBean);

        ActionContext.getContext().put("pageBean",resourcePageBean);
        ActionContext.getContext().put("categories",categoryPageBean.getList());

        return "myCollect";
    }

    public String myFollow() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","操作成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","操作失败！");
                    break;
                default:;
            }
        }
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);

        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if (currentUser!=null) {
            detachedCriteria.createAlias("user_followedUserSet", "f_user");
            detachedCriteria.add(Restrictions.eq("f_user.user_id", currentUser.getUser_id()));
        }
        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            detachedCriteria.add(Restrictions.like("user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("user_id",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        detachedCriteria.addOrder(Order.desc("user_id"));

        PageBean<User> postPageBean = userService.findAllUser(detachedCriteria, pageBean);

        ActionContext.getContext().put("pageBean",postPageBean);


        return "myFollow";
    }

    public String delFollow() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String uid = ServletActionContext.getRequest().getParameter("uid");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        User u = new User();
        if (StringUtil.isNotEmpty(uid)) {
            u.setUser_id(uid);
            if (userService.delFollow(currentUser,u)) {
                map.put("code","success");
            } else {
                map.put("code","failed");
            }
        }

        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
                result = null;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return NONE;
    }

    public String personCenter() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","关注成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","关注失败!");
                    break;
                case "repeat":
                    ActionContext.getContext().put("repeat","已经关注过该用户了!");
                    break;
                default:;
            }
        }

        String uid = ServletActionContext.getRequest().getParameter("uid");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        if (currentUser.getUser_id().equals(uid)) {
            return "myCenter";
        }

        user.setUser_id(uid);
        User person = userService.findById(user);

        ActionContext.getContext().put("person",person);

        return "personCenter";
    }

    public String addFollow() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String uid = ServletActionContext.getRequest().getParameter("uid");

        if (StringUtil.isNotEmpty(uid)) {
            user.setUser_id(uid );
        }
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        if (userService.checkFollow(currentUser,user)) {
//            ActionContext.getContext().put("failed","已经收藏过该资源了!");
            map.put("code", "repeat");
        } else {
            if (userService.addFollow(currentUser,user)) {
                map.put("code", "success");
//                ActionContext.getContext().put("success","收藏成功!");
            } else {
                map.put("code", "failed");
//                ActionContext.getContext().put("failed","收藏失败!");
            }
        }
        result = JSON.toJSONString(map);
        map.clear();
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
                result = null;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return NONE;
    }

    public String personRes() {

        String resource_level = ServletActionContext.getRequest().getParameter("resource_level");
        String uid = ServletActionContext.getRequest().getParameter("uid");

        DetachedCriteria r_detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        DetachedCriteria c_detachedCriteria = DetachedCriteria.forClass(Category.class);

        PageBean r_pageBean = new PageBean();
        PageBean c_pageBean = new PageBean();
        r_pageBean.setCurPage(page);
        r_pageBean.setPageSize(rows);

        if (StringUtil.isNotEmpty(uid)) {
            r_detachedCriteria.createAlias("resource_uploadUser", "r_user");
            r_detachedCriteria.add(Restrictions.eq("r_user.user_id", uid));
        }
        if (StringUtil.isNotEmpty(String.valueOf(query.getQuery_cate())) && query.getQuery_cate()>0) {
            r_detachedCriteria.createAlias("resource_category", "r_category");
            r_detachedCriteria.add(Restrictions.eq("r_category.category_id", query.getQuery_cate()));
        }
        if (StringUtil.isNotEmpty(resource_level)) {
            r_detachedCriteria.add(Restrictions.like("resource_level", resource_level, MatchMode.EXACT));
            ActionContext.getContext().put("resource_level",resource_level);
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            r_detachedCriteria.add(Restrictions.like("resource_name",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        r_detachedCriteria.addOrder(Order.desc("resource_id"));


        PageBean<Category> categoryPageBean = categoryService.findAllCategory(c_detachedCriteria,c_pageBean,0);


        PageBean<com.ethan.entity.Resource> resourcePageBean = resourceService.findAllResource(r_detachedCriteria, r_pageBean);

        ActionContext.getContext().put("pageBean",resourcePageBean);
        ActionContext.getContext().put("user_id",uid);
        ActionContext.getContext().put("categories",categoryPageBean.getList());

        return "personRes";
    }

    public String personPost() {

        String uid = ServletActionContext.getRequest().getParameter("uid");
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Post.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if (StringUtil.isNotEmpty(uid)) {
            detachedCriteria.createAlias("post_user", "p_user");
            detachedCriteria.add(Restrictions.eq("p_user.user_id", uid));
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("post_title",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        detachedCriteria.addOrder(Order.desc("post_id"));

        PageBean<Post> postPageBean = postService.findAllPost(detachedCriteria, pageBean);

        ActionContext.getContext().put("pageBean",postPageBean);
        ActionContext.getContext().put("user_id",uid);

        return "personPost";
    }

    public String findUser() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("user_id",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            detachedCriteria.add(Restrictions.like("user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if (StringUtil.isEmpty(query.getQuery_type())) {
            detachedCriteria.add(Restrictions.or(Restrictions.like("user_level", "学生", MatchMode.ANYWHERE),Restrictions.like("user_level", "教师", MatchMode.ANYWHERE)));
        }

        PageBean<User> userPageBean = userService.findAllUser(detachedCriteria, pageBean);

        ActionContext.getContext().put("pageBean",userPageBean);

        return "findUser";
    }



}
