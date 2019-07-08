package com.ethan.web.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.hsf.HSFJSONUtils;
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
import org.hibernate.criterion.Restrictions;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AdminAction extends ActionSupport implements ModelDriven<User> {
    // 模型驱动使用的对象:
    private User user = new User();

    public User getModel() {
        return user;
    }

    // userService:
    @Resource(name = "userService")
    private UserService userService;
    // registerService:
    @Resource(name = "registerService")
    private RegisterService registerService;
    // postService:
    @javax.annotation.Resource(name = "postService")
    private PostService postService;
    // resourceService:
    @Resource(name = "resourceService")
    private ResourceService resourceService;
    // categoryService:
    @javax.annotation.Resource(name = "categoryService")
    private CategoryService categoryService;
    // commentService:
    @javax.annotation.Resource(name = "commentService")
    private CommentService commentService;

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

    public String studentManager() {
        return "studentManager";
    }

    public String teacherManager() {
        return "teacherManager";
    }

    public String registerManager() {
        return "registerManager";
    }

    public String postManager() {
        return "postManager";
    }

    public String resourceManager() {
        return "resourceManager";
    }

    public String categoryManager() {
        return "categoryManager";
    }

    public String commentManager() {
        return "commentManager";
    }

    public String main() {
        return "main";
    }

    public String exit() {
        return "exit";
    }

    public String allStudent() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(user.getUser_id()))) {
            detachedCriteria.add(Restrictions.like("user_id", user.getUser_id(), MatchMode.ANYWHERE));
            detachedCriteria.createAlias("user_student", "u_s");
            detachedCriteria.add(Restrictions.like("u_s.student_name", user.getUser_id(), MatchMode.ANYWHERE));
        }
        detachedCriteria.add(Restrictions.eq("user_level", "学生"));

        PageBean<User> userPageBean = userService.findAllUser(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String addStudent() {
        Map<String, Object> map = new HashMap();
        String result = null;


        user.setUser_level("学生");
        user.getUser_student().setStudent_id(user.getUser_id());

        if (registerService.checkUser(user.getUser_id())) {
            map.put("success", "false");
            map.put("msg", "添加失败，帐号已存在！");
        } else {
            if (userService.addUser(user)) {
                map.put("msg", "添加成功！");
                map.put("success", "true");
            } else {
                map.put("msg", "添加失败，请重试！");
                map.put("success", "false");
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

    public String delUser() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> user_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < user_ids.size(); i++) {
            User user = new User();
            user.setUser_id(user_ids.get(i));
            if (userService.delUser(user)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "删除成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "删除失败，请重试！");
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

    public String allTeacher() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(user.getUser_id()))) {
            detachedCriteria.add(Restrictions.like("user_id", user.getUser_id(), MatchMode.ANYWHERE));
            detachedCriteria.createAlias("user_teacher", "u_t");
            detachedCriteria.add(Restrictions.like("u_t.teacher_name", user.getUser_id(), MatchMode.ANYWHERE));
        }
        detachedCriteria.add(Restrictions.eq("user_level", "教师"));

        PageBean<User> userPageBean = userService.findAllUser(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String addTeacher() {
        Map<String, Object> map = new HashMap();
        String result = null;


        user.setUser_level("教师");
        user.getUser_teacher().setTeacher_id(user.getUser_id());

        if (registerService.checkUser(user.getUser_id())) {
            map.put("success", "false");
            map.put("msg", "添加失败，帐号已存在！");
        } else {
            if (userService.addUser(user)) {
                map.put("msg", "添加成功！");
                map.put("success", "true");
            } else {
                map.put("msg", "添加失败，请重试！");
                map.put("success", "false");
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

    public String addRegisterFile() {

        return NONE;
    }

    public String approveRegister() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> user_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < user_ids.size(); i++) {
            User user = new User();
            user.setUser_id(user_ids.get(i));
            if (userService.approveUser(user)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "审核成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "审核失败，请重试！");
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

    public String allRegister() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Register.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(user.getUser_id()))) {
            detachedCriteria.add(Restrictions.or(Restrictions.like("register_id", user.getUser_id(), MatchMode.ANYWHERE), Restrictions.like("register_name", user.getUser_id(), MatchMode.ANYWHERE)));
        }
        detachedCriteria.add(Restrictions.eq("register_check", 0));

        PageBean<Register> userPageBean = registerService.findAllRegister(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String allPost() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Post.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("post_title", query.getQuery_name(), MatchMode.ANYWHERE));
        }
        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            detachedCriteria.createAlias("post_user", "p_user");
            detachedCriteria.add(Restrictions.like("p_user.user_level", query.getQuery_type(), MatchMode.EXACT));
        }

        PageBean<Post> userPageBean = postService.findAllPost(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String delPost() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> post_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < post_ids.size(); i++) {
            Post post = new Post();
            post.setPost_id(Integer.valueOf(post_ids.get(i)));
            if (postService.delPost(post)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "删除成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "删除失败，请重试！");
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

    public String allRes() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(com.ethan.entity.Resource.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("resource_name", query.getQuery_name(), MatchMode.ANYWHERE));
        }
        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            detachedCriteria.createAlias("resource_uploadUser", "r_user");
            detachedCriteria.add(Restrictions.like("r_user.user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if (StringUtil.isNotEmpty(String.valueOf(query.getQuery_cate())) && query.getQuery_cate() > 0) {
            detachedCriteria.createAlias("resource_category", "r_category");
            detachedCriteria.add(Restrictions.eq("r_category.category_id", query.getQuery_cate()));
        }

        PageBean<com.ethan.entity.Resource> userPageBean = resourceService.findAllResource(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String allCateList() {
        List<Category> categories = null;
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);
        PageBean pageBean = new PageBean();

        PageBean<Category> categoryPageBean = categoryService.findAllCategory(detachedCriteria, pageBean, 0);


        categories = categoryPageBean.getList();
        Category category = new Category();
        category.setCategory_id(-1);
        category.setCategory_name("");
        category.setCategory_desc("");
        categories.add(0, category);

        result = JSON.toJSONString(categories);
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return NONE;
    }

    public String setGood() {
        Map<String, Object> map = new HashMap();
        String result = null;


        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> res_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < res_ids.size(); i++) {
            com.ethan.entity.Resource resource = new com.ethan.entity.Resource();
            resource.setResource_id(Integer.valueOf(res_ids.get(i)));
            if (resourceService.updateRes(resource)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "标优成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "标优失败，请重试！");
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

    public String delRes() {
        Map<String, Object> map = new HashMap();
        String result = null;


        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> res_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < res_ids.size(); i++) {
            com.ethan.entity.Resource resource = new com.ethan.entity.Resource();
            resource.setResource_id(Integer.valueOf(res_ids.get(i)));
            if (resourceService.delRes(resource)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "删除成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "删除失败，请重试！");
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

    public String allComment() {
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Comment.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        PageBean<Comment> userPageBean = commentService.findAllComment(detachedCriteria, pageBean);


        map.put("rows", userPageBean.getList());
        map.put("total", pageBean.getItems());

        result = JSON.toJSONString(map, SerializerFeature.DisableCircularReferenceDetect);

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

    public String delComment() {
        Map<String, Object> map = new HashMap();
        String result = null;


        String delIds = ServletActionContext.getRequest().getParameter("delIds");

        List<String> comment_ids = Arrays.asList(delIds.split(","));
        int del_Num = 0;

        for (int i = 0; i < comment_ids.size(); i++) {
            Comment comment = new Comment();
            comment.setComment_id(Integer.valueOf(comment_ids.get(i)));
            if (commentService.delComment(comment)) {
                del_Num++;
            }
        }

        if (del_Num > 0) {
            map.put("success", "true");
            map.put("msg", "删除成功！");
            map.put("del_Num", del_Num);
        } else {
            map.put("success", "false");
            map.put("msg", "删除失败，请重试！");
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

    public String allCate() {
        List<Category> categories = null;
        Map<String, Object> map = new HashMap();
        String result = null;

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);
        PageBean pageBean = new PageBean();

        PageBean<Category> categoryPageBean = categoryService.findAllCategory(detachedCriteria, pageBean, 0);


        categories = categoryPageBean.getList();

        result = JSON.toJSONString(categories);
        if (result != null) {
            try {
                ResponseUtil.write(ServletActionContext.getResponse(), result);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return NONE;
    }

    public String addCate() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String category_name = ServletActionContext.getRequest().getParameter("category_name");
        String category_desc = ServletActionContext.getRequest().getParameter("category_desc");

        Category category = new Category();
        category.setCategory_name(category_name);
        category.setCategory_desc(category_desc);

        if (categoryService.addCate(category)) {
            map.put("msg", "添加成功！");
            map.put("success", "true");
        } else {
            map.put("msg", "添加失败，请重试！");
            map.put("success", "false");
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

    public String updateCate() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String category_id = ServletActionContext.getRequest().getParameter("category_id");
        String category_name = ServletActionContext.getRequest().getParameter("category_name");
        String category_desc = ServletActionContext.getRequest().getParameter("category_desc");

        Category category = new Category();
        category.setCategory_id(Integer.valueOf(category_id));
        category.setCategory_name(category_name);
        category.setCategory_desc(category_desc);

        if (categoryService.updateCate(category)) {
            map.put("msg", "修改成功！");
            map.put("success", "true");
        } else {
            map.put("msg", "修改失败，请重试！");
            map.put("success", "false");
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

}
