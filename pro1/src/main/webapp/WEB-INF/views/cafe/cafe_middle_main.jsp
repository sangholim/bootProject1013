<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sub_page eq 'sub_ranking'}">
		<jsp:include page="cafe_middle_cafe-rankings.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="cafe_middle_all.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
