<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- view [공지 / 회원 / 자유] 전용 UI 페이지 -->

<head>
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Content-Type" content="text/html;charset=KSC5601">
    <meta http-equiv="X-UA-Compatible" content="requiresActiveX=true">
    <title>카페이름 : 네이버 카페</title>
</head>

<div id="cafe-body-skin">
    <div id="cafe-body">

        <div id="naver-gnb">
            <!-- 상단 네이버 아이콘 -->
            <a href="http://www.naver.com" class="link_naver">
                <img src="/img/board/icon_naver_190423.png" width="52" height="10" alt="NAVER">
            </a>
            <!-- 상단 네이버 바 -->
            <div id="gnb-menu">
                <p class="naver-h" id="naver-h">
                    <a href="https://section.cafe.naver.com">카페홈</a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </p>
                <div id="button_join_cafe" class="join-cafe off">
                    <a href="#">가입카페</a>
                    <a href="#">
                    	<img id="joincafeimg" src="https://cafe.pstatic.net/cafe4/hidden.gif" width="13" height="13" alt="가입카페" class="btn-join down-gnb">
                    </a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
                <div id="button_mynews_alarm" class="chatting-cafe">
                    <a href="#" class="link_chatting">
                    	새글
                    </a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
                <div id="button_mynews_activity" class="chatting-cafe mynews-cafe off">
                    <a href="#" class="link_chatting">내소식</a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
				<!-- 뉴스 액티비티 -->
                <div id="layer_mynews_activity" class="cc_layer_mynews" style="display: none">
                    <div class="cc_mynews_header">
                        <h2 class="title">내소식</h2>
                    </div>

                    <div class="cc_mynews_content">
                        <div class="cc_mynews_none" style="display: none">
                            <strong class="title">내소식이 없습니다.</strong>
                            <p class="txt">가입한 카페의 활동 알림과 댓글알림을<br>이곳에서 모아볼 수 있어요.</p>
                        </div>

                        <div class="cc_mynews_area" style="display: none">
                            <span class="blind">최근 30일 이내의 최신순 소식입니다.</span>
                            <ul class="cc_mynews_list ">
                                <li id="_mynews_notice_tooltip">
                                    <div class="cc_mynews_notice">
                                        <p class="notice_txt">
                                            	알림의
                                            	 <span class="icon_option"></span> 
                                            	 버튼을 클릭하면, 알림을 설정할 수 있어요.
                                        </p>
                                        <!-- [D] .btn_close 클릭 시 공지 레이어는 미노출되게 해주세요~ -->
                                        <button id="_btn_hide_mynews_notice" type="button" class="btn_close">
                                        	<span class="blind">공지 닫기</span>
                                        </button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- alert -->
                <div class="cc_layer_alert" style="display:none;">
                    <strong class="blind">내소식 안내 레이어팝업</strong>
                    <div class="cc_alert_content">
                        <p class="txt"></p>
                    </div>
                    <div class="cc_alert_footer">
                        <button type="submit" class="cc_alert_btn">확인</button>
                    </div>
                </div>

                <!-- 채팅 ? -->
                <div class="chatting-cafe">
                    <a href="#" class="link_chatting">채팅</a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
             </div>
        </div>

        <!-- 카페 간판 -->
        <div id="front-img">
            <div id="front-cafe">
                <a href="/board/${cafe_url}">
					<span class="cafe_default">
						<span class="inner_default">
							<strong class="cafe_name">${cafe_name}</strong>
							<p class="cafe_url">${cafe_url}</p>
						</span>
					</span>
                </a>
            </div>
        </div>

        <!-- 본문 내용 -->
        <div id="content-area">

            <!-- 좌측 카페메뉴등의 div -->
            <div id="group-area" class="skin-1080 fl">
                <div class="cafe-info-action" id="cafe-info-action">
                    <div id="cafe-info-data">
                        <ul class="info-action-tab">
                            <li class="tit-bookmark">
                                <a class="_rosRestrict" href="#" title="즐겨찾는 카페 등록">
                                	<img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="27" height="28" alt="즐겨찾는 카페 등록" class="btn-bookmark-off" id="favoriteCafeInCafeInfo">
                                </a>
                            </li>
                            <li class="tit-info-on">
                                <p class="gm-tcol-t">카페정보</p>
                            </li>
                            <li class="tit-action">
                                <p>
                                	<a href="#" class="_rosRestrict">나의활동</a>
                                </p>
                            </li>
                        </ul>

                        <!-- 카페 정보 박스 -->
                        <div class="box-g">
                            <h4 class="d-none">카페정보</h4>

                            <div class="ia-info-data" id="ia-info-data">
                                <ul>
                                    <li class="gm-tcol-c">
                                        <a href="/MyCafeIntro.nhn?clubid=29995789">
                                            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_thumb_noimg_55.png" width="58" height="58" alt="카페아이콘" onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_thumb_noimg_55.png';">
                                            <span class="border mask_white"></span>
                                        </a>
									</li>
                                    <li class="gm-tcol-c">
                                        <em class="ico-manager">매니저</em>
                                        <a href="/yulimhall/member/ued_123/article" target="_blank" class="id mlink gm-tcol-c">
                                            <div class="ellipsis gm-tcol-c">
                                                <div class="ellipsis">${boardSimpleInfo.userNickName}</div>
                                            </div>
                                        </a>
                                        <div class="thm">
                                        	<a href="/CafeHistoryView.nhn?clubid=29995789" class="gm-tcol-c" target="cafe_main">
                                        		${cafe_createdate}
                                        	</a>
                                        </div>
                                        <div class="info-view">
                                        	<a href="#" class="u gm-tcol-c">
                                        		카페소개
                                        	</a>
                                        </div>
                                    </li>
								</ul>
                            </div>

                            <div class="ia-info-data2">
                                <ul>
                                    <li class="level-info border-sub">
                                        <a href="#" class="gm-tcol-c">
                                            <strong class="d-none">카페등급</strong>
                                            <span class="ico_rank rank1"></span>
                                            <em>씨앗1단계</em>
                                        </a>
									</li>
                                        <%--                                        <div class="level_alert " id="rankingNotice">--%>
                                        <%--                                            <i class="ico_top_arr"></i>--%>
                                        <%--                                            <a href="#" class="inner" onclick="cafeRanking();return false;">--%>
                                        <%--                                                <p class="txt">우리 카페는 <strong>씨앗1단계</strong>를<br>유지하고 있어요.</p>--%>
                                        <%--                                            </a>--%>
                                        <%--                                            <a href="#" class="link_more"--%>
                                        <%--                                               onclick="goRankingNoticeDetail('https://section.cafe.naver.com/cafe-home/cafes/rankings-introduction');return false;">자세히--%>
                                        <%--                                                보기<i class="ico_more"></i></a>--%>
                                        <%--                                            <a href="#" class="btn_close"--%>
                                        <%--                                               onclick="hideRankingNotice();return false;"><span--%>
                                        <%--                                                    class="blind">닫기</span></a>--%>
                                        <%--                                        </div>--%>

                                    <li class="mem-cnt-info" style="cursor:pointer;">
                                        <strong class="d-none">카페멤버수</strong>

                                        <a href="#">
                                            <span class="ico"></span>
                                            <em>${boardSimpleInfo.cafeMemberCnt}
                                            	<span class="ico_lock2">비공개</span>
                                            </em>
                                        </a>

                                        <div class="ly_info_dsc" style="font-weight:normal;top:14px;left:5px;display:none;" id="hiddenCafeApplyLayer" onmouseover="showCafeApplyLayer();" onmouseout="hideCafeApplyLayer();">
                                            <div class="cont cont_v1" style="width:60px">
                                                <p>
                                                	<a href="/ManageJoinApplication.nhn?search.clubid=29995789" onblur="hideCafeApplyLayer();">
                                                		가입대기 
                                                		<span>0</span>
                                                	</a>
                                                </p>
                                                <span class="tail" style="left:31px"></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="ia-info-data3" id="cafePopularityLog">
                                <ul class="gm-tcol-c">
                                    <li class="info">
                                        <span class="tit">
                                        	<span class="ico_bkmk"></span>
                                        	<strong class="gm-tcol-c">
                                        		<a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955" class="gm-tcol-c" target="_blank">
                                        			즐겨찾는 멤버
                                        		</a>
                                        	</strong>
                                        </span>
                                        <em>
                                        	<a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955" class="gm-tcol-c" target="_blank">
                                        		0
                                        	</a>
                                        	<span class="gm-tcol-c">명</span>
                                        </em>
                                    </li>
                                    <li class="info2">
                                        <span class="tit">
                                        	<span class="ico_bkmk2"></span>
                                        	<strong class="gm-tcol-c">
                                        		<a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955" class="gm-tcol-c" target="_blank">
                                        			게시판 구독수
                                        		</a>
                                        	</strong>
                                        </span>
                                        <em>
                                        	<a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955" class="gm-tcol-c" target="_blank">
                                        		0
                                        	</a>
                                        	<span class="gm-tcol-c">회</span>
                                        </em>
                                    </li>
                                    <li class="info3" id="cafePopularityLog_info3">
                                        <span class="tit">
                                        	<span class="ico_mbl"></span>
                                        	<strong class="gm-tcol-c">우리카페앱 수</strong>
                                        </span>
                                        <em>
                                        	0
                                        	<span class="gm-tcol-c">회</span>
                                        </em>
                                        <!-- [D] 우리카페앱 수 안내 레이어 -->
                                        <div class="ly_info_dsc" style="top:-60px;right:-3px;display:none;" id="appCafeInstallCountDescLayer">
                                            <div class="cont cont_v3">
                                                <p>모바일에서 우리카페를<br> 바탕화면에 추가한 수 <br> 
                                                	<a href="https://help.naver.com/support/alias/cafe/cafe21.naver" class="more" target="_blank">자세히 보기</a>
                                                </p>
                                                <span class="tail2"></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
						</div>

                        <!-- 카페 가입 버튼 or 카페 글 쓰기 버튼 -->
                        <div class="cafe-write-btn">
                            <a href="#" class="_rosRestrict" id="boardMainBtn">카페 가입하기</a>
                        </div>

                        <!-- 카페 채팅 버튼 -->
                        <div class="ia-info-btn">
                            <ul class="ia-info-list">
                                <li>
                                	<a href="#" class="link_chat _tabletRestrict(채팅)" target="_blank">카페 채팅</a>
                               </li>
                            </ul>
                        </div>
                    </div>
                    <div id="member-action-data" style="display:none">
                        <ul class="info-action-tab" role="tablist">
                            <li class="tit-bookmark">
                                <a class="_rosRestrict" href="#" title="즐겨찾는 카페 등록">
                                	<img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="27" height="28" alt="즐겨찾는 카페 등록" class="btn-bookmark-off" id="favoriteCafeInMemberInfo">
                                </a>
                            </li>
                            <li class="tit-info" role="presentation">
                                <p role="tab">
                                	<a href="#">카페정보</a>
                                </p>
                            </li>
                            <li class="tit-action-on" role="presentation">
                                <p role="tab" class="gm-tcol-t">나의활동</p>
                            </li>
                        </ul>
                        <div class="box-g" role="tabpanel">
                            <h4 class="d-none">나의활동</h4>
                            <div id="ia-action-data"></div>
                        </div>

                        <!-- 카페 글쓰기 or 카페 가입하기 -->
                        <div class="cafe-write-btn">
                            <a href="#" class="_rosRestrict">카페 가입하기</a>
                        </div>

                        <div class="ia-info-btn">
                            <ul class="ia-info-list">
                                <li>
                                	<a href="#" class="link_chat _tabletRestrict(채팅)" target="_blank">카페 채팅</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 카페 메뉴 -->
                <div id="cafe-menu">
                    <div class="box-g-t"></div>
                    <div class="box-g-m">
                        <ul class="cafe-menu-list">
                            <li>
                                <img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="10" height="11" class="ico-list" alt="">
                                     <a href="#" target="cafe_main" class="gm-tcol-c" id="menuLink0">전체글보기</a>
                                <span class="gm-tcol-c total">${boardSimpleInfo.cafeBoardCnt}</span>
                            </li>
                        </ul>
                        <div class="cafe-menu-space"></div>
                        <ul class="cafe-menu-list">
                            <li>
                                <img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="10" height="11" class="ico-list" alt="">
                                <a href="/ArticleList.nhn?search.clubid=29995789&amp;search.menuid=1&amp;search.boardtype=L" target="cafe_main" class="gm-tcol-c" id="menuLink1">
									자유게시판
                                </a>
                                <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/ico_new.png" width="12" height="12" class="ico_new" alt="새 게시글">
                                <script type="text/javascript">showGroupNewImage("groupnewimg");</script>
                            </li>
                        </ul>
                    </div>
                    <div class="box-g-b"></div>
                </div>

                <!-- 최근 댓글, 답글 -->
                <ul class="com">
                    <li class="box-w">
                        <div id="recent-reply">
                            <div class="group-tit">
                                <h4 class="tcol-t">최근 댓글ㆍ답글</h4>
                            </div>
                            <ul class="group-list" id="first-reply-page">
                                <li></li>
                                <li style="text-align:center">
                                	<span class="tcol-c">최근 댓글ㆍ답글이<br>없습니다.</span>
                                </li>
                                <li></li>
                            </ul>
                        </div>
                    </li>
                </ul>

                <!-- 배너 챗봇 이미지 -->
                <div class="banner_chatbot">
                    <a href="https://talk.naver.com/ct/wc63k2" class="chatbot">
                        <img src="/img/board/banner_chatbot.png" width="171" height="55" alt="궁금한게 있을 땐 카페 스마트봇">
                    </a>
                </div>
            </div>

            <!-- 센터 영역 -->
            <div id="main-area" class="skin-1080 fr">
                <div class="main_content">
                    <input id="gateOpen" type="hidden" value="1">
                    <input id="searchviewtype" type="hidden" value="title">
                    <iframe name="cafe_main" id="cafe_main" title="카페 메인" src=
                       <c:choose>
                       		<c:when test = '${not empty boardUid}'>
                       			"/board/boardCenter/p/${boardUid}"
                       		</c:when>
                       		<c:otherwise>
                       			"/board/boardCenter/${boardSimpleInfo.cafeUid}"	
                       		</c:otherwise>
                       </c:choose>
                        width="860" height="100%" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowtransparency="true" allowfullscreen="" style="height: 1598px;">
					</iframe>
					<script type="text/javascript" src="/js/board/boardPostView.js?${applicationScope.cachetype}"></script>
				</div>
                
                <div id="smart_editor" style="visibility: hidden; height:1px;">
                    <jsp:include page="./commonBoardInsert.jsp" flush="true"/>
                </div>
                
                <div id="join_editor" style="visibility: hidden; height:1px;">
                    <jsp:include page="./commonBoardJoin.jsp" flush="true"/>
                	<script type="text/javascript" src="/js/board/boardMemberJoin.js?${applicationScope.cachetype}"></script>
				</div>
            </div>
        </div>
        <!--  footer -->
    	<footer class="footer">
            <h2 class="cafe_name">영통자이 입주예정자 카페</h2>
            <a href="#" class="cafe_link">https://cafe.naver.com/youngtongxi</a>
            <h2><a href="#" class="naver_cafe"><span class="blind">NAVER 카페</span></a></h2>
        </footer>
    
    </div>
	
	<div id="login_info">
        <input type="hidden" name="useruid" value="${userUid}" />
        <input type="hidden" name="nickname" value="${nickName}" />
        <input type="hidden" name="isCafeUser" value="${boardSimpleInfo.cafeUser}" />
        <input type="hidden" name="cafeLevel" value="${boardSimpleInfo.cafeLevel}"/>
    </div>
	<div id="cafe_info">
        <input type="hidden" name="cafeUid" value="${boardSimpleInfo.cafeUid}" />
        <input type="hidden" name="cafeOfficial" value="${boardSimpleInfo.cafeOfficial}" />
        <input type="hidden" name="cafeUrl" value="${cafe_url}"/>
    </div>
    <script class="personal_js" type="text/javascript" src="/js/board/board.js?${applicationScope.cachetype}" ></script>
</div>