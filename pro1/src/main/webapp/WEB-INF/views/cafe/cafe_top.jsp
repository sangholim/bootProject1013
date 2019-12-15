<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!--  카페 생성시 요소 구성 / 카페 관리 요소 구성 -->
<div class="cafe_top">
	<div class="snb_area">
		<div class="snb_inner">
			<h1>
				<a href="http://localhost:8080" class="logo_naver">NAVER</a>
				<a href="window.location.href" class="logo_cafe">카페</a>
			</h1>
			<form>
				<fieldset>
					<legend class="blind">검색</legend>
					<div class="snb_search_box">
						<div class="snb_search_bsub">
							<div class="search_option_box off">
								<div class="search_option">
									<a href="#">
										전체
										<span class="ic_down"></span>
										<span class="ic_up"></span>
										<span class="ic_end"></span>
									</a>
								</div>
							</div>
							<input type="text" title="검색" maxlength="255" class="snb_search_text">
							<a href="#" class="btn_arrow on">
								<span class="blind">자동완성펼치기</span>
								<span  class="ic_down"></span>
							</a>
						</div>
						<button type="submit" class="btn_search">
							<span class="blind">검색</span>
							<span class="ico_search"></span>
						</button>
						<a href="#" target="_blank" class="btn_search_all">통합검색</a>
					</div>
				</fieldset>
			</form>
			<div class="cafe_gnb_wrap">
				<div id="gnb" class="gnb_one">
					<strong class="blind">사용자 링크</strong>
					<ul class="gnb_lst" id="gnb_lst" style="display: block;"> 
						<li class="gnb_login_li" style="display: none;">
							<a class="gnb_btn_login">
								<span class="gnb_bg"></span>
								<span class="gnb_bdr"></span>
								<span class="gnb_txt">로그인</span>
							</a>
						</li>
						<li class="gnb_my_li" style="display: inline-block;">
							<div class="gnb_my_namebox" style="background-image: url('https://ssl.pstatic.net/static/common/gnb/2014/ico_arrow_wh.gif');">
								<a href="#" class="gnb_my">
									<img id="gnb_profile_img" src="https://ssl.pstatic.net/static/common/myarea/myInfo.gif" width="26" height="26" alt="내 프로필 이미지" style="display: inline-block;">
									<span id="gnb_profile_filter_mask" class="filter_mask" style="display: inline-block;"></span>
									<span class="gnb_name" id="gnb_name1">고대박</span>
									<em class="blind">내정보 보기</em>
									<span class="ico_arrow"></span>
								</a>
								<a href="#" class="gnb_emp" style="display: none;">(임직원 혜택)</a>
							</div>
						</li>
						<li class="gnb_notice_li" id="gnb_notice_layer" style="display: inline-block;">
							<a href="javascript:;" class="gnb_notice" onclick="javascript:void(0);">
								<span class="blind">알림</span>
								<span class="gnb_icon"></span>
								<em class="gnb_ico_num" id="gnb_me_menu" style="display:none">
									<span class="gnb_ico_new">
										<span class="gnb_count" id="gnb_me_count" style="display: inline-block;"></span>
									</span>
								</em>
								<span class="ico_arrow"></span>
							</a>
							<div class="gnb_notice_lyr" id="gnb_notice_lyr">
								<div class="svc_noti svc_panel">
									<div class="svc_scroll">
										<div class="svc_head">
											<strong class="gnb_tit">전체 알림</strong>
											<div class="task_right">
												<button onclick="gnbNaverMeLayer.deleteReadList(this, event);" id="gnb_btn_read_noti_del">읽은 알림 삭제</button>
												<button onclick="gnbNaverMeLayer.showDeleteAlert();" id="gnb_btn_all_noti_del">모두 삭제</button>
											</div>
										</div>
										<div class="svc_body" id="gnb_naverme_layer">
											<ul class="svc_list">
												<li class="gnb_unread" data-serviceid="nid" data-catid="999" data-messagetimekey="1200423039396618667">
													<a href="https://talk.naver.com/ct/wc4bsu?frm=ume&amp;fcs=13#nafullscreen" target="_blank" class="gnb_list_cover gnb_xlist" onclick="gnbNaverMeLayer.drawList(this, 'https://static.nid.naver.com/gnbMeNoti/gnb/noti/read/utf-8.nhn?serviceId=nid&amp;catId=999&amp;messageTimeKey=1200423039396618667', true);">
														<p class="gnb_subject">
															<strong>보안기능</strong> 
															새로운 환경에서 로그인 되었습니다.
														</p>
														<p class="gnb_info">
															<em class="svc_name">네이버회원</em>
															<span class="cchr">|</span>
															<span class="gnb_user_name">by 보안기능</span>&nbsp;
															<span class="date">11월 29일</span>
														</p>
													</a>
												</li>	
											</ul>
										</div>
										
									</div>
								</div>
							</div>
						</li>
						<li class="mail_li" id="gnb_mail_layer" style="display: inline-block;">
							<!--  시간남으면 작업 -->
						</li>
					</ul>
				
				</div>
			</div>
			
		</div>
	</div>
	<!-- top에 잇는 작은 메뉴 -->
	<div id="gnbmenu" class="menu">
		<div class="menu_inner">
			<ul class="lnb">
				<li class="on">
					<a href="#" class="lnb_link">카페홈</a> 
					<span class="blind">선택됨</span>
				</li>
				<li>
					<a href="#" class="lnb_link">주제별</a> 
				</li>
				<li>
					<a href="#" class="lnb_link">지역별</a> 
				</li>
				<li>
					<a href="#" class="lnb_link">랭킹</a> 
				</li>
				<li>
					<a href="#" class="lnb_link">대표카페</a> 
				</li>
				<li class="mynews __mynews_tab">
					<a href="#" class="lnb_link">
						<span class="txt">내소식</span>
					</a> 
					<div class="cc_layer_mynews __mynews_layer" style="display: none;">
						<div class="cc_mynews_header">
							<h2 class="title">내소식</h2>
						</div>
						<div id="myNewsLayer" class="cc_mynews_content">
						<!----> 
							<div class="cc_mynews_none">
								<strong class="title">내소식이 없습니다.</strong>
								<p class="txt">
									가입한 카페의 활동 알림과 댓글알림을<br>이곳에서 모아볼 수 있어요.
								</p>
							</div>
						</div>
					</div>
					<div class="cc_layer_alert" style="display: none;">
						<strong class="blind">내소식 안내 레이어팝업</strong>
						<div class="cc_alert_content">
							<p class="txt"></p>
						</div>
						<div class="cc_alert_footer">
							<button type="submit" class="cc_alert_btn">확인</button>
						</div>
					</div>
					<div class="cc_layer_dimmend" style="display: none;">
						<div class="layer_wrap">
							<div class="layer_header">
								<h1 class="title">내 소식 댓글알림 설정</h1>
							</div>
							<div class="layer_content">
								<div class="content_title">
									<strong class="name"></strong>
								</div>
								<div class="setting_check">
									<ul class="list">
										<li style="display:none;">
											<div class="radio_box type_green">
												<input type="radio" id="ALL" name="cmt_alarm" value="ALL" class="blind">
												<label for="ALL">
													<strong class="txt">모든 댓글알림 받기</strong>
													<p class="info">이 카페의 모든 댓글알림을 받습니다.</p>
												</label>	
											</div>
										</li>
										<li style="display:none;">
											<div class="radio_box type_green">
												<input type="radio" id="REL" name="cmt_alarm" value="REL" class="blind">
												<label for="REL">
													<strong class="txt">참여글의 알림 받기</strong>
													<p class="info">내 글, 내 댓글, 내가 댓글 쓴 글에 대한 댓글<br>알림을 받습니다.</p>
												</label>	
											</div>
										</li>
										<li style="display:none;">
											<div class="radio_box type_green">
												<input type="radio" id="MY" name="cmt_alarm" value="MY" class="blind">
												<label for="MY">
													<strong class="txt">내 글/댓글의 알림 받기</strong> 
													<p class="info">내 글, 내 댓글에 대한 댓글알림을 받습니다.</p>
												</label>	
											</div>
										</li>
									</ul>
								</div>
								<div class="btn_area"></div>
							</div>
						</div>
					</div>
				</li>
				<li class="mychatting">
					<a href="#" target="_blank" class="lnb_link">
					채팅<!---->
					</a>
				</li>
			</ul>
			<a href="#" class="menu_link">카페지원센터</a>
		</div>
	</div>
</div>
