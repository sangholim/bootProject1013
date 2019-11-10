package com.pro1.user.param;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * 우편 api 결과값을 xml > Pojo로 담는 클레스
 * @author HoYa
 *
 */
@XmlRootElement(name="post")
@XmlAccessorType(XmlAccessType.FIELD)
public class _Post {

    @XmlElement(name = "pageinfo")
    private _Pageinfo pageinfo;

    @XmlElementWrapper(name = "itemlist") 
    @XmlElement(name = "item")
    private List<_Item> itemlist;

    public _Pageinfo getPageinfo() {
	return pageinfo;
    }

    public void setPageinfo(_Pageinfo pageinfo) {
	this.pageinfo = pageinfo;
    }

    public List<_Item> getItemlist() {
	return itemlist;
    }

    public void setItemlist(List<_Item> itemlist) {
	this.itemlist = itemlist;
    }

    public static class _Pageinfo {
	private long totalCount;
	private int totalPage;
	private int countPerPage = 10;
	private int currentPage = 1;

	public long getTotalCount() {
	    return totalCount;
	}

	public void setTotalCount(long totalCount) {
	    this.totalCount = totalCount;
	}

	public int getTotalPage() {
	    return totalPage;
	}

	public void setTotalPage(int totalPage) {
	    this.totalPage = totalPage;
	}

	public int getCountPerPage() {
	    return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
	    this.countPerPage = countPerPage;
	}

	public int getCurrentPage() {
	    return currentPage;
	}

	public void setCurrentPage(int currentPage) {
	    this.currentPage = currentPage;
	}

    }
    
    @XmlRootElement(name = "item")
    @XmlAccessorType (XmlAccessType.FIELD)
    public static class _Item {
	private String postcd;
	private String address;
	private String addrjibun;

	public String getPostcd() {
	    return postcd;
	}

	public void setPostcd(String postcd) {
	    this.postcd = postcd;
	}

	public String getAddress() {
	    return address;
	}

	public void setAddress(String address) {
	    this.address = address;
	}

	public String getAddrjibun() {
	    return addrjibun;
	}

	public void setAddrjibun(String addrjibun) {
	    this.addrjibun = addrjibun;
	}

    }

}
