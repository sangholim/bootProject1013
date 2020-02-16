<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div id="content" class="content">
	<c:choose>
		<c:when test="${sub_page eq 'sub_main'}">
			<jsp:include page="cafe_middle_all.jsp"></jsp:include>
		</c:when>
		<c:when test="${sub_page eq 'sub_theme'}">
			<jsp:include page="cafe_middle_theme.jsp"></jsp:include>
		</c:when>
		<c:when test="${sub_page eq 'sub_area'}">
			<jsp:include page="cafe_middle_areas.jsp"></jsp:include>
		</c:when>
		<c:when test="${sub_page eq 'sub_ranking'}">
			<jsp:include page="cafe_middle_cafe-rankings.jsp"></jsp:include>
		</c:when>
	
	</c:choose>
</div>
