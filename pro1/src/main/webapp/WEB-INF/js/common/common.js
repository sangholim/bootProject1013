/**
 * 렌더링 페이지 css 등록하기. var currentLocation = window.location; 0 : main page 1 :
 * login page
 */
var common = {};

// load page (이동할 페이지 , 현재 페이지 , pushState여부)

common.sync = function(method, url, data, contentType, nodeId) {

	var xhttp = new XMLHttpRequest();
	xhttp.open(method, url);
	xhttp.setRequestHeader("Content-Type", contentType);
	xhttp.onreadystatechange = function() {
		
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var json = JSON.parse(xhttp.responseText);
			//비동기 url checkExistUser.json 처리
			if (url.indexOf("checkExistUser.json") != -1) {
				nodeId.innerHTML=json.responseText;
				nodeId.style.display = "";
				/*
				 * Text Color
				 * 사용불가능 : red
				 * 사용 가능 : green
				 */
				if(json.valid) {
					nodeId.classList.add( 'green' );
				} else {
					nodeId.classList.remove( 'green' );
				}
			} else if (url.indexOf("authEmail.json") != -1) {
				nodeId.innerHTML=json.responseText;
				nodeId.style.display = "";
				/*
				 * Text Color
				 * 사용불가능 : red
				 * 사용 가능 : yellow
				 */
				if(json.valid) {
					sessionStorage.setItem("authCode",json.keyCode);
					sessionStorage.setItem("addrEmail",json.addrEmail);
					nodeId.classList.add( 'yellow' );
				} else {
					nodeId.classList.remove( 'yellow' );
				}
			} else if (url.indexOf("findAddr.json") != -1) {
				login.createAddrBody(json.post);
			}
		}
		//xhttp.abort();
	}

	xhttp.send(data);
}

/**
 * 폼태그 만들어서 전송하기. [url]
 */
common.createForm = function(url, dataNodes) {
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Post 방식
	form.setAttribute("action", url); // 요청 보낼 주소
	/*
	 * var hiddenField = document.createElement("input");
	 * hiddenField.setAttribute("type", "hidden");
	 * hiddenField.setAttribute("name", "mName");
	 * hiddenField.setAttribute("value", mName); form.appendChild(hiddenField);
	 * 
	 * hiddenField = document.createElement("input");
	 * hiddenField.setAttribute("type", "hidden");
	 * hiddenField.setAttribute("name", "mEmail");
	 * hiddenField.setAttribute("value", mEmail); form.appendChild(hiddenField);
	 */
	document.body.appendChild(form);
	form.submit();
}


/*
 * 이메일 유효성 검사 : rfc 의거해서 찾아보기
 */
common.validEmail = "[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}";

/*
 * 3자리-4자리-4자리
 */
common.validPhone = "^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$";


/*
 * 이름 유효성 검사 : 문자만 허용 
 */
common.validName = "[a-zA-Z0-9가-힣]{3,12}$";

/*
 * ID 유효성 검사 : 첫글자는 숫자는 예외 , 5~13 영문 , 숫자만 허용 
 */
common.validId = "^[a-zA-Z][a-zA-Z0-9]{4,12}$";

/*
 * 비밀번호 조합식 8자 이상, 소문자, 대문자, 특수문자, 숫자 모두 포함 
 */
common.validPW = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";

/*
 * Regex 확인 로직
 */
common.Regex = function (pattern , text) {
	return new RegExp(pattern).test(text);
};

common.addEvent = function (node) {
	
}
