<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- view [공지 / 회원 / 자유] 전용 UI 페이지 -->
<html lang="ko">
<body>
<head>
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Content-Type" content="text/html;charset=KSC5601">
    <meta http-equiv="X-UA-Compatible" content="requiresActiveX=true">
    <title>카페이름 : 네이버 카페</title>

    <link rel="stylesheet" href="/css/board/board.css" type="text/css">
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
                    <a href="#"><img id="joincafeimg" src="https://cafe.pstatic.net/cafe4/hidden.gif" width="13"
                                     height="13" alt="가입카페" class="btn-join down-gnb"></a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
                <div id="button_mynews_alarm" class="chatting-cafe">
                    <a href="#" class="link_chatting">새글</a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>
                <div id="button_mynews_activity" class="chatting-cafe mynews-cafe off">
                    <a href="#" class="link_chatting">내소식</a>
                    <img src="https://cafe.pstatic.net/cafe4/ico-blank.gif" width="1" height="10" alt="" class="tcol-c">
                </div>

                <!-- 뉴스 액ㅌ비티 -->
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
                                            알림의 <span class="icon_option"></span> 버튼을 클릭하면, 알림을 설정할 수 있어요.
                                        </p>
                                        <!-- [D] .btn_close 클릭 시 공지 레이어는 미노출되게 해주세요~ -->
                                        <button id="_btn_hide_mynews_notice" type="button" class="btn_close"><span
                                                class="blind">공지 닫기</span></button>
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
                <!-- GNB 템플릿 적용부 -->
                <%-- <div id="gnb" class="">
                <strong class="blind">사용자 링크</strong>
                <ul class="gnb_lst" id="gnb_lst" style="display: block;">
                    <li class="gnb_login_li" id="gnb_login_layer" style="display: inline-block;">
                        <a class="gnb_btn_login" href="https://nid.naver.com/nidlogin.login" id="gnb_login_button">
                        <span class="gnb_bg"></span><span class="gnb_bdr"></span>
                        <span class="gnb_txt">로그인</span></a>
                    </li>
                    <li class="gnb_my_li" id="gnb_my_layer" style="display:none">
                        <div class="gnb_my_namebox" id="gnb_my_namebox" style="background-image: url(&quot;https://ssl.pstatic.net/static/common/gnb/2014/ico_arrow_bl1.gif&quot;);">
                        <a href="javascript:;" class="gnb_my" onclick="gnbUserLayer.clickToggle(); return false;">
                        <img id="gnb_profile_img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" width="26" height="26" alt="내 프로필 이미지">
                        <span id="gnb_profile_filter_mask" class="filter_mask"></span> <span class="gnb_name" id="gnb_name1"></span>
                        <em class="blind">내정보 보기</em><span class="ico_arrow"></span></a><a href="#" class="gnb_emp" id="gnb_emp">(임직원혜택)</a></div><div class="gnb_my_lyr" id="gnb_my_lyr"><div class="gnb_my_content"><div class="gnb_img_area"><span class="gnb_mask"></span><img src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" width="80" height="80" alt="프로필 이미지"><a href="https://nid.naver.com/user2/api/naverProfile.nhn?m=checkIdType" class="gnb_change"><span class="blind">프로필 사진 변경</span></a></div><div class="gnb_txt_area"><p class="gnb_account"><span class="gnb_name" id="gnb_name2"><a class="gnb_nick" href="https://nid.naver.com/user2/api/naverProfile.nhn?m=checkIdType">_</a>님</span><a class="gnb_btn_login" href="https://nid.naver.com/nidlogin.logout?returl=https://cafe.naver.com/Logout.nhn?alreadyNaverLogout=true" id="gnb_logout_button"><span class="gnb_bg"></span><span class="gnb_bdr"></span><span class="gnb_txt">로그아웃</span></a></p><a href="https://mail.naver.com" class="gnb_mail_address">@naver.com</a><ul class="gnb_edit_lst"><li class="gnb_info"><a href="https://nid.naver.com/user2/help/myInfo.nhn?menu=home">내정보</a></li><li class="gnb_secure" id="gnb_secure_lnk"><a href="https://nid.naver.com/user2/help/myInfo.nhn?m=viewSecurity&amp;menu=security">보안설정</a></li></ul><p class="gnb_pay_check" id="gnb_pay_check"><em>N Pay</em><a href="http://pay.naver.com" id="gnb_pay_point"><span>내 페이포인트</span></a></p></div></div><div class="gnb_my_community"><a href="http://blog.naver.com/MyBlog.nhn" class="gnb_blog">내 블로그</a><a href="http://section.cafe.naver.com" class="gnb_cafe">가입한 카페</a><a href="http://pay.naver.com" class="gnb_pay"><span>N Pay</span></a></div><a href="#" class="gnb_my_interface" style="display:none"><span class="blind">환경설정</span></a></div><iframe id="gnb_my_lyr_iframe" title="빈 프레임" class="gnb_pad_lyr" name="padding" width="0" height="0" scrolling="no" frameborder="0" style="top:34px;right:-4px;width:320px;height:174px;display:none;opacity:0;-ms-filter:alpha(opacity=0)"></iframe></li><li class="gnb_notice_li" id="gnb_notice_layer" style="display:none"><a href="javascript:;" class="gnb_notice" onclick="gnbNaverMeLayer.clickToggle(); return false;"><span class="blind">알림</span><span class="gnb_icon"></span><em class="gnb_ico_num" id="gnb_me_menu" style="display:none"><span class="gnb_ico_new"><span class="gnb_count" id="gnb_me_count"></span></span></em><span class="ico_arrow"></span></a><div class="gnb_notice_lyr" id="gnb_notice_lyr"><div class="svc_noti svc_panel"><div class="svc_scroll"><div class="svc_head"><strong class="gnb_tit">전체 알림</strong><div class="task_right"><button onclick="gnbNaverMeLayer.deleteReadList(this, event);" id="gnb_btn_read_noti_del">읽은 알림 삭제</button><button onclick="gnbNaverMeLayer.showDeleteAlert();" id="gnb_btn_all_noti_del">모두 삭제</button></div></div><div class="svc_body" id="gnb_naverme_layer"></div></div><div class="gnb_ly_alert" id="gnb_ly_alert" style="display: none;"><p class="gnb_msg"><strong>알림을 모두 삭제하시겠습니까?</strong></p><div class="gnb_btns"><button id="ly_alert_confirm" onclick="gnbNaverMeLayer.deleteAllList(this, event);">확인</button><button onclick="gnbNaverMeLayer.hideDeleteAlert();">취소</button></div><button class="gnb_btn_close" onclick="gnbNaverMeLayer.hideDeleteAlert();"><i>레이어 닫기</i></button></div><a href="https://noti.naver.com/index.nhn" class="gnb_notice_all">내 알림 전체보기</a></div></div><iframe id="gnb_notice_lyr_iframe" title="빈 프레임" class="gnb_pad_lyr" name="padding" width="0" height="0" scrolling="no" frameborder="0" style="top:34px;right:-4px;width:299px;height:332px;display:none;opacity:0;-ms-filter:alpha(opacity=0)"></iframe></li><li class="mail_li" id="gnb_mail_layer" style="display:none"><a href="https://mail.naver.com" class="gnb_mail"><span class="blind">메일</span><span class="gnb_icon"></span><em class="gnb_ico_num" id="gnb_mail_menu" style="display:none"><span class="gnb_ico_new"><span class="gnb_count" id="gnb_mail_count"></span></span></em></a></li><li class="gnb_service_li" id="gnb_service_layer" style="display: inline-block;"><a href="javascript:;" class="gnb_service" onclick="gnbMoreLayer.clickToggle(); return false;"><span class="blind">서비스 더보기</span><span class="gnb_icon"></span><span class="ico_arrow"></span></a><div class="gnb_service_lyr" id="gnb_service_lyr"><div class="gnb_favorite_search" id="gnb_favorite_search"><div class="gnb_favorite_area"><div class="gnb_favorite_lstwrp"><div class="gnb_first_visit" style="display:none"><span class="blind">나만의 즐겨찾기를 추가해 보세요!</span><a href="#" class="gnb_close"><span class="blind">닫기</span></a></div><strong class="blind">즐겨찾는 서비스</strong><ul class="gnb_favorite_lst" id="gnb_favorite_lst"><li class="gnb_add"><a href="#"><span class="ic_add"></span>추가</a></li><li class="gnb_add"><a href="#"><span class="ic_add"></span>추가</a></li><li class="gnb_add"><a href="#"><span class="ic_add"></span>추가</a></li><li class="gnb_add"><a href="#"><span class="ic_add"></span>추가</a></li></ul><a href="#" class="gnb_my_interface" onclick="gnbMoreLayer.clickToggleWhole(); return false;"><span class="blind">즐겨찾기 설정</span></a></div></div><div class="gnb_search_area"><div class="gnb_search_box" onmouseover="gnb_search.mouseOver(this);" onmouseout="gnb_search.mouseOut(this);"><input id="gnb_svc_search_input" type="text" title="서비스 검색" value="더 많은 서비스를 간편하게 시작하세요!" onfocus="gnb_search.clearInput(this);" onblur="gnb_search.resetInput(this);" onkeydown="gnb_search.keyDown(event);" onkeyup="gnb_search.keyUp(event);"><a href="#" class="gnb_del_txt" id="gnb_del_txt" style="display:none"><span class="blind">삭제</span></a><div class="gnb_pop_input" id="gnb_pop_input" tabindex="0" onfocus="gnb_search.searchPopOnMouse = true; return false;" onfocusout="gnb_search.searchPopOnMouse = false; return false;" onmouseover="gnb_search.searchPopOnMouse = true; return false;" onmouseout="gnb_search.searchPopOnMouse = false; return false;" style="display:none"><ul class="gnb_pop_lst"></ul></div></div><div id="gnb_search_lstwrp" class="gnb_search_lstwrp"><ul class="gnb_search_lst gnb_first"><li class="gnb_first"><a href="http://cafe.naver.com/">카페</a></li><li><a href="http://news.naver.com/">뉴스</a></li><li><a href="http://map.naver.com/">지도</a></li><li><a href="http://sports.news.naver.com/">스포츠</a></li><li><a href="http://game.naver.com/">게임</a></li></ul><ul class="gnb_search_lst"><li class="gnb_first"><a href="http://section.blog.naver.com/">블로그</a></li><li><a href="http://post.naver.com/main.nhn">포스트</a></li><li><a href="http://dic.naver.com/">사전</a></li><li><a href="http://kin.naver.com/">지식iN</a></li><li><a href="http://weather.naver.com/">날씨</a></li></ul><ul class="gnb_search_lst"><li class="gnb_first"><a href="https://mail.naver.com/">메일</a></li><li><a href="http://stock.naver.com/">증권</a></li><li><a href="http://land.naver.com/">부동산</a></li><li><a href="https://vibe.naver.com/today/">VIBE</a></li><li><a href="http://book.naver.com">책</a></li></ul><ul class="gnb_search_lst"><li class="gnb_first"><a href="http://shopping.naver.com/">쇼핑</a></li><li><a href="http://comic.naver.com/">웹툰</a></li><li><a href="http://movie.naver.com/">영화</a></li><li><a href="http://cloud.naver.com/">클라우드</a></li><li><a href="http://auto.naver.com/">자동차</a></li></ul></div></div><div class="gnb_banner"><a href="https://campaign.naver.com/npay/rediret/index.nhn" class="gnb_service_event"><img id="gnb_promo" alt="이벤트 참여하면 포인트 적립!" width="265" height="47" src="https://ssl.pstatic.net/static/common/gnb/banner/promo_npay_200108.png"></a></div><div class="gnb_linkwrp"><a href="http://www.naver.com/more.html" class="gnb_service_all" id="gnb_service_all">전체 서비스 보기</a></div></div><div class="gnb_svc_more" id="gnb_svc_more" style=""><strong class="blind">네이버 주요 서비스</strong><div class="gnb_bg_top"></div><div class="gnb_svc_hd" id="gnb_svc_hd" tabindex="0"><strong class="gnb_svc_tit">바로가기 설정</strong><span class="link"><a href="http://www.naver.com/more.html">전체 서비스 보기</a></span></div><div class="gnb_svc_lstwrp"><div class="gnb_svc_lst1"><ul class="gnb_first"><li><input type="checkbox" id="nsvc_game" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_game">게임</label></li><li><input type="checkbox" id="nsvc_weather" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_weather">날씨</label></li><li><input type="checkbox" id="nsvc_shopping" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_shopping">네이버쇼핑</label></li><li><input type="checkbox" id="nsvc_navercast" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_navercast">네이버캐스트</label></li><li><input type="checkbox" id="nsvc_cloud" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_cloud">네이버클라우드</label></li><li class="gnb_event"><input type="checkbox" id="nsvc_naverpay" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_naverpay">네이버페이<em class="ic_gnb_new">New</em></label></li><li><input type="checkbox" id="nsvc_news" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_news">뉴스</label></li><li><input type="checkbox" id="nsvc_comic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_comic">만화/웹툰</label></li><li><input type="checkbox" id="nsvc_memo" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_memo">메모</label></li><li><input type="checkbox" id="nsvc_mail" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_mail">메일</label></li><li><input type="checkbox" id="nsvc_music" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_music">뮤직</label></li><li><input type="checkbox" id="nsvc_land" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_land">부동산</label></li><li><input type="checkbox" id="nsvc_bookmark" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_bookmark">북마크</label></li></ul><ul class=""><li><input type="checkbox" id="nsvc_blog" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_blog">블로그</label></li><li><input type="checkbox" id="nsvc_dic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_dic">사전</label></li><li><input type="checkbox" id="nsvc_software" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_software">소프트웨어</label></li><li><input type="checkbox" id="nsvc_sports" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_sports">스포츠</label></li><li><input type="checkbox" id="nsvc_ya9" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_ya9">야구9단</label></li><li><input type="checkbox" id="nsvc_movie" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_movie">영화</label></li><li><input type="checkbox" id="nsvc_office" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_office">오피스</label></li><li><input type="checkbox" id="nsvc_novel" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_novel">웹소설</label></li><li><input type="checkbox" id="nsvc_auto" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_auto">자동차</label></li><li><input type="checkbox" id="nsvc_contact" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_contact">주소록</label></li><li><input type="checkbox" id="nsvc_finance" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_finance">증권(금융)</label></li><li><input type="checkbox" id="nsvc_map" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_map">지도</label></li><li><input type="checkbox" id="nsvc_kin" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_kin">지식iN</label></li></ul><ul class=""><li><input type="checkbox" id="nsvc_terms" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_terms">지식백과</label></li><li><input type="checkbox" id="nsvc_book" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_book">책</label></li><li><input type="checkbox" id="nsvc_cafe" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_cafe">카페</label></li><li><input type="checkbox" id="nsvc_calendar" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_calendar">캘린더</label></li><li><input type="checkbox" id="nsvc_photo" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_photo">포토갤러리</label></li><li><input type="checkbox" id="nsvc_nstore" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_nstore">N스토어</label></li><li><input type="checkbox" id="nsvc_navertv" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_navertv">네이버TV</label></li></ul></div><div class="svc_lst2"><div class="svc_spc gnb_first"><strong><a href="http://dic.naver.com/">어학사전</a></strong><ul class=""><li><input type="checkbox" id="nsvc_krdic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_krdic">국어사전</label></li><li><input type="checkbox" id="nsvc_endic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_endic">영어/영영사전</label></li><li><input type="checkbox" id="nsvc_hanja" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_hanja">한자사전</label></li><li><input type="checkbox" id="nsvc_jpdic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_jpdic">일어사전</label></li><li><input type="checkbox" id="nsvc_cndic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_cndic">중국어사전</label></li><li><input type="checkbox" id="nsvc_frdic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_frdic">프랑스어사전</label></li><li><input type="checkbox" id="nsvc_dedic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_dedic">독일어사전</label></li><li><input type="checkbox" id="nsvc_rudic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_rudic">러시아어사전</label></li><li><input type="checkbox" id="nsvc_vndic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_vndic">베트남어사전</label></li><li><input type="checkbox" id="nsvc_spdic" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_spdic">스페인어사전</label></li><li><input type="checkbox" id="nsvc_papago" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_papago">파파고</label></li></ul></div><div class="svc_spc"><strong>인기/신규서비스</strong><ul class=""><li><input type="checkbox" id="nsvc_grafolio" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_grafolio">그라폴리오</label></li><li><input type="checkbox" id="nsvc_post" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_post">포스트</label></li><li><input type="checkbox" id="nsvc_luncherapp" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_luncherapp">도돌런처</label></li><li><input type="checkbox" id="nsvc_band" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_band">밴드</label></li><li><input type="checkbox" id="nsvc_line" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_line">라인</label></li><li class="gnb_event"><input type="checkbox" id="nsvc_vibe" name="selmenu" class="gnb_input_check" value=""> <label for="nsvc_vibe">VIBE<em class="ic_gnb_new">New</em></label></li></ul></div></div></div><div class="svc_btnwrp"><div class="svc_btns"><button class="gnb_save" onclick="if(gnbFavorite.addService()){gnbMoreLayer.clickToggleWhole()} return false;"><strong class="blind">확인</strong></button><button class="gnb_close" onclick="gnbFavorite.cancel(); return false;"><span class="blind">취소</span></button><button class="gnb_return" onclick="gnbFavorite.resetService(); return false;" "=""><span class="blind">초기 설정으로 변경</span></button></div></div><div class="gnb_bg_btm"></div></div></div>
                <iframe id="gnb_service_lyr_iframe" title="빈 프레임" class="gnb_pad_lyr" name="padding" width="0" height="0" scrolling="no" frameborder="0" style="display:none;top:34px;right:297px;width:585px;height:385px;opacity:0;-ms-filter:alpha(opacity=0)"></iframe><iframe id="gnb_svc_more_iframe" title="빈 프레임" class="gnb_pad_lyr" name="padding" width="0" height="0" scrolling="no" frameborder="0" style="display:none;top:34px;right:-4px;width:295px;height:385px;opacity:0;-ms-filter:alpha(opacity=0)"></iframe></li></ul>
                </div>--%>
                <!--//GNB 템플릿 적용부 -->
                <%-- <div id="layer_login" style="display:none;">
                     <p><a href="#" onclick="toLoginPage()">로그인해주세요</a></p>
                 </div>

                 <iframe id="join-cafe-iframe" title="가입카페목록" width="280" frameborder="0" scrolling="no" style="overflow:hidden;display:none;"></iframe>--%>
            </div>
        </div>

        <!-- 카페 간판 -->
        <div id="front-img">
            <div id="front-cafe">
                <a href="/MyCafeIntro.nhn?clubid=29995789">
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
                                <a class="_rosRestrict" href="#" title="즐겨찾는 카페 등록"><img
                                        src="https://cafe.pstatic.net/cafe4/hidden.gif" width="27" height="28"
                                        alt="즐겨찾는 카페 등록" class="btn-bookmark-off" id="favoriteCafeInCafeInfo"></a>
                            </li>
                            <li class="tit-info-on">
                                <p class="gm-tcol-t">카페정보</p>
                            </li>
                            <li class="tit-action">
                                <p><a href="#" class="_rosRestrict">나의활동</a>
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
                                            <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_thumb_noimg_55.png"
                                                 width="58" height="58" alt="카페아이콘"
                                                 onerror="this.onerror=null;this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_thumb_noimg_55.png';">
                                            <span class="border mask_white"></span>
                                        </a>

                                    </li>
                                    <li class="gm-tcol-c">
                                        <em class="ico-manager">매니저</em>
                                        <a href="/yulimhall/member/ued_123/article" target="_blank"
                                           class="id mlink gm-tcol-c">
                                            <div class="ellipsis gm-tcol-c">
                                                <div class="ellipsis">${boardSimpleInfo.adminUserNicName}</div>
                                            </div>
                                        </a>
                                        <div class="thm"><a href="/CafeHistoryView.nhn?clubid=29995789"
                                                            class="gm-tcol-c" target="cafe_main">${cafe_createdate}</a></div>
                                        <div class="info-view"><a href="#" class="u gm-tcol-c">카페소개</a></div>
                                    </li>

                                </ul>
                            </div>

                            <div class="ia-info-data2">
                                <ul>
                                    <li class="level-info border-sub">
                                        <a href="#" class="gm-tcol-c">
                                            <strong class="d-none">카페등급</strong>
                                            <span class="ico_rank rank1"></span><em>씨앗1단계</em>
                                        </a>

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
                                            <em>${boardSimpleInfo.cafeMemberCnt}<span class="ico_lock2">비공개</span></em>
                                        </a>

                                        <div class="ly_info_dsc"
                                             style="font-weight:normal;top:14px;left:5px;display:none;"
                                             id="hiddenCafeApplyLayer" onmouseover="showCafeApplyLayer();"
                                             onmouseout="hideCafeApplyLayer();">
                                            <div class="cont cont_v1" style="width:60px">
                                                <p><a href="/ManageJoinApplication.nhn?search.clubid=29995789"
                                                      onblur="hideCafeApplyLayer();">가입대기 <span>0</span></a></p>
                                                <span class="tail" style="left:31px"></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="ia-info-data3" id="cafePopularityLog">
                                <ul class="gm-tcol-c">
                                    <li class="info">
                                        <span class="tit"><span class="ico_bkmk"></span><strong class="gm-tcol-c"><a
                                                href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955"
                                                class="gm-tcol-c" target="_blank">즐겨찾는 멤버</a></strong></span>
                                        <em><a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955"
                                               class="gm-tcol-c" target="_blank">0</a><span
                                                class="gm-tcol-c">명</span></em>
                                    </li>
                                    <li class="info2">
                                        <span class="tit"><span class="ico_bkmk2"></span><strong class="gm-tcol-c"><a
                                                href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955"
                                                class="gm-tcol-c" target="_blank">게시판 구독수</a></strong></span>
                                        <em><a href="https://section.cafe.naver.com/notice/read/1000003528/10000000000023814955"
                                               class="gm-tcol-c" target="_blank">0</a><span
                                                class="gm-tcol-c">회</span></em>
                                    </li>
                                    <li class="info3" id="cafePopularityLog_info3">
                                        <span class="tit"><span class="ico_mbl"></span><strong
                                                class="gm-tcol-c">우리카페앱 수</strong></span>
                                        <em>0<span class="gm-tcol-c">회</span></em>
                                        <!-- [D] 우리카페앱 수 안내 레이어 -->
                                        <div class="ly_info_dsc" style="top:-60px;right:-3px;display:none;"
                                             id="appCafeInstallCountDescLayer">
                                            <div class="cont cont_v3">
                                                <p>모바일에서 우리카페를<br> 바탕화면에 추가한 수 <br> <a
                                                        href="https://help.naver.com/support/alias/cafe/cafe21.naver"
                                                        class="more" target="_blank">자세히 보기</a></p>
                                                <span class="tail2"></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                        </div>

                        <!-- 카페 가입 버튼 -->
                        <div class="cafe-write-btn">
                            <a href="#" class="_rosRestrict" id="boardwrite">카페 글쓰기</a>
                        </div>

                        <!-- 카페 채팅 버튼 -->
                        <div class="ia-info-btn">
                            <ul class="ia-info-list">
                                <li><a href="#"
                                       class="link_chat _tabletRestrict(채팅)" target="_blank">카페 채팅</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="member-action-data" style="display:none">
                        <ul class="info-action-tab" role="tablist">
                            <li class="tit-bookmark">
                                <a class="_rosRestrict" href="#" title="즐겨찾는 카페 등록"><img
                                        src="https://cafe.pstatic.net/cafe4/hidden.gif" width="27" height="28"
                                        alt="즐겨찾는 카페 등록" class="btn-bookmark-off" id="favoriteCafeInMemberInfo"></a>
                            </li>
                            <li class="tit-info" role="presentation">
                                <p role="tab"><a href="#">카페정보</a>
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

                        <div class="cafe-write-btn">
                            <a href="#" class="_rosRestrict">카페 글쓰기</a>
                        </div>

                        <div class="ia-info-btn">
                            <ul class="ia-info-list">
                                <li><a href="#"
                                       class="link_chat _tabletRestrict(채팅)" target="_blank">카페 채팅</a></li>
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
                                <img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="10" height="11"
                                     class="ico-list"
                                     alt=""><a href="#"
                                                <%--onclick="return false;"--%>
                                               target="cafe_main"
                                               class="gm-tcol-c"
                                               id="menuLink0">전체글보기</a>
                                <span class="gm-tcol-c total">1</span>
                            </li>
                        </ul>
                        <div class="cafe-menu-space"></div>
                        <ul class="cafe-menu-list">
                            <li>
                                <img src="https://cafe.pstatic.net/cafe4/hidden.gif" width="10" height="11"
                                     class="ico-list"
                                     alt="">
                                <a href="/ArticleList.nhn?search.clubid=29995789&amp;search.menuid=1&amp;search.boardtype=L"
                                   target="cafe_main"
                                   class="gm-tcol-c" id="menuLink1">
                                    자유게시판
                                </a>
                                <img src="https://ssl.pstatic.net/static/cafe/cafe_pc/ico_new.png" width="12"
                                     height="12"
                                     class="ico_new" alt="새 게시글">
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
                                <li style="text-align:center"><span class="tcol-c">최근 댓글ㆍ답글이<br>없습니다.</span></li>
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
                    <iframe name="cafe_main" id="cafe_main" title="카페 메인"
                            src="/board/boardCenter/${boardSimpleInfo.cafeUid}" width="860"
                            height="100%"
                            frameborder="0" scrolling="no" marginwidth="0" marginheight="0" allowtransparency="true"
                            allowfullscreen="" style="height: 1598px;"></iframe>
                </div>
                <div id="smart_editor" style="visibility: hidden">
                    <jsp:include page="./commonBoardInsert.jsp" flush="true"/>
                </div>
            </div>
        </div>
        <!-- 본문 내용 -->
    </div>
<%--    <script type="text/javascript" src="/js/board/board.js"></script>--%>

    <div id="login_info">
        <input type="hidden" name="useruid" value="${userUid}" />
        <input type="hidden" name="nickname" value="${nickName}" />
    </div>

    <div id="cafe_info">
        <input type="hidden" name="cafeUid" value="${boardSimpleInfo.cafeUid}" />
        <input type="hidden" name="cafeUrl" value="${cafe_url}"/>
    </div>

</body>
</html>