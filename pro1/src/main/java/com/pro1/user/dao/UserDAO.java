package com.pro1.user.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.user.vo.AuthUserVO;
import com.pro1.user.vo.UserVO;

@Repository
public class UserDAO extends CommonDBSession {

    public List<UserVO> selectUserList() throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectList("selectUserList");
	}

	DbSessionInfo sessionInfo = processHibernateSession(UserVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CriteriaQuery<UserVO> criteria = sessionInfo.getQuery();
	    return session.createQuery(criteria).getResultList();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}

    }

    public void insertUser(UserVO user) throws Exception {

	if (sqlSession != null) {
	    sqlSession.insert("insertUser");
	}
	processHibernateSession(user.getClass(), user, DBQueryType.INSERT);
    }

    public void deleteUser(UserVO user) throws Exception {
	if (sqlSession != null) {
	    sqlSession.delete("deleteUser");
	}
	processHibernateSession(user.getClass(), user, DBQueryType.DELETE);
    }

    public AuthUserVO existUser(String id) throws Exception {
	if (sqlSession != null) {
	    return sqlSession.selectOne("isChekcUser", id);
	}

	DbSessionInfo sessionInfo = processHibernateSession(AuthUserVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CriteriaBuilder builder = sessionInfo.getCriteriaBuilder();
	    CriteriaQuery<AuthUserVO> criteriaQuery = builder.createQuery(AuthUserVO.class);
	    Root<AuthUserVO> root = criteriaQuery.from(AuthUserVO.class);
	    Predicate predicate = builder.equal(root.get("id"), id);
	    criteriaQuery.select(root).distinct(true).where(predicate);
	    return session.createQuery(criteriaQuery).getSingleResult();
	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

}
