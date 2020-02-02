<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="content">
	<!--  전체 카페 통틀어서 추천 게시글 -->
	<div class="home_editors">
		<div class="common_title">
			<h2 class="title">
				Editor’s Pick
			</h2>
		</div>
		<ul class="home_editors_pick_list">
			<li>
				<a href="#" class="link">
					<div class="pick_thumb">
						<img src="/img/cafe/test_cafe_img2.png" width="250" height="250" alt="">
					</div>
					<div class="pick_info">
						<strong class="title">
							<span class="inner_tit"> 골목식당 따라잡기 도~전</span>
							<span class="inner_tit"> 분식집 떡볶이 레시피!</span>
						</strong>
						<div class="name_area">
							<div class="common_icon_box"><!----> <!----> <!----> <!----> <!----> <!----></div>
							<em class="name"> 신나는수원 / 수원친목모임</em>
						</div>
					</div>
				</a>	
			</li>
			<li>전체 카페 게시글중에서 인기 있는거 몇가지 추려내는곳</li>

			<!--
			@author skydrive860
			@brief board로 가는 테스트 임시 링크
			-->
			<a class="link_board need_auth" href="/board">
				<i>
					보드<span class="boardlink">100</span>
				</i>
			</a>

		</ul>
		<div class="common_btn_side">
			<button type="button" title="이전" disabled="disabled" class="btn_side_prev">
				<span class="blind">이전</span>
			</button>
			<button type="button" title="다음" class="btn_side_next">
				<span class="blind">다음</span>
			</button>
			<a href="/cafe-home/picks" class="link_side_all">
				<span class="blind">Editor’s Pick</span>모두보기
			</a>
		</div>
	</div>
	<!--  회원 유저가 가입한 카페에 대한 정보 -->
	<div class="home_user">
		<div class="common_menu_tab">
			<ul class="tab_list">
				<li class="on">
					<a href="#" class="link">
						내 카페<span class="blind">선택됨</span>
					</a>
				</li>
				<li>
					<a href="#" class="link">
					새글피드<!----> <!---->
					</a>
				</li>
			</ul>
		</div>
		<div class="home_user_mycafe">
			<div class="home_user_tab">
				<ul class="common_option_list">
					<li class="on">
						<a href="#" class="link">
							전체<span class="blind">선택됨</span>
						</a>
					</li>
					<li>
						<a href="#" class="link">즐겨찾는카페<!----></a>
					</li>
					<li>
				,		<a href="#" class="link">운영카페<!----></a>
					</li>
				</ul>
				<a href="/cafe-home/mycafe/join" class="btn_mycafe_edit">내 카페 관리</a>
			</div>
			 <!----> <!----> <!----> <!---->
			 <div class="user_mycafe_list">
			 	<c:forEach var="cafe" items="${cafeList }">
			 	
			 	</c:forEach>
			 	<div cafe="data" class="user_mycafe_area">
			 		<div class="user_mycafe_box">
			 			<div class="user_mycafe_thumb">
			 				<a href="#" class="link">
			 					<img src="/img/cafe/test_cafe_img1.png" onerror="this.src='https://ssl.pstatic.net/static/cafe/thumb/cafe_thumb_noimg_116.svg'" width="55" height="55" alt="">
			 				</a>
			 			</div>
				 		<div class="user_mycafe_info">
				 			<a href="#" class="name_area">
				 				<strong class="name">엄준식 공식 카페</strong>
								<div class="common_icon_box"><!----> <!----> <!----> <!----> <!----> <!----></div>
							</a>
							<div class="info_area">
								<a href="#" title="즐겨찾기" class="user_mycafe_bookmark">
									<span class="blind">즐겨찾기 선택 시 등록됨</span>
								</a>
								<a href="#" class="user_mycafe_new">새글 114</a>
							</div>
				 		</div>
				 		<button type="button" class="btn_mycafe_user on">
				 			<span class="blind">최근 게시글 목록 닫기</span>
				 		</button>
				 	
			 		</div>
			 		<div class="user_mycafe_recent">
			 			<ul class="recent_list">
			 				<li article="게시글">
			 					<div class="recent_info">
			 						<span class="nickname">엄준</span>
									<span class="time">32분 전</span>
			 					</div>
			 					<div class="recent_title">
			 						<div class="inner">
			 							<a href="#" class="tit">
			 								<em class="blind">글제목</em>
			 								무무형 방송안키는이유그거임
			 							</a>	
			 						</div>
			 					</div>
			 				</li>
			 				<li>해당 카페에 게시글을 생성</li>
			 			</ul>	
			 		</div>
			 	</div>
			 	
			 	<div cafe="이곳은 나의 카페에서 최근에 올라온 글을 보여주는 UI" class="user_mycafe_area">
			 		내가 가입한 다른카페의 정보를 노출
			 	</div>
			 	
			 	<!-- 
			 	<div cafe="이곳은 나의 카페에서 최근에 올라온 글을 보여주는 UI"></div>
			 	 -->
			 </div>
			 <div class="btn_area">
				 <div class="btn_area">
				 	<button type="button" class="btn_mycafe_more">내 카페 더보기</button>
				 </div>
			 </div>
			 
		</div>
		<div class="home_recent" style="display: none;">
			<!--  역활 모름 UI 노출 되지 않음.. -->
		</div>
	</div>
	<!--  카페 노출 UI -->
	<div class="home_theme">
		<div class="home_theme_title">
			<h2 class="title">이런 카페는 어때요?</h2>
		</div>
		<div class="common_scroll_box">
			<div class="common_box_tab">
				<strong data-v-bf233b6c="" class="blind">'카페 카테고리'</strong>
				<ul class="tab_list scroll_box_swiper" style="transform: translateX(0px);">
					<li data-v-bf233b6c="" class="on"><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							추천카페<span data-v-bf233b6c="" class="blind">선택됨</span>
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							생활
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							반려동물/동물
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							방송/연예
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							음악
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							친목/모임
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							교육
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							영화
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							만화/애니
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							문학/창작
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							컴퓨터/통신
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							가족/육아
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							팬카페
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							패션/미용
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							건강/다이어트
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							동창/동문
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							취미
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							정치/사회
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							경제/금융
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							인문/과학
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							종교/봉사
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							스포츠/레저
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							외국어
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							문화/예술
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							여행
							<!---->
						</button></li>
					<li data-v-bf233b6c="" class=""><button data-v-bf233b6c=""
							type="button" class="btn_tab">
							게임
							<!---->
						</button></li>

				</ul>
				<button data-v-bf233b6c="" type="button" class="btn btn_scroll_prev" disabled="">
					<span data-v-bf233b6c="" class="blind">이전</span>
				</button>
				<button data-v-bf233b6c="" type="button" class="btn btn_scroll_next">
					<span data-v-bf233b6c="" class="blind">다음</span>
				</button>
			</div>
		</div>
		<div class="home_theme_frame">
			관심 분야에 따른 카페 리스트
		</div>
	</div>
</div>
