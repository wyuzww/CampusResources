package com.ethan.web.action;

import com.alibaba.fastjson.JSON;
import com.ethan.entity.*;
import com.ethan.service.CategoryService;
import com.ethan.service.ResourceService;
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

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;


public class ResourceAction extends ActionSupport implements ModelDriven<Resource> {
    // 模型驱动使用的对象:
    private Resource resource = new Resource();
    public Resource getModel() {
        return resource;
    }
    // resourceService:
    @javax.annotation.Resource(name = "resourceService")
    private ResourceService resourceService;
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

    private File[] res_imageFiles;
    private String[] res_imageFilesFileName; // 上传的文件名

    private File res_File;
    private String res_FileFileName; // 上传的文件名

    public String[] getRes_imageFilesFileName() {
        return res_imageFilesFileName;
    }

    public void setRes_imageFilesFileName(String[] res_imageFilesFileName) {
        this.res_imageFilesFileName = res_imageFilesFileName;
    }

    public String getRes_FileFileName() {
        return res_FileFileName;
    }

    public void setRes_FileFileName(String res_FileFileName) {
        this.res_FileFileName = res_FileFileName;
    }

    public File[] getRes_imageFiles() {
        return res_imageFiles;
    }

    public void setRes_imageFiles(File[] res_imageFiles) {
        this.res_imageFiles = res_imageFiles;
    }

    public File getRes_File() {
        return res_File;
    }

    public void setRes_File(File res_File) {
        this.res_File = res_File;
    }

    public String all() {
        DetachedCriteria r_detachedCriteria = DetachedCriteria.forClass(Resource.class);
        DetachedCriteria c_detachedCriteria = DetachedCriteria.forClass(Category.class);

        PageBean r_pageBean = new PageBean();
        PageBean c_pageBean = new PageBean();
        r_pageBean.setCurPage(page);
        r_pageBean.setPageSize(rows);

        if (StringUtil.isNotEmpty(query.getQuery_type())) {
            r_detachedCriteria.createAlias("resource_uploadUser", "r_user");
            r_detachedCriteria.add(Restrictions.like("r_user.user_level", query.getQuery_type(), MatchMode.EXACT));
        }
        if (StringUtil.isNotEmpty(String.valueOf(query.getQuery_cate())) && query.getQuery_cate()>0) {
            r_detachedCriteria.createAlias("resource_category", "r_category");
            r_detachedCriteria.add(Restrictions.eq("r_category.category_id", query.getQuery_cate()));
        }
        if (StringUtil.isNotEmpty(resource.getResource_level())) {
            r_detachedCriteria.add(Restrictions.like("resource_level", resource.getResource_level(), MatchMode.EXACT));
        }
        if ((StringUtil.isNotEmpty(query.getQuery_name()))) {
            r_detachedCriteria.add(Restrictions.like("resource_name",query.getQuery_name(), MatchMode.ANYWHERE));
        }
        r_detachedCriteria.addOrder(Order.desc("resource_good"));
        r_detachedCriteria.addOrder(Order.desc("resource_id"));


        PageBean<Category> categoryPageBean = categoryService.findAllCategory(c_detachedCriteria,c_pageBean,0);


        PageBean<Resource> resourcePageBean = resourceService.findAllResource(r_detachedCriteria, r_pageBean);

        ActionContext.getContext().put("pageBean",resourcePageBean);
        ActionContext.getContext().put("categories",categoryPageBean.getList());

//        System.out.println(categoryPageBean.getList());

        return "res";
    }

