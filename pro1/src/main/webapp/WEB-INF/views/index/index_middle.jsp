<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="index_bg">
	<div class="index_mid">
		<div class="column_left">
			<!--  관리자가 등록한 게시판 글을 최신순으로 뿌리고 클릭스 게시판 view 화면으로 이동 -->
			<div class="board/admin/view section_border margin_bottom area_section_board">
				<div data-value="1">공지글1</div>
				<div data-value="2">공지글2</div>
			</div>
			<!--  유저가 등록한 게시판들의 중요정보만 뿌리고 , 누를떄 해당 게시판 뷰를 보여줌 -->
			<div class="section_border margin_bottom area_section_board">
				<!--  board 에대한 identifier 제공 -->
				생성한 카페 / 등록한  카페 리스트
			</div>
			<!--  자유게시판 하나  -->
		</div>
		<div class="column_right">
			<div class="section_border margin_bottom area_section_login">
				<c:choose>
					<c:when test="${auth eq 0}">
						<div class="login_padding">
							<p class="login_text">네이버를 더 안전하고 편리하게 이용하세요.</p>
							<a class="login_btn"  href="login" role="button">
								<i class="ico_local_login">
									<span class="blind">NAVER 로그인</span>
								</i>
							</a>
						</div>
						<div class="login_addinfo">
							<a class="login_reg" href="/login/register">회원가입</a>
							<span class="login_find">
								<a>아이디</a>.<a>비밀번호 찾기</a>
							</span>
						</div>
					</c:when>
					<c:otherwise>
						<jsp:include page="../user/user_info_mini.jsp"/>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="section_border area_section_right_img">
				<a href="http://www.youtube.com">
					<img src="img/icon/youtube332X204.jpg" class="margin_bottom" style="height: 179px; width: 332px;">
				</a>
				<a href="https://git-scm.com/">
					<img src="img/icon/git332X207.jpg" class="margin_bottom" style="height: 179px; width: 332px;">
				</a>
			</div>
		</div>
	</div>
</div>