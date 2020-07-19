<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="common_title">
	<h2 class="title">내 카페 관리</h2>
</div>
<div class="mycafe_tab">
	<a href="/cafe/manage/mycafe" class="mycafe">
		내 카페 <em>${cafeManageForm.myCafeListCnt}</em>
	</a> 
	<a href="/cafe/manage/favorite" class="favorite">
		즐겨찾기 <em>${cafeManageForm.myCafeFavListCnt}</em>
	</a> 
	<a href="/cafe/manage/applying" class="applying"> 
		가입 신청중 <em>TODO</em>
	</a> 
	<a href="/cafe/manage/managing" class="managing"> 
		운영 카페 <em>${cafeManageForm.myCafeManageListCount}</em>
	</a>
	<a href="/cafe/manage/secede" class="secede"> 
		탈퇴 카페 <em>${cafeManageForm.myCafeLeaveListCount}</em>
	</a>
</div>

<div>
	<div class="mycafe_manage">
		<!--  탈퇴 게시글 볼때만 노출-->
		<div class="secede_cafe_title" style="display: none;">
			<strong class="tit">6시그마 뽀개기</strong>
			<div class="common_btn_form fr">
				<a href="#" class="btn2">탈퇴 카페 목록</a>
			</div>
		</div>
		<!--  탈퇴 게시글 볼때만 노출 -->
		<div class="manage_article" style="display: none;">
			<strong class="tit">작성글 관리(게시글)</strong>
			<div class="my_article">
				<a class="on">게시글</a>
				<a href="#">댓글</a>
			</div>
		</div>
		<!-- SELECT BOXES -->
		<!--  -->
		<div class="mycafe_top">
			<c:if test="${cafeManageForm.showCafeManageView eq 1 }">
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
			</c:if>
		</div>

		<!-- 내 카페에 대한 메인 UI -->
		<div class="mycafe_group">
			<c:if test="${cafeManageForm.showCafeManageView eq 1 }">
				<div colspan="3" class="group">
					<span class="group_name">기본그룹<em class="num">${cafeManageForm.selectMyCafeListCnt }</em></span>
				</div>
			</c:if>
			<table class="mycafe_list">
			</table>
			<!---->
		</div>
		<div class="mycafe_bottom" style="">
		</div>
 	</div>
	<div class="common_page">(TODO) 페이지 넘버링</div>
</div>

