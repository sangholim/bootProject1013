<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="ko"><head>
	<title>카페</title>
	<meta name="mainTitle" content="카페 가입하기">

	<link rel="stylesheet" href="/css/board/board.css" type="text/css">

	<style>
		.skin-1080 #sub-tit .title_area .sub-tit-color {
			display: inline-block;
			font-size: 32px;
			font-weight: normal;
			vertical-align: top;
			line-height: 30px;
		}
		body, div {
			position: relative;
			-webkit-text-size-adjust: none;
			font-weight: 400;
			font-family: "Apple SD Gothic Neo", Helvetica, "³ª´®°íµñ", NanumGothic, NanumGothicWebFont, "¸¼Àº °íµñ", MalgunGothic, "µ¸¿ò", dotum, sans-serif;
		}
		#sub-tit h3 {
			padding-bottom: 4px;
			margin: 0 10px 0 0;
		}
		#content-area .group-tit h4 {
			padding-top: 0;
			background-image: url(https://cafe.pstatic.net/style/s02_05/ico-widget-tit.gif);
			background-repeat: no-repeat;
			background-position: left top;
		}
	</style>
</head>
<body marginwidth="0" marginheight="0">

<form name="frm" id="applyFrm" method="post" onsubmit="return false" action="/CafeApplyResult.nhn">
	<input type="hidden" name="webworkCookieTokenName" value="cafeCookieToken">
	<input type="hidden" name="cafeCookieToken" value="5KCBru-K8k_zvL2ylC_KfD3f9oir8fyVVgps6uqAfnEwH8C4uIj3BPRKEytqp5oh9FeYo0nQaaEqJ-l2vkq7DzjZhT0DQTmo">
	<input type="hidden" name="clubid" value="27711691" id="clubid">
	<input type="hidden" name="branchCode" value="j83ld9mQeZA0PbnrHErCzA6G3YwLwHgEmtyeD5N+lXeZGE7N8c7PFflHCjLN0BwiaBl5WsQysnl9SkCPcD38FA==">
	<input type="hidden" name="cluburl" value="sjmsbaby">
	<input type="hidden" name="email" value="">
	<input type="hidden" name="memberid" value="ued_123" id="memberid">
	<input type="hidden" name="csKey" value="xhStgCGz1skyeWvp">
	<input type="hidden" name="redirectwrite" value="">
	<input type="hidden" name="applyQuestionSetno" value="12">
	<input type="hidden" name="boardFeedId" value="">
	<input type="hidden" id="soundCaptchaKey" name="soundCaptchaKey" value="hQp9KWAZaQ1S1DEh">
	<input type="hidden" id="captchaType" name="captchaType" value="image">
	<input type="hidden" id="realNameConfig" name="realNameConfig" value="N">
	<input type="hidden" id="sexAndAgeConfig" name="SexAndAgeConfig" value="true">
	<div id="sub-tit">
		<div class="title_area">
			<h3 class="sub-tit-color">카페 가입하기</h3>
			<p class="m-tcol-c" style="margin-left: 0;">카페 가입을 위한 정보를 입력해주세요.</p>
		</div>
	</div>

	<div class="border-sub group-tit" style="height:23px;margin-top:20px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">카페설명</h4>
	</div>
	<div class="bg-color join_desc">
		<p class="m-tcol-c">${BoardSimpleInfoForm.desc}</p>
	</div>
	<div class="h-35"></div>

	<div class="border-sub group-tit" style="height:23px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">별명</h4>
	</div>
	<div class="bg-color">
		<span class="blind">카페별 별명 설정하기</span>
		<table width="735" cellspacing="0" cellpadding="0" border="0" align="center" role="presentation" class="join_list_table">
			<tbody>
			<tr><td height="15"></td></tr>
			<tr><td colspan="2" height="5"></td></tr>
			<tr valign="top">
				<td class="m-tcol-c ln15"><span class="join_menu_tit">카페별 별명 설정</span></td>
				<td class="m-tcol-c ln15" style="width: 100%"><input id="cafeNickNameInput" type="text" name="nickname" class="input-txt border-sub vm" style="width:140px;height:20px;" value="${BoardSimpleInfoForm.userNickName}" title="카페별명입력" aria-describedby="nickname">
					<a id="cafeCheckNicknameButton" href="#" onclick="return false;" role="button"><img src="https://cafe.pstatic.net/img/nickname/btn_chck_overlap.gif" width="57" height="23" style="vertical-align:middle;margin: 0 3px 0 2px" alt="중복확인"></a>
					<span id="showLengthArea" class="p11 m-tcol-c ls0 filter-50">4/20bytes</span>
					<span class="m-tcol-c filter-50" style="margin:0 0 0 10px;">※ <span class="p11" id="nickname">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다. (혼용가능)&nbsp;</span></span>
					<p id="nickName_alert" class="p11 m-tcol-p" style="margin:5px 0 0 0">&nbsp;</p>
				</td>
			</tr>
			<tr colspan="2" height="15">
				<td><span class="p11" style="color:#F00; margin:0 0 0 17px;"></span>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="h-35"></div>
	<div class="border-sub group-tit" style="height:23px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">공개설정</h4>
	</div>
	<div class="bg-color">
		<span class="blind">카페별 별명 설정하기</span>
		<table width="735" cellspacing="0" cellpadding="0" border="0" align="center" role="presentation" class="join_list_table">
			<tbody>
			<tr><td height="6"></td></tr>
			<tr valign="top">
				<td class="m-tcol-c">
					<ul class="join_privacy_set">
						<li>
							<span class="join_menu_tit">카페 운영진에게 성별∙연령대 공개</span>
							<div class="switch_btn mini">
								<a href="#" id="sexAndAgeBtn" class="bg_track _click(CafeApplyView|ToggleShowSexAndAge) _stopDefault" role="button" aria-pressed="true"><span class="ico_switch"></span></a>
							</div>
						</li>
					</ul>
				</td>
			</tr>
			<tr colspan="2" height="6"><td></td></tr>
			</tbody>
		</table>
	</div>

	<div class="h-35"></div>
	<div class="border-sub group-tit" style="height:23px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">아래는 카페의 원활한 운영을 위한 필요한 질문입니다. 정성껏 작성해 주세요.</h4>
	</div>
	<div class="bg-color">
		<span class="blind">질문작성하기</span>
		<table width="735" cellspacing="0" cellpadding="0" border="0" align="center" id="applyQuestionBox" role="presentation">
			<colgroup><col width="50">
				<col width="685">
			</colgroup><tbody><tr>
			<td colspan="2" height="15"></td>
		</tr>

		<tr valign="top">
			<td class="m-tcol-c ln15"><strong class="ls1">질문 1</strong>&nbsp;&nbsp;:</td>
			<td class="m-tcol-c ln15">게시물 1개+댓글 2개 남기시면 일반멤버로 자동 등업 됩니다</td>
		</tr>

		<tr><td colspan="2" height="5"></td></tr>
		<tr>
			<td></td>
			<td align="center">
				<textarea name="applyAnswer" id="applyAnswer1" cols="60" rows="2" class="history-write m-tcol-c _keyup(CafeApplyView|CheckAnswerLength) _param(1|S) _applyAnswer" style="width:683px !important;height:32px !important;overflow:auto;" title="답변입력"></textarea>
			</td>
		</tr>
		<tr><td colspan="2" height="15"></td></tr>

		</tbody></table>
	</div>
	<div class="h-10"></div>
	<div class="ntce">
		<img src="https://cafe.pstatic.net/img/join/ic_join_noti.png" alt="회원가입" width="14" height="15">
		<span class="txt">질문 답변 시 회원님의 소중한 <span class="txt2">개인정보가 유출되지 않도록</span> 주의해주시기 바랍니다.</span>
	</div>

	<div class="h-35"></div>
	<div class="border-sub group-tit" style="height:23px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">네이버 카페는 프로그램을 이용한 <strong class="m-tcol-p">자동 가입방지</strong>를 위해서 보안절차를 거치고 있습니다.</h4>
	</div>
	<div class="bg-color" id="captchaImgArea">
		<span class="blind">자동 가입방지 위한 보안 절차</span>
		<table width="735" cellspacing="0" cellpadding="0" border="0" align="center" role="presentation">
			<colgroup><col width="215"><col width="520">
			</colgroup><tbody><tr><td colspan="2" height="15"></td></tr>
		<tr valign="top">
			<td>
				<img src="https://captcha.nid.naver.com/nhncaptchav4.gif?key=xhStgCGz1skyeWvp" id="captchaImg" name="captchaImg" width="200" height="125" alt="캡차이미지">
			</td>
			<td class="capcha_desc">
				<p>네이버 카페는 프로그램을 이용한 <br>자동개설을 방지하기 위해 보안절차를 거치고 있습니다. <br>왼쪽 이미지를 보이는 대로 입력해주세요.</p>
				<input type="text" name="csValue" title="그림문자 입력" maxlength="18" style="width:187px" class="input_txt2" value="">
				<a href="#" onclick="recaptcha();return false;">새로고침</a>
				<span class="line">|</span>
				<a href="#" onclick="changeCaptchaMode(); return false;">음성으로 듣기</a>
			</td>
		</tr>
		<tr><td colspan="2" height="15"></td></tr>
		</tbody></table>
	</div>
	<div class="bg-color" id="captchaSoundArea" style="display:none">
		<span class="blind">자동 가입방지 위한 보안 절차</span>
		<table width="735" cellspacing="0" cellpadding="0" border="0" align="center" role="presentation">
			<colgroup><col width="215"><col width="520">
			</colgroup><tbody><tr><td colspan="2" height="15"></td></tr>
		<tr valign="top">
			<td>
				<img src="https://cafe.pstatic.net/cafe4/section/create/@captcha2.gif" width="200" height="125" alt="음성캡차이미지">
			</td>
			<td class="capcha_desc">
				<p>네이버 카페는 프로그램을 이용한 <br>자동개설을 방지하기 위해 보안절차를 거치고 있습니다.<br>스피커를 통해 들리는 대로 입력해주세요.</p>
				<input type="text" name="soundCaptchaValue" title="음성문자 입력" maxlength="18" style="width:187px" class="input_txt2">
				<a href="#" onclick="playSoundCaptcha(); return false;" id="play_audio">새로고침</a>
				<span class="line">|</span>
				<a href="#" onclick="changeCaptchaMode(); return false;">이미지로 보기</a>
			</td>
		</tr>
		<tr><td colspan="2" height="15"></td></tr>
		</tbody></table>
	</div>
	<div class="bg-color join_txt m-tcol-c">
		<ul>
			<li><span class="j_bul">·</span><span class="j_tx">가입 신청이 수락되면 <strong>'내소식'</strong>에서 알려드립니다.</span></li>
			<li><span class="j_bul">·</span><span class="j_tx">가입 신청 후 <strong>3개월</strong> 이상 수락되지 않으면 자동 신청 해제 됩니다.</span></li>
			<li><span class="j_bul">·</span><span class="j_tx">이 카페에서 활동하는 동안 아이디, 별명, 활동내역이 이 카페의 운영진에게 공개되며, 최소한의 제재 기록은 카페 탈퇴 후에도 보관됩니다.</span></li>
		</ul>
	</div>

	<center>
		<div style="width: 150px">
			<a class="btn _click(CafeApplyView|SubmitForm) _stopDefault" id="commitImg" href="#"><span></span><p><strong class="m-tcol-c txt_join">동의 후 가입하기</strong></p></a>
		</div>
	</center>
</form>
</body>
</html>