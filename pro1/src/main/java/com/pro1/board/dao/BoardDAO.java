package com.pro1.board.dao;

import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.Entity;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class BoardDAO extends CommonDBSession {

    public void InsertPost (UserCafeBoardVO vo) throws Exception {

        DbSessionInfo sessionInfo = processHibernateSession(UserCafeBoardVO.class, vo, DBQueryType.INSERT);
    }
}