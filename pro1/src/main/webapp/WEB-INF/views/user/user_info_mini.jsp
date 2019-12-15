<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="login_profile">
	<a class="login_user_thumbnail">
		<span class="mask"></span>
		<img id="profile_img" alt="${user.userName }" src="/img/icon/myInfo.gif" width="56" height="56">
	</a>
	<div class="login_private">
		<span class="userName">
			<!--  클릭시 유저 변경 url -->
			<a href="javascript:void(0);">
				<strong>${user.userName }</strong>님
			</a>
		</span>
		<!--  내 정보 -->
		<a class="link_myInfo need_auth" href="/login/register">
			내정보
		</a>
	</div>
	<div class="my_service">
		<a class="btn_logout" href="/index/logout">
			<span>로그아웃</span>
		</a>
		<span class="link_cover">
			<a class="link_cafe need_auth" href="/cafe">
				<i>
					카페<span class="cnt">100</span>
				</i>
			</a>
		</span>
		<span class="link_cover">
			<a class="link_note" href="javascript:void(0);">
				<i>
					쪽지<span class="cnt">100</span>
				</i>
				
			</a>
		</span>
	</div>

</div>
