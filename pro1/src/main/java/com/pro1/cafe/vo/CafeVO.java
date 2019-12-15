package com.pro1.cafe.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity(name = "cafe")
@Table(name = "CAFE")
@DynamicUpdate
public class CafeVO {

    @Id // primary key
    @Column(name = "uid")
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private long uid;
    private String name;
    private String url;
    private int usePrivate;
    private int joinType;
    private String useNickname;
    private int showMember;
    private int title_mainSort;
    private int title_subSort;
    private int region_mainSort;
    private int region_subSort;
    private String keywordList;
    // 카페의 아이콘 경로
    /**
     * 카페의 아이콘 경로 store/cafe/카페명+uid/
     */
    private String icon;
    private long visitCnt;
    private long writingCnt;
    private long memberCnt;

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

    public String getUseNickname() {
	return useNickname;
    }

    public void setUseNickname(String useNickname) {
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

}
