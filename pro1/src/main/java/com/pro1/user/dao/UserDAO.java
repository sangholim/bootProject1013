package com.pro1.user.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import com.pro1.board.param.UserCafeBoardVO;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.login.web.LoginMainAsync;
import com.pro1.user.vo.AuthUserVO;
import com.pro1.user.vo.CommonUserVO;
import com.pro1.user.vo.UserVO;

@Repository
public class UserDAO extends CommonDBSession {

	DbSessionInfo sessionInfo;

    private static final Logger logger = Logger.getLogger(LoginMainAsync.class.getName());

	private final String userUidFindUser = "select NEW user(u.id,u.userNickName) " +
			"from user u where u.userUid = :userUid";


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

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public CommonUserVO existUser(String id, Object pw, Class<?> userType) throws Exception {
	if (sqlSession != null) {
	    return sqlSession.selectOne("isChekcUser", id);
	}
	
	DbSessionInfo sessionInfo =processHibernateSession(userType, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CriteriaBuilder builder = sessionInfo.getCriteriaBuilder();
	    CriteriaQuery criteriaQuery = builder.createQuery(userType);
	    Root root = criteriaQuery.from(userType);
	
	    List<Predicate> predicates = new ArrayList<>();
	    predicates.add(builder.equal(root.get("id"), id));
	    if(pw != null) {
		predicates.add(builder.equal(root.get("pw"), pw));
	    }
	    
	    criteriaQuery.select(root).distinct(true).where(predicates.toArray(new Predicate[] {}));
		    
	    return (CommonUserVO) session.createQuery(criteriaQuery).getSingleResult();

	
	} catch (NoResultException nRE) {
	    // 쿼리 결과가 없을때
	    logger.warning("No Found Result at query Id : " + id);
	    return null;
	}
	//나머지 Exception 나는 부분은 위로 던져서 유효성 검사 실패로 가야한다.
    }

    public void updateUser(UserVO user) throws Exception {

	if (sqlSession != null) {
	    sqlSession.insert("updateUser");
	}
	processHibernateSession(user.getClass(), user, DBQueryType.UPDATE);
    }

    public void updateUser(AuthUserVO user) throws Exception {

	processHibernateSession(user.getClass(), user, DBQueryType.UPDATE);
    }

    public CommonUserVO userUidFindUser(long userUid) throws Exception {

		if (sqlSession != null) {
			return sqlSession.selectOne("getOneBoardInfo");
		}

		sessionInfo = processHibernateSession(CommonUserVO.class, null, DBQueryType.SELECT);

		try (Session session = sessionInfo.getSession()) {

			Query<CommonUserVO> query = session.createQuery(userUidFindUser, CommonUserVO.class);
			query.setParameter("userUid", userUid);
			return query.getSingleResult();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
