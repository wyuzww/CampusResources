package com.ethan.web.action;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.PageBean;
import com.ethan.entity.Post;
import com.ethan.entity.Query;
import com.ethan.entity.User;
import com.ethan.service.PostService;
import com.ethan.utils.ResponseUtil;
import com.ethan.utils.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.*;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.*;


public class PostAction extends ActionSupport implements ModelDriven<Post> {
    // 模型驱动使用的对象:
    private Post post = new Post();
    public Post getModel() {
        return post;
    }
    // postService:
    @javax.annotation.Resource(name = "postService")
    private PostService postService;

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

    private File[] post_imageFiles;
    private String[] post_imageFilesFileName; // 上传的文件名

    public File[] getPost_imageFiles() {
        return post_imageFiles;
    }

    public void setPost_imageFiles(File[] post_imageFiles) {
        this.post_imageFiles = post_imageFiles;
    }

    public String[] getPost_imageFilesFileName() {
        return post_imageFilesFileName;
    }

    public void setPost_imageFilesFileName(String[] post_imageFilesFileName) {
        this.post_imageFilesFileName = post_imageFilesFileName;
    }

    public String all() {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Post.class);
        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);
        pageBean.setPageSize(rows);

        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            detachedCriteria.createAlias("post_user", "p_user");
            detachedCriteria.add(Restrictions.like("p_user.user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            detachedCriteria.add(Restrictions.like("post_title",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        detachedCriteria.addOrder(Order.desc("post_id"));

        PageBean<Post> postPageBean = postService.findAllPost(detachedCriteria, pageBean);

        ActionContext.getContext().put("pageBean",postPageBean);


        return "forum";

    }

    public String detail() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","评论成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","评论失败！");
                    break;
                default:;
            }
        }

        String pid = ServletActionContext.getRequest().getParameter("pid");
        Integer pageSize = 8;

        Post p = new Post();
        List<String> images = new ArrayList<String>();

        PageBean pageBean = new PageBean();
        pageBean.setCurPage(page);

        if (StringUtil.isNotEmpty(pid)) {
            p.setPost_id(Integer.valueOf(pid));
        }

        Post result = postService.findById(p,pageBean,pageSize);

        if (StringUtil.isNotEmpty(result.getPost_image())) {
            images = Arrays.asList(result.getPost_image().split(","));
        }

        ActionContext.getContext().put("post",result);
        ActionContext.getContext().put("images",images);
        ActionContext.getContext().put("pageBean",pageBean);

        return "detail";
    }

    public String delPostByUser() {

        Map<String, Object> map = new HashMap();
        String result = null;

        String pid = ServletActionContext.getRequest().getParameter("pid");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        Post p = new Post();
        if (StringUtil.isNotEmpty(pid)) {
            p.setPost_id(Integer.valueOf(pid));
            if (postService.delPostByUser(currentUser,p)) {
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

    public String toPost() {

        return "toPost";
    }

    public String post() {
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");
        post.setPost_user(currentUser);
        post.setPost_time(new Date());

        if (post_imageFiles!=null) {
            List<String> images_url = new ArrayList<>();
            ServletContext servletContext = ServletActionContext.getServletContext();
            String path = servletContext.getRealPath("/upload/images");
            System.out.println("path:"+path);

            for(int i = 0; i < post_imageFiles.length; i++) {
                String fileName = "";//输出流
                String fileType = post_imageFilesFileName[i].substring(post_imageFilesFileName[i].lastIndexOf("."));
                fileName = currentUser.getUser_id() + (new Date().getTime() + (int)(1+Math.random()*(100-1+1)))+ fileType;
                InputStream is = null;
                OutputStream os = null;
                try {
                    is = new FileInputStream(post_imageFiles[i]);
                    os = new FileOutputStream(new File(path, fileName));
                    byte[] buffer = new byte[200];
                    int len = 0;
                    while((len = is.read(buffer)) != -1) {
                        os.write(buffer, 0, len);
                    }
                    os.close();
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                images_url.add("/upload/images/"+fileName);
            }
            if (!images_url.isEmpty()) {
                post.setPost_image(images_url.toString().substring(1,images_url.toString().length()-1));
            }

        }
        System.out.println(post);
        if (postService.addPost(post)) {
//            map.put("code", "success");
            ActionContext.getContext().put("success","发表成功！");
        } else {
//            map.put("code", "failed");
            ActionContext.getContext().put("failed","发表失败！");

        }

        return "toPost";
    }


}
