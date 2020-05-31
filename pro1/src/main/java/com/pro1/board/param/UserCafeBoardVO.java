package com.pro1.board.param;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "userCafeBoard")
public class UserCafeBoardVO implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 1827843192317052170L;

    @Id // primary key
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    @Column(name = "boardUid")
    private long boardUid;

    @Column(name = "userUid") // foreignKey
    private long userUid;

    @Column(name = "cafeUid") // foreignKey
    private long cafeUid;

    private String subject;

    private String content;

    private String writer;

    private String addfile;

    private long createDate;

    private long modifiedDate;

    private long viewCnt;

    @Transient
    private String createDateStr;

    @Transient
    private String modifiedDateStr;

    @Transient
    private String cafeUrl;

    public String getCafeUrl() {
	return cafeUrl;
    }

    public void setCafeUrl(String cafeUrl) {
	this.cafeUrl = cafeUrl;
    }

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

    public UserCafeBoardVO() {
    }

    public UserCafeBoardVO(long boardUid, long userUid, long cafeUid, String subject, String content, String writer,
	    String addfile, long createDate, long modifiedDate, long viewCnt) {
	this.boardUid = boardUid;
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.subject = subject;
	this.content = content;
	this.writer = writer;
	this.addfile = addfile;
	this.createDate = createDate;
	this.modifiedDate = modifiedDate;
	this.viewCnt = viewCnt;
    }

    public UserCafeBoardVO(String subject, String content, String writer, String addfile, long modifiedDate, long viewCnt) {
	this.subject = subject;
	this.content = content;
	this.writer = writer;
	this.addfile = addfile;
	this.modifiedDate = modifiedDate;
	this.viewCnt = viewCnt;
    }

    public UserCafeBoardVO(Long boardUid, String subject, String writer, long createDate) {
	this(boardUid, 0l, 0l, subject, null, writer, null, createDate, 0l, 0l);
    }

    public void setBoardUid(long boardUid) {
	this.boardUid = boardUid;
    }

    public void setUserUid(long userUid) {
	this.userUid = userUid;
    }

    public void setCafeUid(long cafeUid) {
	this.cafeUid = cafeUid;
    }

    public long getViewCnt() {
	return viewCnt;
    }

    public void setViewCnt(long viewCnt) {
	this.viewCnt = viewCnt;
    }

    @Override
    public String toString() {
	return "UserCafeBoardVO{" + "boardUid=" + boardUid + ", userUid=" + userUid + ", cafeUid=" + cafeUid
		+ ", subject='" + subject + '\'' + ", content='" + content + '\'' + ", writer='" + writer + '\''
		+ ", addfile='" + addfile + '\'' + ", createDate=" + createDate + ", modifiedDate=" + modifiedDate
		+ ", createDateStr='" + createDateStr + '\'' + ", modifiedDateStr='" + modifiedDateStr + '\''
		+ ", cafeUrl='" + cafeUrl + '\'' + '}';
    }
}