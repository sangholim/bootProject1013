<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="common_title">
	<h2 class="title">내 카페 관리</h2>
</div>
<div class="mycafe_tab">
	<a href="/cafe/manage/mycafe" class="">
		내 카페 <em>${cafeManageForm.myCafeListCnt}</em>
	</a> 
	<a href="/cafe/manage/favorite" class="">
		즐겨찾기 <em>${cafeManageForm.myCafeFavListCnt}</em>
	</a> 
	<a href="/cafe/manage/applying" class=""> 
		가입 신청중 <em>TODO</em>
	</a> 
	<a href="/cafe/manage/managing" class=""> 
		운영 카페 <em>${cafeManageForm.myCafeManageListCount}</em>
	</a>
	<a href="/cafe/manage/secede" class=""> 
		탈퇴 카페 <em>TODO</em>
	</a>
</div>

<div>
	<div class="mycafe_manage">
		<!-- SELECT BOXES -->
		<div class="mycafe_top">
			<div class="common_select">
				<strong class="blind">현재 정렬순서. 버튼 선택 시 정렬선택</strong>
				<button type="button" class="btn_select">그룹순(TODO)</button>
				<div class="layer" style="display: none;">
					<ul class="layer_list" >
						<li class="on">
							<button type="button" class="btn _sortBtn">그룹순</button> <span
							class="blind">선택됨</span>
						</li>
						<li class="">
							<button type="button" class="btn _sortBtn">가나다순</button> <!---->
						</li>
						<li class="">
							<button type="button" class="btn _sortBtn">최근 가입순</button> <!---->
						</li>
					</ul>
				</div>
			</div>
			<div class="common_select">
				<strong class="blind">현재 정렬순서. 버튼 선택 시 정렬선택</strong>
				<button type="button" class="btn_select">그룹 모두보기(TODO)</button>
				<div class="layer" style="display: none;">
					<ul class="layer_list">
						<li class="">
							<button type="button" class="btn _groupBtn">그룹 모두보기</button> <!---->
						</li>
						<li class="">
							<button type="button" class="btn _groupBtn">기본그룹</button> <!---->
						</li>
					</ul>
				</div>
			</div>
			<!---->
			<!---->
		</div>

		<!-- 내 카페에 대한 메인 UI -->
		<div class="mycafe_group">
			<div colspan="3" class="group">
				<span class="group_name">기본그룹<em class="num">${cafeManageForm.selectMyCafeListCnt }</em></span>
			</div>
			<table class="mycafe_list">
				<caption>
					<span class="blind">내 카페 관리</span>
				</caption>
				<colgroup>
					<col width="46px">
					<col width="*">
					<col width="145px">
					<col width="56px">
				</colgroup>
				<thead class="blind">
					<tr>
						<th scope="col">즐겨찾기</th>
						<th scope="col">카페명</th>
						<th scope="col">메일 설정</th>
						<th scope="col">탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<!--  내가 가입/만든 카페에서 즐겨찾기, 운영, 카페이름, nickName, 메일 여부 값을 긁어옴 -->
					<%--
					<c:forEach var="user_cafe" items="${cafeForm.userCafeList}"
						varStatus="status">
						<tr>
							<td class="bookmark">
								<button
									aria-pressed="${user_cafe.cafeFav eq 0? 'false' : 'true' }"
									class="bookmark_cafe">
									<i class="blind">즐겨찾는 카페</i>
								</button>
							</td>
							<td class="cafe_info"><a href="/board/${user_cafe.cafe.url}"
								target="_blank" class="cafe_name">${user_cafe.cafe.name}</a>
								<div class="common_icon_box">
								</div>
								<div class="user">
									<span class="nick_name">${user_cafe.cafeNicName} <img
										src="https://cafe.pstatic.net/levelicon/1/1_1.gif" alt=""
										width="11" height="11" class="ico_mystatus"></span>
									<a href="https://cafe.naver.com/re4mo/member/bbqbabo/article"
										target="_blank" class="my_article">내가 쓴 글 보기</a>
								</div></td>
							<td class="mail_set">전체메일
								<button class="btn_mail on">ON</button>
							</td>
							<td class="btns">
								<button class="btn_set">탈퇴</button>
							</td>
						</tr>
					</c:forEach>
 					--%>

				</tbody>
			</table>
			<!---->
		</div>
	</div>
	<div class="common_page">(TODO) 페이지 넘버링</div>
</div>

