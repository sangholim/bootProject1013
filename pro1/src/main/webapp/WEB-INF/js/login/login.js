/**
 * 
 */

var login = {};

/**
 * 로그인 페이지에서 필요한 이벤트 추가.
 * 
 * @returns
 */
(function() {
	/*
	 * var login_input_nodes = document.getElementsByClassName("login_input");
	 * var login_btn = document.getElementsByClassName("login_btn")[0];
	 */
	// id ui
	var check_id = document.getElementById('id');
	// pw ui
	var check_pw = document.getElementById('pswd1');
	// pw_check ui
	var check_pw_re = document.getElementById('pswd2');
	// name UI ui
	var check_name = document.getElementById('name');
	// 생년월일 UI
	var check_birth = document.getElementById('bir_wrap');
	// 성별 UI
	var check_gender = document.getElementById('gender');
	// 인증메일 UI
	var check_email = document.getElementById('authEmailSend');
	// SMS UI
	var check_sms = document.getElementById('btnSend');
	//우편 번호 , 주소 api 호출
	var check_addr = document.getElementById('findAddr');

	//form tag ui
	var register_ui = document.getElementById('join_form');
	
	if(register_ui !== undefined && register_ui !=null) {
		var register_btn = document.getElementById('btnJoin');
		register_btn.addEventListener('click', function(event) {
			//혹시 입력란 마다 유효성을 체크하지않은 리스트들 확인.
			//총 8개중에서 몇개 나오는지 확인
			var validSize = document.getElementsByClassName('green').length;
			if(validSize != 8) {
				alert("입력란에 기입하지 않거나, 형식에 맞지않습니다.");
				return;
			}
			
			
			var birthDay = document.createElement("input");
			birthDay.name = "birthday";
			birthDay.type = "hidden";
			birthDay.value = sessionStorage.getItem("birthDay");
			
			//생일 값을 formdata에 추가
			register_ui.appendChild(birthDay);
			//등록
			register_ui.submit();
			
		});
		
	}
	
	
	// id 이벤트 등록
	if (check_id !== undefined && check_id !=null) {
		var idMsg = document.getElementById("idMsg");
		check_id.addEventListener('focusout', function(event) {
			
			idMsg.classList.remove('blind');
			idMsg.classList.remove('green');
			// ID란에 입력하지 않으면 fail
			if (check_id.value.length == 0) {
				idMsg.innerHTML = "아이디를 입력하세요.";
				return;
			}

			// 유효하지않은 ID 입력시 fail
			if (!common.Regex(common.validId, check_id.value)) {
				// 회원가입시 유효성검사
				idMsg.innerHTML = "아이디 형식이 맞지 않습니다. (첫글자는 영문이고, 5~13자)";
				return;
			}

			var user = {};
			user.id = check_id.value;
			var json = JSON.stringify(user);
			// response 값을담는곳 node id
			common.sync("POST", "/login/checkExistUser.json", json,
					"application/json", idMsg);

		}, false);
	}

	// 비밀번호 이벤트 등록
	if (check_pw !== undefined && check_pw !=null) {
		var pswdmsg = document.getElementById("pswdmsg");
		check_pw.addEventListener('focusout', function(event) {
			pswdmsg.classList.remove('blind');
			pswdmsg.classList.remove('green');
			// 비밀번호 검사
			// 비밀번호란에 입력하지 않으면 fail
			if (check_pw.value.length == 0) {
				pswdmsg.innerHTML = "비밀번호를 입력하세요.";
				return;
			}

			// 비밀번호 유효성 검사
			if (!common.Regex(common.validPW, check_pw.value)) {
				pswdmsg.innerHTML = "비밀번호 조합이 부적절합니다.";
				return;
			}
			pswdmsg.innerHTML = "사용 가능한 비밀번호 입니다.";
			pswdmsg.classList.add('green');

		});

	}

	// 비밀번호 재확인 이벤트 등록
	if (check_pw_re !== undefined && check_pw_re !=null) {
		var pswd2msg = document.getElementById("pswd2Msg");
		check_pw_re.addEventListener('focusout', function(event) {
			pswd2msg.classList.remove('blind');
			pswd2msg.classList.remove('green');
			// 비밀번호 재확인
			// 비밀번호 재확인란에 입력하지 않으면 fail
			if (check_pw_re.value.length == 0) {
				pswd2msg.innerHTML = "비밀번호를 입력하세요.";
				return;
			}

			// 비밀번호 == 비밀번호 재확인 값이 일치하는지 체크
			if (check_pw_re.value !== check_pw.value) {
				pswd2msg.innerHTML = "비밀번호가 일치하지 않습니다.";
				return;
			}
			pswd2msg.innerHTML = "비밀번호가 일치합니다.";
			pswd2msg.classList.add('green');

		});

	}

	// 이름 이벤트 등록
	if (check_name !== undefined && check_name !=null) {
		var nameMsg = document.getElementById("nameMsg");
		check_name.addEventListener('focusout', function(event) {
			nameMsg.classList.remove('blind');
			nameMsg.classList.remove('green');
			// 비밀번호 재확인
			// 비밀번호 재확인란에 입력하지 않으면 fail
			if (check_name.value.length == 0) {
				nameMsg.innerHTML = "이름을 입력하세요.";
				return;
			}

			// 비밀번호 == 비밀번호 재확인 값이 일치하는지 체크
			if (!common.Regex(common.validName, check_name.value)) {
				nameMsg.innerHTML = "숫자가 아닌 문자로 입력하세요. (3 ~ 12)";
				return;
			}
			nameMsg.innerHTML = "올바른 이름명입니다.";
			nameMsg.classList.add('green');

		});

	}

	// 우편찾기 버튼  이벤트 등록 , 우편번호 데이터는 비동기식으로 호출한다.
	// 클릭시 상세 주소 아래에 데이터를 호출
	if (check_addr !== undefined && check_addr !=null) {
		var addrResult_container = document.getElementById("addrResult_container");
		// 주소 찾기 데이터
		var addrData = document.getElementById("addrData");
		check_addr.addEventListener('click',function(event) {
			addrResult_container.classList.remove('blind');
			var addrForm = {};
			addrForm.addrData = addrData.value;
			var json = JSON.stringify(addrForm);
			// response 값을담는곳 node id
			
			common.sync("POST", "/login/findAddr.json", json,
					"application/json", emailMsg);
		
		});
	}

	
	// 성별 이벤트 등록
	if (check_gender !== undefined && check_gender !=null) {
		var genderMsg = document.getElementById("genderMsg");
		check_gender.addEventListener('change',function(event) {
			genderMsg.classList.remove('blind');
			genderMsg.classList.remove('green');
			var val = check_gender.options[check_gender.selectedIndex].value;
			if (check_gender.options[check_gender.selectedIndex].value.length != 0) {
				genderMsg.classList.add('green');
			}

		});
	}

	// 생일 이벤트 등록
	if (check_birth !== undefined && check_birth !=null) {
		var birthdayMsg = document.getElementById("birthdayMsg");
		check_birth.addEventListener('focusout', function(event) {
			birthdayMsg.classList.remove('blind');
			birthdayMsg.classList.remove('green');
			var inputDate;
			
			// value Tag에서 year 1970 인지 유효성 검사
			var year = (document.getElementById("yy").value.length == 0) ? 'n'
					: document.getElementById("yy").value;
			var mon = (document.getElementById("mm").value.length == 0) ? 'n'
					: document.getElementById("mm").value;
			var dd = (document.getElementById("dd").value.length == 0) ? 'n'
					: document.getElementById("dd").value;

			if (mon < 10) {
				mon = "0" + mon;
			}
			if (dd < 10) {
				dd = "0" + dd;
			}
			if (isNaN(year) || isNaN(mon) || isNaN(dd)) {
				birthdayMsg.innerHTML = "유효하지 않은 값입니다.";
				return;
			}
			if (parseInt(year) < 1970) {
				birthdayMsg.innerHTML = "1970년 이상 입력해주새요.";
				return;
			}
								
			// 현재 날짜 불러옴
			var date = new Date();
			var nowMon = date.getMonth() + 1;
			var nowDay = date.getDate();

											
			var currentDate = date.getFullYear()
									+ ((nowMon > 10) ? "" + nowMon : "0" + nowMon) 
									+ ((nowDay > 10) ? "" + nowDay : "0" + nowDay);

			if (parseInt(year + "" + mon + "" + dd) > parseInt(currentDate)) {
				birthdayMsg.innerHTML = "현재 날짜보다 클순 없습니다.";
				return;
			}

			birthdayMsg.innerHTML = "올바른 생년월일 입니다.";
			birthdayMsg.classList.add('green');
			//session에 저장
			sessionStorage.setItem("birthDay", year + "" + mon + "" + dd);
						
		});

	}

	// 인증 확인 메일
	if (check_email !== undefined && check_email !=null) {
		// 인증 메일 입력란
		var emailUI = document.getElementById("addrEmail");
		var emailMsg = document.getElementById("emailMsg");
		var authCode;
		check_email.addEventListener('click', function(event) {
			emailMsg.classList.remove('blind');
			emailMsg.classList.remove('green');
			authCode = sessionStorage.getItem("authCode");
			
			// 인증코드 유효성 검사 (반드시 인증코드 전송체크 확인)
			if (emailMsg.classList.contains('yellow')) {
				emailMsg.classList.remove('yellow');
				if (authCode == emailUI.value) {
					emailMsg.innerHTML = "인증이 완료 되었습니다.";
					emailUI.value = sessionStorage.getItem("addrEmail");	
					emailMsg.classList.add('green');
				} else {
					sessionStorage.removeItem("addrEmail");
					sessionStorage.removeItem("authCode");
					emailMsg.innerHTML = "다시 이메일 인증을 해주세요.";
				}
				return;

			}

			// ID란에 입력하지 않으면 fail
			if (emailUI.value.length == 0) {
				emailMsg.innerHTML = "이메일 주소를 입력하세요";
				return;
			}

			// email 주소 유효성 검사
			if (!common.Regex(common.validEmail, emailUI.value)) {
				// 회원가입시 유효성검사
				emailMsg.innerHTML = "이메일 형식이 맞지 않습니다.";
				return;
			}

			var user = {};
			user.addrEmail = emailUI.value;
			var json = JSON.stringify(user);
			// response 값을담는곳 node id
			common.sync("POST", "/login/authEmail.json", json,
					"application/json", emailMsg);

		}, false);
	}
	
	// 전화 이벤트 등록
	if (check_sms !== undefined && check_sms !=null) {
		var phoneNoMsg = document.getElementById("phoneNoMsg");
		check_sms.addEventListener('click',function(event) {
			phoneNoMsg.classList.remove('blind');
			phoneNoMsg.classList.remove('green');
			var phoneVal = document.getElementById("phoneNo").value;
			
			if (phoneVal == "") {
				phoneNoMsg.innerHTML = "전화번호를 입력해 주세요.";
				return;
			}
			
			if (!common.Regex(common.validPhone, phoneVal)) {
				phoneNoMsg.innerHTML = "전화번호 형식이 맞지 안습니다.";
				return;
			}
			
			phoneNoMsg.innerHTML = "올바른 전화번호입니다.";
			phoneNoMsg.classList.add('green');
			

		});
	}

})();
//회원 가입시 입력란에 정상적으로 처리햇는지 확인 (8)
// 아이디 체크후 이벤트 처리
/**
 * 동기 처리
 */
login.doLogin = function(login_input) {

}

/**
 * post Api로 나온 결과를 가지고 Node 생성
 */
login.createAddrBody = function (postData) {
	 var tbody = document.getElementById("addrDatas"); //addr Table tbody 부분호출
	 var itemlist = postData.itemlist;
	 var addrlistLengh = itemlist.length;
	 var pageinfo = postData.pageinfo;
	
	// 주소 검색 결과 데이터 생성
		
	for (var i=0; i < addrlistLengh; i++) {
		var item = itemlist[i];
		var row = tbody.insertRow(0);
		row.insertCell(0).innerHTML = item.postcd;
		row.insertCell(1).innerHTML = item.address;
		//tbody.appendChild(row);
	}

}



