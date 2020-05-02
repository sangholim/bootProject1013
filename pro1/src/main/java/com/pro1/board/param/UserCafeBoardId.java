package com.pro1.board.param;

import javax.persistence.GeneratedValue;
import java.io.Serializable;
import java.util.Objects;

public class UserCafeBoardId implements Serializable {

    @GeneratedValue
    private long boardUid;

    private  long userUid;

    private long cafeUid;

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

    // 다른 Entity class에서 UserCafeBoardId 클레스 참조할때, 유일성을 체크하기 위한 로직
    @Override
    public int hashCode() {
        int hash = Objects.hashCode(getUserUid());
        hash = 29 * hash + Objects.hashCode(getCafeUid());
        return hash;
    }

    // 다른 Entity class에서 UserCafeBoardId 클레스 참조할때, 유일성을 체크하기 위한 로직
    @Override
    public boolean equals(Object other) {
        if (this == other)
            return true;
        if (!(other instanceof UserCafeBoardId))
            return false;

        final UserCafeBoardId UserCafeBoardId = (UserCafeBoardId) other;

        if (UserCafeBoardId.getBoardUid() != getBoardUid())
            return false;
        if (UserCafeBoardId.getUserUid() != getUserUid())
            return false;
        if (UserCafeBoardId.getCafeUid() != getCafeUid())
            return false;

        return true;
    }
}
