package com.pro1.common.utils;

import javax.persistence.criteria.CriteriaBuilder;
import org.apache.ibatis.session.SqlSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro1.common.DBQueryType;
import com.pro1.common.vo.DbSessionInfo;

public class CommonDBSession {

    @Autowired(required = false)
    protected SqlSession sqlSession;

    @Autowired(required = false)
    protected SessionFactory sessionFactory;

    protected <X> DbSessionInfo processHibernateSession(Class<X> pojoClass, Object vo, int queryType) throws Exception {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();

        if (queryType == DBQueryType.SELECT) {
            DbSessionInfo dbSessionInfoVO = new DbSessionInfo();
            //CriteriaQuery<X> criteriaQuery = builder.createQuery(pojoClass);
            //Root<X> root = criteriaQuery.from(pojoClass);
            //criteriaQuery.select(root);
            //dbSessionInfoVO.setQuery(criteriaQuery);
            dbSessionInfoVO.setSession(session);
            dbSessionInfoVO.setCriteriaBuilder(builder);
            return dbSessionInfoVO;
        }

        Transaction tr = session.beginTransaction();
        // DB 추가 , 업데이트 , 삭제일떄 , 내부 로직에서 처리함.
        try {
            switch (queryType) {
            case DBQueryType.INSERT:
                session.save(vo);
                break;
            case DBQueryType.DELETE:
                /*
                 *  Product product = new Product();
                    product.setId(37);
                    session.delete(product);
                    Hibernate: delete from PRODUCT where PRODUCT_ID=?
                 */
                session.delete(vo);
                break;
            case DBQueryType.UPDATE:
                session.update(vo);
                break;

            default:
                break;
            }
            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }

        return null;
    }

}
