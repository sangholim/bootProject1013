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
	var login_input_nodes = document.getElementsByClassName("login_input");
	var login_btn = document.getElementsByClassName("login_btn")[0];
	*/
	//id ui
	var check_id = document.getElementById( 'id' );
	//pw ui
	var check_pw = document.getElementById( 'pswd1' );
	//pw_check ui
	var check_pw_re = document.getElementById( 'pswd2' );
	// name UI ui
	var check_name = document.getElementById( 'name' );
	
	// 생년월일 UI
	var check_birth = document.getElementById( 'bir_wrap' );
	
	//id 이벤트 등록
	if(check_id !== undefined) {
		var idMsg = document.getElementById("idMsg");
		check_id.addEventListener ('mouseout', function (event) {
			
			// ID란에 입력하지 않으면  fail
			if(check_id.value.length == 0) {
				idMsg.innerHTML = "아이디를 입력하세요.";
				idMsg.style.display = "";
				idMsg.classList.remove( 'green' );
				return;
			} 
			
			// 유효하지않은 ID 입력시 fail
			if(!common.Regex (common.validId, check_id.value)) {
				// 회원가입시 유효성검사
				idMsg.innerHTML = "아이디 형식이 맞지 않습니다. (첫글자는 영문이고, 5~13자)";
				idMsg.style.display = "";
				idMsg.classList.remove( 'green' );
				return;
			} 
			
			
			var user = {};
			user.id = check_id.value;
			var json = JSON.stringify(user);
			//response 값을담는곳 node id
			common.sync("POST", "/login/checkExistUser.json", json, "application/json", idMsg);
			
		},false);
	}
	
	// 비밀번호 이벤트 등록
	if(check_pw !== undefined) {
		var pswdmsg = document.getElementById("pswdmsg");
		check_pw.addEventListener ('mouseout', function (event) {
			pswdmsg.style.display = "";
			pswdmsg.classList.remove( 'green' );
			//비밀번호 검사
			// 비밀번호란에 입력하지 않으면  fail
			if(check_pw.value.length == 0) {
				pswdmsg.innerHTML = "비밀번호를 입력하세요.";
				return;
			} 
			
			//비밀번호 유효성 검사
			if(!common.Regex (common.validPW, check_pw.value)) {
				pswdmsg.innerHTML = "비밀번호 조합이 부적절합니다.";
				return;
			} 
			pswdmsg.innerHTML = "사용 가능한 비밀번호 입니다.";
			pswdmsg.classList.add( 'green' );
		
		});
		
	}

	// 비밀번호 재확인 이벤트 등록
	if(check_pw_re !== undefined) {
		var pswd2msg = document.getElementById("pswd2Msg");
		check_pw_re.addEventListener ('mouseout', function (event) {
			pswd2msg.style.display = "";
			pswd2msg.classList.remove( 'green' );
			//비밀번호  재확인
			// 비밀번호  재확인란에 입력하지 않으면  fail
			if(check_pw_re.value.length == 0) {
				pswd2msg.innerHTML = "비밀번호를 입력하세요.";
				return;
			} 
			
			//비밀번호 == 비밀번호 재확인 값이 일치하는지 체크
			if(check_pw_re.value !== check_pw.value) {
				pswd2msg.innerHTML = "비밀번호가 일치하지 않습니다.";
				return;
			} 
			pswd2msg.innerHTML = "비밀번호가 일치합니다.";
			pswd2msg.classList.add( 'green' );
		
		});
		
	}

	// 이름 이벤트 등록
	if(check_name !== undefined) {
		var nameMsg = document.getElementById("nameMsg");
		check_name.addEventListener ('mouseout', function (event) {
			nameMsg.style.display = "";
			nameMsg.classList.remove( 'green' );
			//비밀번호  재확인
			// 비밀번호  재확인란에 입력하지 않으면  fail
			if(check_name.value.length == 0) {
				nameMsg.innerHTML = "비밀번호를 입력하세요.";
				return;
			} 
			
			//비밀번호 == 비밀번호 재확인 값이 일치하는지 체크
			if(!common.Regex (common.validName, check_name.value)) {
				nameMsg.innerHTML = "숫자가 아닌 문자로 입력하세요. (3 ~ 12)";
				return;
			} 
			nameMsg.innerHTML = "올바른 이름명입니다.";
			nameMsg.classList.add( 'green' );
		
		});
		
	}
	
	// 이름 이벤트 등록
	if(check_birth !== undefined) {
		var birthdayMsg = document.getElementById("birthdayMsg");
		check_birth.addEventListener ('mouseout', function (event) {
			birthdayMsg.style.display = "";
			birthdayMsg.classList.remove( 'green' );
			var inputDate;
			
			//value Tag에서 year 1970 인지 유효성 검사
			var year = (document.getElementById("yy").value.length == 0)? 'n' : document.getElementById("yy").value;
			var mon = (document.getElementById("mm").value.length == 0)? 'n' : document.getElementById("mm").value;
			var dd = (document.getElementById("dd").value.length == 0)? 'n' : document.getElementById("dd").value;
			
			if(mon < 10) {
				mon = "0" + mon;
			}
			
			if(dd < 10) {
				dd = "0" + dd;
			}
			
			if(isNaN(year) || isNaN(mon) || isNaN(dd)) {
				birthdayMsg.innerHTML = "유효하지 않은 값입니다.";
				return;
			}
			if(parseInt(year) < 1970) {
				birthdayMsg.innerHTML = "1970년 이상 입력해주새요.";
				return;
			}
			
			//현재 날짜 불러옴
			var date = new Date();
			var currentDate = date.getFullYear() + "" +(date.getMonth() + 1) + "" +date.getDate(); 
			
			if(parseInt(year+""+mon+""+dd) > parseInt(currentDate)) {
				birthdayMsg.innerHTML = "현재 날짜보다 클순 없습니다.";
				return;
			}
			
			birthdayMsg.innerHTML = "올바른 생년월일 입니다.";
			birthdayMsg.classList.add( 'green' );
		
		});
		
	}
	
})();


//아이디 체크후 이벤트 처리
/**
 * 동기 처리
 */
login.doLogin = function(login_input) {

}