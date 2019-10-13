package com.pro1.main.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DEPT")
public class DeptVO {
    @Id // primary key
    @GeneratedValue // auto increment
    private long dept_no;

    private String dept_name;

    public DeptVO() {

    }

    public long getDept_no() {
        return dept_no;
    }

    public void setDept_no(long dept_no) {
        this.dept_no = dept_no;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

}
