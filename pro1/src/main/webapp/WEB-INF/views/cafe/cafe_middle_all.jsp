<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!-- sub_main 일떄 -->
<c:if test="${sub_page eq 'sub_main'}">
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
		<button type="button" title="이전" class="btn_side_prev">
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
					<a href="javascript:void(0);" class="link">
						전체<span class="blind">선택됨</span>
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="link">즐겨찾는카페<!----></a>
				</li>
				<li>
					<a href="javascript:void(0);" class="link">운영카페<!----></a>
				</li>
			</ul>
			<a href="/cafe-home/mycafe/join" class="btn_mycafe_edit">내 카페 관리</a>
		</div>
		 <!----> <!----> <!----> <!---->
		 <div class="user_mycafe_list">
		 	<!--  내가 가입하거나 생성한 카페를5개씩묶어주고 더보기 이벤트 할떄마다 5개씩 더 보여준다. -->
		 	<c:forEach var="user_cafe" items="${cafeList.userCafeList}" varStatus="status">
		 		
		 		<c:if test="${status.index % 5 eq 0 }">
		 		<div class="user_mycafe_container" style="display:none">
		 		</c:if>
				
				 	<div cafe="data" class="user_mycafe_area">
				 		<div class="user_mycafe_box">
				 			<div class="user_mycafe_thumb">
				 				<a href="/board/${user_cafe.cafe.url}" class="link">
				 					<img src="/${user_cafe.cafe.icon }" onerror="this.src='https://ssl.pstatic.net/static/cafe/thumb/cafe_thumb_noimg_116.svg'" width="55" height="55" alt="">
				 				</a>
				 			</div>
					 		<div class="user_mycafe_info">
					 			<a href="/board/${user_cafe.cafe.url}" class="name_area">
					 				<strong class="name">${user_cafe.cafe.name }</strong>
									<div class="common_icon_box">
									<c:if test="${user_cafe.cafeLevel eq 'admin' }">
										<em class="icon_manager">
											<span class="blind">운영</span>
											<!-- 카페 경로를 숨김 -->
										</em>
									</c:if>
									<c:if test="${user_cafe.cafeOfficial eq '1' }">
										<em class="icon-powercafe">
											<span class="blind">대표카페</span>
										</em>
									</c:if>
									<!----> <!----> <!----> <!----> <!----> <!----></div>
								</a>
								<div class="info_area">
									<a href="#" title="즐겨찾기" class="user_mycafe_bookmark<c:if test = '${user_cafe.cafeFav eq 1}'> on</c:if>">
										<span class="blind">즐겨찾기 선택 시 등록됨</span>
									</a>
									<a href="#" class="user_mycafe_new">새글 114(TODO: board table 완성대면 join으로 들고오기)</a>
								</div>
					 		</div>
					 		<button type="button" class="btn_mycafe_user on">
					 			<span class="blind">최근 게시글 목록 닫기</span>
					 		</button>
					 	
				 		</div>
				 		<!-- 
				 		TODO board ui 완성대면 Join 으로 들고오기
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
				 		 -->
				 	</div>
				 	<!--  내카페 리스트가 5단위로 끝나거나, 마지막 순서일떄는 태그를닫는다. -->
				 <c:if test="${status.index % 5 eq 4 || status.last}">
				 </div>
		 		</c:if>
		 		
		 	</c:forEach>
		 	<!-- 
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
							<div class="common_icon_box"></div>
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
		 	 -->
		 	 
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
</c:if>
<!--  카페 노출 UI -->
<div class="home_theme">
	<div class="home_theme_title">
		<h2 class="title">
		<c:choose>
			<c:when test="${sub_page eq 'sub_main'}">
			이런 카페는 어때요?
			</c:when>
			<c:when test="${sub_page eq 'sub_theme'}">
			주제별 카페
			</c:when>
			<c:when test="${sub_page eq 'sub_area'}">
			지역별 카페
			</c:when>
			<c:when test="${sub_page eq 'sub_ranking'}">
			랭킹 Top 100
			</c:when>
		</c:choose>
		</h2>
	</div>
	<div class="common_scroll_box">
		<div class="common_box_tab">
			<strong data-v-bf233b6c="" class="blind">'카페 카테고리'</strong>
			<ul class="tab_list scroll_box_swiper" style="transform: translateX(0px);">
				<!-- 
				<c:choose>
					<c:when test="${sub_page eq 'sub_main'}">
						<li data-v-bf233b6c="" class="on">
							<button data-v-bf233b6c="" type="button" class="btn_tab">
								추천카페
								<span data-v-bf233b6c="" class="blind">선택됨</span>
							</button>
						</li>
						<li data-v-bf233b6c="" class="">
							<button data-v-bf233b6c="" type="button" class="btn_tab">
								생활
							</button>
						</li>
					</c:when>
					<c:when test="${sub_page eq 'sub_theme'}">
						<li data-v-bf233b6c="" class="on">
							<button data-v-bf233b6c="" type="button" class="btn_tab">
								생활 <span data-v-bf233b6c="" class="blind">선택됨</span>
							</button>
						</li>
					</c:when>
				</c:choose>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						반려동물/동물
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						방송/연예
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						음악
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						친목/모임
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						교육
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						영화
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						만화/애니
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						문학/창작
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						컴퓨터/통신
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						가족/육아
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						팬카페
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						패션/미용
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						건강/다이어트
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						동창/동문
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						취미
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						정치/사회
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						경제/금융
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						인문/과학
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						종교/봉사
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						스포츠/레저
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						외국어
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						문화/예술
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						여행
					</button>
				</li>
				<li data-v-bf233b6c="" class="">
					<button data-v-bf233b6c="" type="button" class="btn_tab">
						게임
					</button>
				</li>
 				-->
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
		<c:if test="${sub_page eq 'sub_theme'}">
			<div class="theme_reservation">
				<h3 class="title">사전예약카페</h3> 
				<ul class="reservation_list">
					<li>
						<a href="#" class="list_thumb">
							<div class="thumb">
								<strong class="common_icon_reserve"><span class="blind">사전예약</span></strong> 
								<img src="https://cafethumb.pstatic.net/MjAyMDAyMTlfODkg/MDAxNTgyMDk2MDk1NDk1.8uc6jkIZZCFfhM-I9qJKrvc-XZ5jdhWVPmnYop0r2fEg.3GBRs3eE2Sm04J9GnNzejsTX9Lwwv2Sh-dDv-RR5yhog.JPEG/wotv_logo_1000x814.jpg?type=f150_150_mask" width="124" height="124" alt="" onerror="this.src='https://ssl.pstatic.net/static/cafe/thumb/cafe_thumb_noimg_116.svg'">
							</div>
							<strong class="cafe_name">
				            WOTV FFBE
				        	</strong>
				        	<em class="period">
				        		<span class="blind">사전예약기간</span> 2월20일~3월23일
				        	</em>
				        </a> 
			        	<div class="btn_area">
			        		<a href="#" class="btn type_apply">신청하기</a>
			        	</div>
			        </li>
				</ul>
			</div>
			<div class="theme_category">
				<div class="common_category">
					<strong class="blind">
						현재 선택된 하위 카테고리 버튼 클릭 시 다른 하위 카테고리를
						선택할 수 있습니다.
					</strong>
					<button type="button" class="btn_category">생활</button>
					<div class="layer" style="display: none;">
						<ul class="layer_list">
							<li class="on">
								<button type="button" class="btn">생활</button>
								<span class="blind">선택됨</span>
							</li>
						</ul>
					</div>
				</div>
				<em class="count" style="display: none;">총 100개</em>
			</div>
		</c:if>
		<c:if test="${sub_page eq 'sub_theme' || sub_page eq 'sub_area'}">
			<div class="theme_sort">
				<ul class="common_option_list">
					<li class="on">
						<a href="#" class="link">급상승 Top100<span class="blind">선택됨</span></a>
					</li>
					<li class="">
						<a href="#" class="link">랭킹 Top100<!----></a>
					</li>
					<li class="">
						<a href="#" class="link">전체<!----></a>
					</li>
				</ul>
				
				<div class="common_select">
					<strong class="blind">현재 정렬순서. 버튼 선택 시 정렬선택</strong>
					<button type="button" class="btn_select">급상승 순</button>
					<div class="layer" style="display: none;">
						<ul class="layer_list">
							<li class="on">
								<button type="button" class="btn">급상승 순</button>
								<span class="blind">선택됨</span>
							</li>
							<li class="">
								<button type="button" class="btn">멤버 순</button><!---->
							</li>
							<li class="">
								<button type="button" class="btn">게시글 순</button><!---->
							</li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<ul class="common_list">
			<!-- TODO: 추천카페 탭 리스트 만들기 -->
			<c:forEach var="rec_cafe" items="${cafeList.recommend_CafeMap}" varStatus="status">
				<!-- key별로 list 호출 -->
				<!--  status.index -->
				<c:choose>
					<c:when test="${sub_page eq 'sub_main' }">
						<div class="recommed_cafe_wrapper"  style="display: none;">	
					</c:when>
					<c:when test="${sub_page eq 'sub_theme' || sub_page eq 'sub_area' }">
						<div class="recommed_cafe_wrapper"  style="<c:if test='${status.index gt 0 }'>display: none;</c:if>">	
					</c:when>
				</c:choose>
				<c:forEach var="cafeVO" items="${rec_cafe.value}">
					<li style="display:none;">
						<a href="/board/${cafeVO.cafe.url}" class="list_link">
							<div class="list_thumb">
								<!---->
								<img src="/${cafeVO.cafe.icon}" width="80" height="80" onerror="this.src='https://ssl.pstatic.net/static/cafe/thumb/cafe_thumb_noimg_116.svg'"alt="">
							</div>
							<div class="list_info">
								<div class="name_area">
									<strong class="name">${cafeVO.cafe.name}</strong>
									<div class="common_icon_box">
									<c:if test="${cafeVO.cafeOfficial eq 1 }">
										<em class="icon-powercafe">
											<span class="blind">대표카페</span>
										</em>
									</c:if>
										<!---->
										<!---->
										<!---->
										<!---->
										<!---->
										<!---->
									</div>
								</div>
								<div class="txt_area">
									<p class="txt">${cafeVO.cafe.desc}</p>
								</div>
								<div class="info_area">
									<span class="info">멤버 ${cafeVO.cafe.memberCnt}명</span>
									<!---->
									<!---->
									<!---->
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
				</div>
			</c:forEach>
		</ul>
		<div class="common_page"><!----> 
			<c:forEach begin="1" end="10" var="count">
				<button type="button" class='btn <c:if test="${count eq 1 }"> on</c:if>' style="display: none">
					${count }
					<c:if test="${count eq 1 }">
						<span class="blind">선택됨</span>
					</c:if>
				</button>
			</c:forEach>
		</div>
	</div>
</div>
