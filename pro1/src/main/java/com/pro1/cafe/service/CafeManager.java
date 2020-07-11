package com.pro1.cafe.service;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeManageForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.constant.Constant;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.security.CustomAuthentication;

public class CafeManager extends CommonDBSession {
    // 제목 분류 max index 값들
    private int[] maxTitleSort = { 10, 8, 6, 11, 11, 16, 12, 11, 22, 12, 9, 9, 8, 8, 7, 10, 12, 10, 14, 12, 8, 10, 5,
	    10, 4 };
    // 지역 분류 max index 값들
    private int[] maxRegionSort = { 23, 24, 7, 11, 5, 8, 3, 5, 11, 8, 10, 15, 13, 9, 14, 2, 0, 11, 17, 9, 7 };

    private static final Logger logger = LoggerFactory.getLogger(CafeManager.class);

    @Autowired
    private CafeDAO cafeDAO;

    public void getCafeMapByUserUid(CafeForm cafeForm, long userUid, String sub_type) throws Exception {
	cafeDAO.getCafeMapByUserUid(userUid, sub_type, cafeForm);
    }

    public void getCafeList(Model model) {

	try {
	    model.addAttribute("cafeList", cafeDAO.getCafeList());
	} catch (Exception e) {
	    logger.warn("Error Connection DataBase : {}", e.getMessage(), e);
	}

    }

    /**
     * 카페 추가 로직
     * 
     * @param authetication
     * @param cafeVO
     */
    public void addCafe(CustomAuthentication authetication, CafeVO cafeVO) {
	try {
	    UserCafeVO userCafeVO = new UserCafeVO(authetication.getUid(), Constant.ADMIN_ROLE);
	    cafeDAO.addCafe(cafeVO, userCafeVO);
	} catch (Exception e) {
	    logger.error("Insert Cafe , user_cafe Error > {}", e.getMessage(), e);
	}
    }

    /**
     *
     * @author ued123
     * @brief 카페 접속시 자신의 카페 이름(카페이름은 unique)을 가지고 자신의 cafe 정보를 조회
     */
    public CafeVO getCafeInfo(String cafeUrl) {

	try {
	    CafeVO cafeVO = cafeDAO.getCafeUrlinfo(cafeUrl);
	    return cafeVO;

	} catch (Exception e) {
	    logger.error("getCafeInfo error > {}", e.getMessage(), e);
	    return null;
	}
    }

    public void getMyCafeListCnt(CafeManageForm cafeManageForm, long userUid, String tab) throws Exception {

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	// -100 is undefined
	try (Session session = sessionInfo.getSession()) {

	    cafeManageForm.setMyCafeListCnt(
		    session.createQuery("select count(uc)  from UserCafeVO uc where userUid=:userUid and uc.userRole!= -2", Long.class)
			    .setParameter("userUid", userUid).getSingleResult());
	    cafeManageForm.setMyCafeFavListCnt(
		    session.createQuery("select count(uc)  from UserCafeVO uc where userUid=:userUid and cafeFav=1 and uc.userRole!= -2",
			    Long.class).setParameter("userUid", userUid).getSingleResult());
	    cafeManageForm.setMyCafeManageListCount(
		    session.createQuery("select count(uc)  from UserCafeVO uc where userUid=:userUid and userRole=7",
			    Long.class).setParameter("userUid", userUid).getSingleResult());
	    cafeManageForm.setMyCafeLeaveListCount( session.createQuery("select count(uc)  from UserCafeVO uc where userUid=:userUid and userRole=-2",
		    Long.class).setParameter("userUid", userUid).getSingleResult());
	    switch (tab) {
	    case "mycafe":
		cafeManageForm.setSelectMyCafeListCnt(cafeManageForm.getMyCafeListCnt());
		cafeManageForm.setShowCafeManageView(1);
		break;
	    case "favorite":
		cafeManageForm.setSelectMyCafeListCnt(cafeManageForm.getMyCafeFavListCnt());
		break;
	    case "applying":
		cafeManageForm.setShowCafeManageView(1);
		break;
	    case "managing":
		cafeManageForm.setSelectMyCafeListCnt(cafeManageForm.getMyCafeManageListCount());
		break;
	    case "secede":
		cafeManageForm.setSelectMyCafeListCnt(cafeManageForm.getMyCafeLeaveListCount());
		break;
	    default:
		break;
	    }

	} catch (Exception e) {
	    logger.error("getCafeInfo error > {}", e.getMessage(), e);
	}

    }

