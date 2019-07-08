package com.ethan.dao;


import com.ethan.entity.PageBean;
import com.ethan.entity.Register;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface RegisterDao {
//    public int userRegister(Register register) throws SQLException;
//
//    public boolean checkUser(User user) throws SQLException;
//
//    public List<Register> allRegister(PageBean pagination) throws SQLException;
//
//    public long registerCount() throws SQLException;
//
//    public int updateRegister(Register register) throws SQLException;
//
//    public int bulkImport(String filePath) throws SQLException;

    Boolean userRegister(Register register);

    Boolean checkUser(String user_id);

    Register approveRegister(String user_id);

    List<Register> findAllRegister(DetachedCriteria detachedCriteria, PageBean pageBean);

    Integer registerCount(DetachedCriteria detachedCriteria);
}
