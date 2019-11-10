<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="icon" type="image/png"  href="/img/favicon/favicon.ico?${applicationScope.cachetype}"/>
<link rel="stylesheet" href="/css/common/common.css?${applicationScope.cachetype}" type="text/css">
</head>
<body>
	<input type="hidden" id="pageInfo" value="index">
	<div class="wrap">
		<c:choose>
			<c:when test="${page eq 'index'}">
				<link class="personal_css" rel="stylesheet" href="/css/index/index.css?${applicationScope.cachetype}" type="text/css">
				<jsp:include page="index/index_top.jsp" />
				<jsp:include page="index/index_middle.jsp" />
				<jsp:include page="index/index_bot.jsp" />
				<script class="personal_js" type="text/javascript" src="/js/index/index.js?${applicationScope.cachetype}" ></script>
			</c:when>
			<c:when test="${fn:contains(page,'login')}">
				<link class="personal_css" rel="stylesheet" href="/css/login/login.css?${applicationScope.cachetype}" type="text/css">
				<jsp:include page="login/login_top.jsp" />
				<c:choose>
					<c:when test="${fn:contains(page,'register')}">
						<jsp:include page="user/user_register.jsp" />
					</c:when>
					<c:when test="${fn:contains(page,'findAddr')}">
						<jsp:include page="user/findAddr.jsp" />
					</c:when>
					<c:otherwise>
						<jsp:include page="login/login_middle.jsp" />
					</c:otherwise>
				</c:choose>
				<jsp:include page="login/login_bot.jsp" />
				<script class="personal_js" type="text/javascript" src="/js/login/login.js?${applicationScope.cachetype}" ></script>
			</c:when>
			<c:when test="${page eq 'board'}">
				<link class="personal_css" rel="stylesheet" href="/css/board/board.css?${applicationScope.cachetype}" type="text/css">
				<jsp:include page="board/commonBoard.jsp"/>
				<script class="personal_js" type="text/javascript" src="/js/board/board.js?${applicationScope.cachetype}" ></script>
			</c:when>
			<c:when test="${page eq 'cafe'}">
				<link class="personal_css" rel="stylesheet" href="/css/cafe/cafe.css?${applicationScope.cachetype}" type="text/css">
				<jsp:include page="cafe/cafe_top.jsp"/>
				<jsp:include page="cafe/cafe_middle.jsp"/>
				<jsp:include page="cafe/cafe_bot.jsp"/>
				<script class="personal_js" type="text/javascript" src="/js/cafe/cafe.js?${applicationScope.cachetype}" ></script>
			</c:when>
		</c:choose>
		<!--  base64 js -->
		<script class="personal_js" type="text/javascript" src="/js/utils/base64js.min.js?${applicationScope.cachetype}" ></script>
		<script type="text/javascript" src="/js/common/common.js?${applicationScope.cachetype}" ></script>
	</div>
	<div class="loading_wrap blind" id="loadNode">
		<div class="loader_img"/>
	</div>
</body>
</html>