package com.ethan.service;


import com.ethan.entity.PageBean;
import com.ethan.entity.Register;
import org.hibernate.criterion.DetachedCriteria;

public interface RegisterService {
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

    PageBean<Register> findAllRegister(DetachedCriteria detachedCriteria, PageBean pageBean);
}
