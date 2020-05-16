<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!--  게시판 구성 페이지 [admin / user(회원) / 자게] -->
<div>
	${auth}
	<c:choose>
		<c:when test="${boardType eq 'view'}">
			<jsp:include page="commonBoardView.jsp"/>
		</c:when>
		<!-- 
		<c:when test="${boardType eq 'insert'}">
			<jsp:include page="commonBoardInsert.jsp"/>
		</c:when>
		<c:when test="${boardType eq 'update'}">
			<jsp:include page="commonBoardUpdate.jsp"/>
		</c:when>
		<c:when test="${boardType eq 'delete'}">
			<jsp:include page="commonBoardDelete.jsp"/>
		</c:when>
		 -->
	</c:choose>
</div>