package com.ethan.entity;

import java.util.List;

public class PageBean<T> {
  
  private Integer curPage;

  private Integer pageSize;

  private Integer pageNumber;

  private Integer items;

  private List<T> list;


  public Integer getCurPage() {
    return curPage;
  }

  public void setCurPage(Integer curPage) {
    this.curPage = curPage;
  }

  public Integer getPageSize() {
    return pageSize;
  }

  public void setPageSize(Integer pageSize) {
    this.pageSize = pageSize;
  }

  public Integer getPageNumber() {
    return pageNumber;
  }

  public void setPageNumber(Integer pageNumber) {
    this.pageNumber = pageNumber;
  }

  public Integer getItems() {
    return items;
  }

  public void setItems(Integer items) {
    this.items = items;
  }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
