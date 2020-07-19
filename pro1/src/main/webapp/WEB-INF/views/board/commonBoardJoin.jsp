<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<form name="frm" id="applyFrm" method="post" onsubmit="return false" action="/CafeApplyResult.nhn">
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
		<p class="m-tcol-c">${boardSimpleInfoForm.desc}</p>
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
				<td class="m-tcol-c ln15" style="width: 100%">
					<input id="cafeNickNameInput" type="text" name="nickname" class="input-txt border-sub vm" style="width:140px;height:20px;" value="${boardSimpleInfoForm.userNickName}" title="카페별명입력" aria-describedby="nickname">
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

	<div class="h-10"></div>
	<div class="ntce">
		<img src="https://cafe.pstatic.net/img/join/ic_join_noti.png" alt="회원가입" width="14" height="15">
		<span class="txt">질문 답변 시 회원님의 소중한 <span class="txt2">개인정보가 유출되지 않도록</span> 주의해주시기 바랍니다.</span>
	</div>

	<div class="h-35"></div>
	<%--<div class="border-sub group-tit" style="height:23px;">
		<h4 class="m-tcol-c" style="margin-left:4px !important;">네이버 카페는 프로그램을 이용한 <strong class="m-tcol-p">자동 가입방지</strong>를 위해서 보안절차를 거치고 있습니다.</h4>
	</div>--%>
	<input type="button" id="sign_up" value="회원가입"></form>

</form>

<div id="cafe_simple_info">
	<input type="hidden" id="cafe_level" value="${boardSimpleInfoForm.cafeLevel}"/>
	<input type="hidden" id="cafe_desc" value="${boardSimpleInfoForm.desc}"/>
	<input type="hidden" id="cafe_member_cnt" value="${boardSimpleInfoForm.cafeMemberCnt}"/>
	<input type="hidden" id="cafe_uid" value="${boardSimpleInfoForm.cafeUid}"/>
</div>


