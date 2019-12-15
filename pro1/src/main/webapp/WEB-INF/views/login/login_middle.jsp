<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="login_middle">
	<div class="login_content">
		<div class="login_title">
			<p></p>
		</div>
		<!-- 아이디 / 비밀번호 / 로그인 / 로그인 상태 유지 / IP 보안 / 일회용 로그인 -->
		<form action="login/doLogin" method="POST" autocomplete="off" target="_top">
			<!--  TODO : input hidden 나중에 비밀 데이터 추가할때 -->
			<fieldset class="login_form">
				<legend class="blind">로그인</legend>
				<div>
					<div class="input_row">
						<span class="input_box">
							<label for="id" class="label_lg_pw">아이디</label>
							<input id="id" name="id" type="text" class="login_input" placeholder="아이디">
						</span>
					</div>
				</div>
				<div>
					<div class="input_row">
						<span class="input_box">
							<label for="pw" class="label_lg_pw">비밀번호</label>
							<input id="pw" name="pw" type="password" class="login_input" placeholder="비밀번호">
						</span>
					</div>
				</div>
				<input type="submit" class="login_btn" value="로그인" alt="로그인">
				<div class="login_option">
					<!--  로그인 상태 유지 -->
					<div>
						<span class="login_maintain_checkbox">
							<input type="checkbox" id="login_chk" value="off">
							<label for="login_chk" class="sp">로그인 상태 유지</label>
						</span>
					</div>
					<!--  로그인 부가기능 -->
					<div class="login_option_right_wrap">
						<span class="login_ip_check">
							<a>IP보안</a>
						</span>
						<span class="login_ip_opt">
							<input id="ip_on" type="checkbox" value="off">
							<label for="ip_on" class="sp on">
								<span class="blind">on</span>
							</label>
						</span>
						<span class="login_option_right bar">|</span>
						<!-- 일회용 로그인 -->
						<div class="login_once_wrap">
							<a>일회용 로그인</a>
							<a class="help_cover">
								<span class="sp btn_help"></span>
								<span class="blind">도움말</span>
							</a>
						</div>
					</div>
				</div>
			</fieldset>
		</form>
		<!-- 아이디 찾기 , 비밀번호 찾기 , 회원 가입 -->
		<div>
			<div class="find_join_wrap">
				<a target="_blank">아이디 찾기</a>
				<span class="bar">|</span>
				<a target="_blank">비밀번호 찾기</a>
				<span class="bar">|</span>
				<a target="_blank">회원 가입</a>
			</div>
		</div>
		<!--  사인 배너 -->
		<a target="blank" class="sign_banner">
			<span class="bill_img_pc"></span>
			<span class="blind">
				<strong>네이버 고지서</strong>
				지방세! 터치 한번으로 확인하고 납부하세요.
			</span>
		</a>
	</div>
</div>