    public String detail() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","收藏成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","收藏失败!");
                    break;
                case "repeat":
                    ActionContext.getContext().put("repeat","已经收藏过该资源了!");
                    break;
                default:;
            }
        }
        String rid = ServletActionContext.getRequest().getParameter("rid");

        List<String> images = new ArrayList<String>();
        Resource r = new Resource();

        if (StringUtil.isNotEmpty(rid)) {
            r.setResource_id(Integer.valueOf(rid));
        }

        Resource result = resourceService.findById(r);

        if (StringUtil.isNotEmpty(result.getResource_image())) {
            images = Arrays.asList(result.getResource_image().split(","));
        }

        ActionContext.getContext().put("resource",result);
        ActionContext.getContext().put("images",images);

        return "detail";
    }

    public String addCollect() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String rid = ServletActionContext.getRequest().getParameter("rid");

        if (StringUtil.isNotEmpty(rid)) {
            resource.setResource_id(Integer.valueOf(rid));
        }
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        if (resourceService.checkCollect(currentUser,resource)) {
//            ActionContext.getContext().put("failed","已经收藏过该资源了!");
            map.put("code", "repeat");
        } else {
            if (resourceService.addCollect(currentUser,resource)) {
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

    public String delResByUser() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String rid = ServletActionContext.getRequest().getParameter("rid");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        Resource r = new Resource();
        if (StringUtil.isNotEmpty(rid)) {
            r.setResource_id(Integer.valueOf(rid));
            if (resourceService.delResByUser(currentUser,r)) {
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

    public String delCollect() {
        Map<String, Object> map = new HashMap();
        String result = null;

        String rid = ServletActionContext.getRequest().getParameter("rid");
        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");

        Resource r = new Resource();
        if (StringUtil.isNotEmpty(rid)) {
            r.setResource_id(Integer.valueOf(rid));
            if (resourceService.delCollect(currentUser,r)) {
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

    public String toUpload() {
        if (ServletActionContext.getRequest().getParameter("code")!=null) {
            switch (ServletActionContext.getRequest().getParameter("code")) {
                case "success":
                    ActionContext.getContext().put("success","上传成功！");
                    break;
                case "failed":
                    ActionContext.getContext().put("failed","上传失败！");
                    break;
                default:;
            }
        }

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);
        PageBean pageBean = new PageBean();
        PageBean<Category> categoryPageBean = categoryService.findAllCategory(detachedCriteria,pageBean,0);
        ActionContext.getContext().put("categories",categoryPageBean.getList());

        return "toUpload";
    }

    public String upload() {
//        Map<String, Object> map = new HashMap();
//        String result = null;

        String resource_cid = ServletActionContext.getRequest().getParameter("resource_cid");

        User currentUser = (User) ActionContext.getContext().getSession().get("currentUser");
        resource.setResource_uploadUser(currentUser);
        resource.setResource_time(new Date());
        resource.setResource_good(0);
        if (StringUtil.isNotEmpty(resource_cid)) {
            Category category = new Category();
            category.setCategory_id(Integer.valueOf(resource_cid));
            category = categoryService.findById(category);
            resource.setResource_category(category);
        }


        if(res_File!=null){
            String fileName = "";//输出流
            String fileType = res_FileFileName.substring(res_FileFileName.lastIndexOf("."));
            fileName = currentUser.getUser_id() + (new Date().getTime() + (int)(1+Math.random()*(100-1+1)))+ fileType;

            System.out.println("fileName:"+fileName);

            ServletContext servletContext = ServletActionContext.getServletContext();
            String path = servletContext.getRealPath("/upload/resources");
            InputStream is = null;
            OutputStream os = null;
            try {
                is = new FileInputStream(res_File);
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
            resource.setResource_url("/upload/resources/"+fileName);
        }
        if (res_imageFiles!=null) {
            List<String> images_url = new ArrayList<>();
            ServletContext servletContext = ServletActionContext.getServletContext();
            String path = servletContext.getRealPath("/upload/images");
            System.out.println("path:"+path);

            for(int i = 0; i < res_imageFiles.length; i++) {
                String fileName = "";//输出流
                String fileType = res_imageFilesFileName[i].substring(res_imageFilesFileName[i].lastIndexOf("."));
                fileName = currentUser.getUser_id() + (new Date().getTime() + (int)(1+Math.random()*(100-1+1)))+ fileType;
                InputStream is = null;
                OutputStream os = null;
                try {
                    is = new FileInputStream(res_imageFiles[i]);
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
                resource.setResource_image(images_url.toString().substring(1,images_url.toString().length()-1));
            }

        }

        System.out.println(resource);
        if (resourceService.addRes(resource)) {
//            map.put("code", "success");
            ActionContext.getContext().put("success","上传成功！");
        } else {
//            map.put("code", "failed");
            ActionContext.getContext().put("failed","上传失败！");

        }

//        result = JSON.toJSONString(map);
//        map.clear();
//        if (result != null) {
//            try {
//                ResponseUtil.write(ServletActionContext.getResponse(), result);
//                result = null;
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }

        return "toUpload";

    }

}
