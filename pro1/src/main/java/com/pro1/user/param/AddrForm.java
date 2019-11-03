package com.pro1.user.param;

/**
 * 주소 검색에 필요한 변수를 담는 클레스
 * 
 * @author HoYa
 *
 */
public class AddrForm {

    private String addrData;

    private _Post post;

    public _Post getPost() {
	return post;
    }

    public void setPost(_Post post) {
	this.post = post;
    }

    public String getAddrData() {
	return addrData;
    }

    public void setAddrData(String addrData) {
	this.addrData = addrData;
    }

}
