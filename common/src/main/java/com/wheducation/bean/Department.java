package com.wheducation.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @description: 部门实体类
 * @author: zhangyoujun
 * @date: 2019-05-13 11:46
 */
public class Department implements Serializable {


    private Integer id;

    private Integer pid;

    private String name;

    private boolean open=true;

    private List<Department> children = new ArrayList<Department>();

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public List<Department> getChildren() {
        return children;
    }

    public void setChildren(List<Department> children) {
        this.children = children;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Department(Integer id, Integer pid, String name, boolean open, List<Department> children, String remarks) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.open = open;
        this.children = children;
        this.remarks = remarks;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Department that = (Department) o;
        return open == that.open &&
                Objects.equals(id, that.id) &&
                Objects.equals(pid, that.pid) &&
                Objects.equals(name, that.name) &&
                Objects.equals(children, that.children) &&
                Objects.equals(remarks, that.remarks);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pid, name, open, children, remarks);
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", open=" + open +
                ", children=" + children +
                ", remarks='" + remarks + '\'' +
                '}';
    }

    public Department (){

    }


}
