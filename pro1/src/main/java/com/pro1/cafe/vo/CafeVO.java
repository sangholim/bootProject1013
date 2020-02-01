package com.pro1.cafe.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@Entity(name = "cafe")
@Table(name = "cafe")
@DynamicUpdate
@JsonSerialize
public class CafeVO {

    @Id // primary key
    @Column(name = "uid")
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private long uid;

    @Column(name = "name")
    private String name;

    @Column(name = "url")
    private String url;

    @Column(name = "usePrivate")
    private int usePrivate = 0;

    @Column(name = "joinType")
    private int joinType = 0;

    @Column(name = "useNickname")
    private int useNickname = 0;

    @Column(name = "showMember")
    private int showMember = 0;

    @Column(name = "title_mainSort")
    private int title_mainSort = -1;

    @Column(name = "title_subSort")
    private int title_subSort = -1;

    @Column(name = "region_mainSort")
    private int region_mainSort = -1;

    @Column(name = "region_subSort")
    private int region_subSort = -1;

    @Column(name = "keywordList")
    private String keywordList = "";

    /**
     * 카페의 아이콘 경로 store/cafe/카페명+uid/
     */
    @Column(name = "icon")
    private String icon = "defaultPath";

    @Column(name = "visitCnt")
    private long visitCnt = 0;

    @Column(name = "writingCnt")
    private long writingCnt = 0;

    @Column(name = "memberCnt")
    private long memberCnt = 0;

    @Column(name = "`desc`")
    private String desc = "";

    @Column(name = "useShortCut")
    private int useShortCut = 0;

    public long getUid() {
	return uid;
    }

    public void setUid(long uid) {
	this.uid = uid;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public int getUsePrivate() {
	return usePrivate;
    }

    public void setUsePrivate(int usePrivate) {
	this.usePrivate = usePrivate;
    }

    public int getJoinType() {
	return joinType;
    }

    public void setJoinType(int joinType) {
	this.joinType = joinType;
    }

    public int getUseNickname() {
	return useNickname;
    }

    public void setUseNickname(int useNickname) {
	this.useNickname = useNickname;
    }

    public int getShowMember() {
	return showMember;
    }

    public void setShowMember(int showMember) {
	this.showMember = showMember;
    }

    public int getTitle_mainSort() {
	return title_mainSort;
    }

    public void setTitle_mainSort(int title_mainSort) {
	this.title_mainSort = title_mainSort;
    }

    public int getTitle_subSort() {
	return title_subSort;
    }

    public void setTitle_subSort(int title_subSort) {
	this.title_subSort = title_subSort;
    }

    public int getRegion_mainSort() {
	return region_mainSort;
    }

    public void setRegion_mainSort(int region_mainSort) {
	this.region_mainSort = region_mainSort;
    }

    public int getRegion_subSort() {
	return region_subSort;
    }

    public void setRegion_subSort(int region_subSort) {
	this.region_subSort = region_subSort;
    }

    public String getKeywordList() {
	return keywordList;
    }

    public void setKeywordList(String keywordList) {
	this.keywordList = keywordList;
    }

    public String getIcon() {
	return icon;
    }

    public void setIcon(String icon) {
	this.icon = icon;
    }

    public long getVisitCnt() {
	return visitCnt;
    }

    public void setVisitCnt(long visitCnt) {
	this.visitCnt = visitCnt;
    }

    public long getWritingCnt() {
	return writingCnt;
    }

    public void setWritingCnt(long writingCnt) {
	this.writingCnt = writingCnt;
    }

    public long getMemberCnt() {
	return memberCnt;
    }

    public void setMemberCnt(long memberCnt) {
	this.memberCnt = memberCnt;
    }

    public String getDesc() {
	return desc;
    }

    public void setDesc(String desc) {
	this.desc = desc;
    }

    public int getUseShortCut() {
	return useShortCut;
    }

    public void setUseShortCut(int useShortCut) {
	this.useShortCut = useShortCut;
    }

}
