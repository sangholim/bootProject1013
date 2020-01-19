<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!--  카페 메인화면 요소 구성 / 카페 관리 요소 구성 -->
<div id="container">
	 <c:choose>
	 	<c:when test="${fn:contains(page,'register')}">
	 		<link rel="stylesheet" href="/css/utils/cropper/cropper.css?${applicationScope.cachetype}" type="text/css">
	 		<jsp:include page="cafe_register.jsp"></jsp:include>
	 		<script class="personal_js" type="text/javascript" src="/js/utils/cropper/cropper.js?${applicationScope.cachetype}" ></script>
		</c:when>
	 	<c:otherwise>
	 		<jsp:include page="cafe_middle_main.jsp"></jsp:include>
	 	</c:otherwise>
	 </c:choose>
 	<!--  side menu -->
	<div class="aside">
		<div class="cafe_banner">
			<div class="banner_btns">
				<div class="common_btn_side">
					<button type="button" title="이전" class="btn_side_prev">
						<span class="blind">이전</span>
					</button>
					<button type="button" title="다음" class="btn_side_next" disabled="disabled">
						<span class="blind">다음</span>
					</button>
				</div>
			</div>
			<div class="banner">
				<img src="/img/cafe/sp-cafe-meeting-banner.png" width="300" height="250" alt="정모기념품 지원.카페 이름이 새겨진 기념품을 받아보세요. 여러분의 정모 흥행을 응원합니다!" class="">
				<a href="https://cafe.naver.com/cafesupport/129693"></a>
			</div>
		</div>
		<div class="login_area">
			<div class="user_info">
				<h2 class="blind">사용자 정보</h2>
				<div class="nick_name">
					<strong>${nickName }</strong>님
				</div>
				<div class="user_count">
					<a href="/cafe-home/article-storages" class="storage">보관함</a>
					<a href="https://note.naver.com" target="_blank" class="note">쪽지 39</a>	
					<button class="btn_login">로그아웃</button>
				</div>
			</div>
		</div>
		<!-- cafe 만들기 UI -->
		<div>
			<div class="cafe_make">
				<a class="btn_cafe_make">카페 만들기</a>
			</div>
			<div class="common_notice_layer" style="display:none;">
				<span class="icon_notice"></span>
				<h3 class="tit">카페 만들기는 실명확인 회원만 사용 가능합니다.</h3>
				<p class="txt">카페를 만드시려면 실명 확인을 해주세요.</p>
				<div class="btn_area">
					<a href="#" class="btn">닫기</a>
					<a href="#" class="btn"><strong>실명 확인하기</strong></a>
				</div>
			</div>
		</div>
		<div class="cafe_link">
			<a href="/cafe-home/game-cafes" class="link_game">
            	게임정보, 뉴스, 공략이 가득한<br>
            	<strong>공식게임카페</strong>
				<em class="point">사전예약중</em>
			</a>
        	<a href="/cafe-home/cafes/fans" class="link_pan">
            	스타, 드라마, 예능 팬심이<br>폭발할 때 
            	<strong>인기 팬카페</strong>
            </a>
            <a href="/cafe-home/education-cafes" class="link_wiu">
           		 내가 이해한 전문지식<br>
           		 <strong>WIU지식나눔카페</strong>
           	</a>
        </div>
		<div id="da_280240" name="da_280240" class="ad_area">
			<iframe name="f280240" data-veta-preview="cafe_home" src="//veta.naver.com/fxshow?su=SU10368" width="300" height="300" marginheight="0" marginwidth="0" scrolling="no" frameborder="0" align="center" title="광고 플래쉬" id="f280240_SU10368" style="display: none !important;"></iframe>
		</div>
		<div class="smart_bot">
			<a href="https://talk.naver.com/ct/wc63k2">궁금한게 있을땐 카페 
				<em>스마트봇<span class="blind">beta</span></em>
			</a>
		</div>
		<div class="notice">
			<h3>공지사항</h3>
			<ul class="notice_list">
				<li>
					<a href="https://section.cafe.naver.com/cafe-home/cafe-notice?noticeId=1620&amp;page=1">
						<em>[안내] PC/모바일웹 임시저장글 보관 기간 변경(12/17)</em>
					</a>
				</li>
				<li>
					<a href="https://section.cafe.naver.com/cafe-home/cafe-notice?noticeId=1620&amp;page=1">
						<em>추가 공지사항 올리는곳</em>
					</a>
				</li>
			</ul>
			<a href="/cafe-home/cafe-notices" class="notice_more">
				<span class="blind">더보기</span>
			</a>
		</div>
	</div>
 </div>