    public void getCafeListMyCafe(CafeManageForm cafeManageForm, long userUid, String tab) throws Exception {

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	// -100 is undefined
	int userRole = -100;
	int cafeFav = -1;
	try (Session session = sessionInfo.getSession()) {
	    switch (tab) {
	    case "mycafe":
		break;
	    case "favorite":
		cafeFav = 1;
		break;
	    case "applying":
		userRole = -1;
		break;
	    case "managing":
		userRole = 7;
		break;
	    case "secede":
		userRole = -2;
		break;
	    default:
		break;
	    }
	    
	    cafeDAO.getMyCafeConditions(session, cafeManageForm, userUid, userRole, cafeFav);
	} catch (Exception e) {
	    logger.error("getCafeInfo error > {}", e.getMessage(), e);
	}

    }

    public int modCafeFav(long userUid, CafeManageForm cafeManageForm) throws Exception {

	/*
	 * 1. cafe 테이블에서 cafeUrl을 통하여 cafeUid 정보를 긁어온다 2. cafeUid , userUid 로 해당
	 * userCafeVO 객체 call 3. update 구문 시행
	 */
	DbSessionInfo dbSessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	int updateResult = -1;
	try (Session session = dbSessionInfo.getSession()) {
	    // url를 통하여 cafeVO 가져오기
	    CafeVO cafeVO = cafeDAO.getCafeUrlinfoMig(session, cafeManageForm.getUrl());
	    Transaction tr = session.beginTransaction();
	    // 카페 즐겨찾기 변경
	    updateResult = cafeDAO.updateUserCafeQuery(session, cafeVO.getUid(), userUid, cafeManageForm.getCafeFav());
	    tr.commit();
	    
	    
	} catch (Exception e) {
	    logger.warn("Error Update UserCafe Data : {}", e.getMessage(), e);
	}

	return updateResult;
    }


    public int modCafeUserRole(long userUid, CafeManageForm cafeManageForm) throws Exception {

	/*
	 * 1. cafe 테이블에서 cafeUrl을 통하여 cafeUid 정보를 긁어온다 2. cafeUid , userUid 로 해당
	 * userCafeVO 객체 call 3. update 구문 시행
	 */
	DbSessionInfo dbSessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	int updateResult = -1;
	try (Session session = dbSessionInfo.getSession()) {
	    // url를 통하여 cafeVO 가져오기
	    CafeVO cafeVO = cafeDAO.getCafeUrlinfoMig(session, cafeManageForm.getUrl());
	    Transaction tr = session.beginTransaction();
	    // 카페 즐겨찾기 변경
	    updateResult = cafeDAO.updateUserCafeUserRole(session, cafeVO.getUid(), userUid, cafeManageForm.getUserRole());
	    tr.commit();
	} catch (Exception e) {
	    logger.warn("Error Update UserCafe Data : {}", e.getMessage(), e);
	}

	return updateResult;
    }

    
    public int updateCafe(long userUid, CafeForm cafeForm) throws Exception {

	/*
	 * 1. cafe 테이블에서 cafeUrl을 통하여 cafeUid 정보를 긁어온다 2. cafeUid , userUid 로 해당
	 * userCafeVO 객체 call 3. update 구문 시행
	 */
	DbSessionInfo dbSessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	int updateResult = -1;
	try (Session session = dbSessionInfo.getSession()) {
	    // url를 통하여 cafeVO 가져오기
	    CafeVO cafeVO = cafeDAO.getCafeQuery(session, -1, cafeForm.getCafeVO().getUrl());
	    Transaction tr = session.beginTransaction();
	    // 원하는 값으로 업데이트
	    updateResult = cafeDAO.updateUserCafeQuery(session, cafeVO.getUid(), userUid, cafeForm.getCafeFav());
	    tr.commit();
	} catch (Exception e) {
	    logger.warn("Error Update UserCafe Data : {}", e.getMessage(), e);
	}

	return updateResult;
    }
    
}
