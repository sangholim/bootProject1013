package com.pro1.board.param;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import com.pro1.cafe.vo.UserCafeId;

@Entity
@Table(name = "userCafeBoard")
@IdClass(UserCafeId.class)
public class UserCafeBoardVO implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1827843192317052170L;

    @Id // primary key
    @GeneratedValue // auto increment
    private Long boardUid;

     @Id
     @Column(name = "userUid") // foreignKey
     private Long userUid;

     @Id
     @Column(name = "cafeUid") // foreignKey
     private Long cafeUid;

    private String subject;
    private String content;
    private String writer;
    private String addfile;
    private Long createDate;
    private Long modifiedDate;

    @Transient
    private String createDateStr;

    @Transient
    private String modifiedDateStr;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getCreateDateStr() {
        return createDateStr;
    }

    public void setCreateDateStr(String createDateStr) {
        this.createDateStr = createDateStr;
    }

    public String getModifiedDateStr() {
        return modifiedDateStr;
    }

    public void setModifiedDateStr(String modifiedDateStr) {
        this.modifiedDateStr = modifiedDateStr;
    }

    public Long getBoardUid() {
	return boardUid;
    }

    public void setBoardUid(Long boardUid) {
	this.boardUid = boardUid;
    }

    public Long getUserUid() {
	return userUid;
    }

    public void setUserUid(Long userUid) {
	this.userUid = userUid;
    }

    public Long getCafeUid() {
	return cafeUid;
    }

    public void setCafeUid(Long cafeUid) {
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

    @Override
    public boolean equals(Object obj) {
	// TODO Auto-generated method stub
	return super.equals(obj);
    }

    @Override
    public int hashCode() {
	// TODO Auto-generated method stub
	return super.hashCode();
    }

    public UserCafeBoardVO() {}

    public UserCafeBoardVO(Long boardUid, Long userUid, Long cafeUid, String subject, String content, String writer, String addfile, Long createDate, Long modifiedDate) {
        this.boardUid = boardUid;
        this.userUid = userUid;
        this.cafeUid = cafeUid;
        this.subject = subject;
        this.content = content;
        this.writer = writer;
        this.addfile = addfile;
        this.createDate = createDate;
        this.modifiedDate = modifiedDate;
    }

    public UserCafeBoardVO(String subject, String content, String writer, String addfile, Long modifiedDate) {
        this.subject = subject;
        this.content = content;
        this.writer = writer;
        this.addfile = addfile;
        this.modifiedDate = modifiedDate;
    }

    @PrePersist
    private void onCreate() {

        this.createDate = 12000l;
    }
}