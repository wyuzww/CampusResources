package com.ethan.service;


import com.ethan.entity.PageBean;
import com.ethan.entity.Resource;
import com.ethan.entity.User;
import org.hibernate.criterion.DetachedCriteria;


import java.util.List;

public interface ResourceService {
//
//    public List<AllEntity> allResource(AllEntity allEntity, PageBean pagination) throws SQLException;
//
//    public int addResource(Resource resource) throws SQLException;
//
//    public List<AllEntity> allCollectByUserID(AllEntity allEntity, PageBean pagination) throws SQLException;
//
//    public int delResource(Resource resource) throws SQLException;
//
//    public long  resourceCount(AllEntity allEntity) throws SQLException;
//
//    public long collectByIDCount(AllEntity allEntity) throws SQLException;
//
//    public int setGoodResource(Resource resource, int good) throws SQLException;

    PageBean<Resource> findAllResource(DetachedCriteria detachedCriteria, PageBean pageBean);

    Resource findById(Resource resource);

    Boolean addCollect(User user,Resource resource);

    Boolean checkCollect(User user,Resource resource);

    Boolean delResByUser(User user, Resource resource);

    Boolean delCollect(User user, Resource resource);

    Boolean addRes(Resource resource);

    Boolean updateRes(Resource resource);

    Boolean delRes(Resource resource);


}
