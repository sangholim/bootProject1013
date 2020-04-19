package com.pro1.common.vo;

/**
 * 검색 및 페이징등 .. 다양한 데이터 참조시 필요한 클레스
 * 
 * @author HoYa
 *
 */
public class SearchForm {

    // 총 페이지 번호
    private long maxPageCount;

    // 현제 선택된 페이지
    private int selectedPageNum;

    // ui 나타난 페이지 묶음
    private int showPageNumCount;

    // ui에 나타난 페이지중 최소 페이지
    private int showPageMinimumCount;
    // ui에서 나타나는 페이지중 마지막 페이지
    private int showPageMaximumCount;

    // 페이지당 노출시킬 데이터 갯수
    private int showDataListCount;

    public int getShowPageMaximumCount() {
	return showPageMaximumCount;
    }

    public void setShowPageMaximumCount(int showPageMaximumCount) {
	this.showPageMaximumCount = showPageMaximumCount;
    }

    public long getMaxPageCount() {
	return maxPageCount;
    }

    public void setMaxPageCount(long maxPageCount) {
	this.maxPageCount = maxPageCount;
    }

    public int getSelectedPageNum() {
	return selectedPageNum;
    }

    public void setSelectedPageNum(int selectedPageNum) {
	this.selectedPageNum = selectedPageNum;
    }

    public int getShowPageNumCount() {
	return showPageNumCount;
    }

    public void setShowPageNumCount(int showPageNumCount) {
	this.showPageNumCount = showPageNumCount;
    }

    public int getShowPageMinimumCount() {
	return showPageMinimumCount;
    }

    public void setShowPageMinimumCount(int showPageMinimumCount) {
	this.showPageMinimumCount = showPageMinimumCount;
    }

    public int getShowDataListCount() {
	return showDataListCount;
    }

    public void setShowDataListCount(int showDataListCount) {
	this.showDataListCount = showDataListCount;
    }

}
