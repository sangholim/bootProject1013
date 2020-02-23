package com.pro1.board.param;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity(name = "usercafeboard")
//@Table(name = "usercafeboard")
//@DynamicUpdate
public class BoardVO {
    /*      | boardUid     | bigint(20) unsigned | NO   | PRI | NULL    |       |
            | userUid      | bigint(20) unsigned | NO   | MUL | NULL    |       |
            | cafeUid      | bigint(20) unsigned | NO   | MUL | NULL    |       |
            | subject      | varchar(255)        | NO   |     | NULL    |       |
            | content      | text                | NO   |     | NULL    |       |
            | writer       | varchar(255)        | NO   |     | NULL    |       |
            | addfile      | varchar(255)        | NO   |     | NULL    |       |
            | createDate   | bigint(20) unsigned | NO   |     | NULL    |       |
            | modifiedDate | bigint(20) unsigned | NO   |     | NULL    |       |*/

//    @Id
//    @GeneratedValue
    private long boardUid;

    private long userUid;

    private long cafeUid;

    private String subject;

    private String content;

    private String writer;

    private String addfile;

    private Long createDate;

    private Long modifiedDate;

    public long getBoardUid() {
        return boardUid;
    }

    public void setBoardUid(long boardUid) {
        this.boardUid = boardUid;
    }

    public long getUserUid() {
        return userUid;
    }

    public void setUserUid(long userUid) {
        this.userUid = userUid;
    }

    public long getCafeUid() {
        return cafeUid;
    }

    public void setCafeUid(long cafeUid) {
        this.cafeUid = cafeUid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getAddfile() {
        return addfile;
    }

    public void setAddfile(String addfile) {
        this.addfile = addfile;
    }

    public Long getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Long createDate) {
        this.createDate = createDate;
    }

    public Long getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Long modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
}
