package com.pro1.main.dao;

import java.util.List;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.main.vo.DeptVO;

@Repository
@Transactional(readOnly = false)
public class CommonDeptDAO extends CommonDBSession {

    public List<DeptVO> selectDeptList() throws Exception {

        if (sqlSession != null) {
            return sqlSession.selectList("selectDeptList");
        }

        DbSessionInfo sessionInfo = processHibernateSession(DeptVO.class, null, DBQueryType.SELECT);
        // hibernate query 질의시 추가 로직
        try (Session session = sessionInfo.getSession()) {
            CriteriaQuery<DeptVO> criteria = sessionInfo.getQuery();
            return session.createQuery(criteria).getResultList();

        } catch (Exception e) {
            // TODO: handle exception
            return null;
        }

    }
}
