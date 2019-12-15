package com.pro1.cafe.vo;

import java.io.Serializable;
import java.util.Objects;

public class UserCafeId implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 5471848755371408373L;

    private long userUid;

    private long cafeUid;

    public UserCafeId() {
    }

    public UserCafeId(long userUid, long cafeUid) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
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

    // 다른 Entity class에서 UserCafeId 클레스 참조할때, 유일성을 체크하기 위한 로직
    @Override
    public int hashCode() {
	int hash = Objects.hashCode(getUserUid());
	hash = 29 * hash + Objects.hashCode(getCafeUid());
	return hash;
    }

    // 다른 Entity class에서 UserCafeId 클레스 참조할때, 유일성을 체크하기 위한 로직
    @Override
    public boolean equals(Object other) {
	if (this == other)
	    return true;
	if (!(other instanceof UserCafeId))
	    return false;

	final UserCafeId userCafeId = (UserCafeId) other;

	if (userCafeId.getUserUid() != getUserUid())
	    return false;
	if (userCafeId.getCafeUid() != getCafeUid())
	    return false;

	return true;
    }
}
