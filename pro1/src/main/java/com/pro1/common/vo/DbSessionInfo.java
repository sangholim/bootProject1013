package com.pro1.common.vo;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;

/**
 * Hibernate Session 관리 데이터 서비스
 * @author HoYa
 * @param <T>
 */
public class DbSessionInfo {

    private Session session;

    private CriteriaBuilder criteriaBuilder;

    private CriteriaQuery query;

    public <X> CriteriaQuery<X> getQuery() {
        return query;
    }

    public <X> void setQuery(CriteriaQuery<X> query) {
        this.query = query;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public CriteriaBuilder getCriteriaBuilder() {
        return criteriaBuilder;
    }

    public void setCriteriaBuilder(CriteriaBuilder criteriaBuilder) {
        this.criteriaBuilder = criteriaBuilder;
    }

}
