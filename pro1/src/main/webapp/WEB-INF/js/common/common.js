/**
 * 렌더링 페이지 css 등록하기. var currentLocation = window.location; 0 : main page 1 :
 * login page
 */
var common = {};
// load page (이동할 페이지 , 현재 페이지 , pushState여부)
//common.sync = function(method, url, data, nodeId) {
common.sync = function(requestParams) {
	var loadNode = document.getElementById("loadNode");
	if (loadNode != null) {
		loadNode.classList.remove('blind');
	}
	var nodeId = requestParams.nodeId;
	var url = requestParams.url;
	var xhttp = new XMLHttpRequest();
	xhttp.open(requestParams.method, requestParams.url);
	xhttp.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	xhttp.requestData = requestParams;
	xhttp.onreadystatechange = function() {

		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var json = JSON.parse(xhttp.responseText);
			//비동기 url checkExistUser.json 처리
			if (url.indexOf("checkExistUser.json") != -1) {
				nodeId.innerHTML = json.responseText;
				nodeId.style.display = "";
				/*
				 * Text Color
				 * 사용불가능 : red
				 * 사용 가능 : green
				 */
				if (json.valid) {
					nodeId.classList.add('green');
				} else {
					nodeId.classList.remove('green');
				}
			} else if (url.indexOf("authEmail.json") != -1) {
				nodeId.innerHTML = json.responseText;
				nodeId.style.display = "";
				/*
				 * Text Color
				 * 사용불가능 : red
				 * 사용 가능 : yellow
				 */
				if (json.valid) {
					sessionStorage.setItem("authCode", json.keyCode);
					sessionStorage.setItem("addrEmail", json.addrEmail);
					nodeId.classList.add('yellow');
				} else {
					nodeId.classList.remove('yellow');
				}
			} else if (url.indexOf("findAddr.json") != -1) {
				//document.location.hash = json.popState;
				login.createAddrBody(json);
			} else if (url.indexOf("/cafe/add.json") != -1) {
				var responseCode = json.code;
				alert(json.result);
				if (responseCode == 200) {
					window.location.href = "/cafe/sub_main";
				}
			} else if (url.indexOf("/board/insert_post.json") != -1){

				var responseCode = json.code;
				alert(json.result);
				if(responseCode == 200) {
					window.location.href = json.cafeUrl;
				}
			} else if (url.indexOf("/sub_main/list.json") > -1
				|| url.indexOf("/sub_theme/list.json") > -1
				|| url.indexOf("/sub_area/list.json") > -1) {
				var requestParamData = JSON.parse(xhttp.requestData.data);
				var responseCode = json.code;
				// 카페 탭 선택후 후처리
				cafe.afterCafeProcess(json.cafeForm, requestParamData);

			} else if (url.indexOf("/board/MemberJoin.json") != -1){

				var responseCode = json.code;
				alert(json.result);
				if(responseCode == 200) {
					location.reload();
				}
			} else if (url.indexOf("/d/update_post.json") != -1){

				var responseCode = json.code;
				alert(json.result);
				if(responseCode == 200) {
					//window.location.href = "/board/";
					window.location.href = "/board/boardCenter/p/"+json.boardUid;
				}
			} else if (url.indexOf("/manage/list.json") != -1){
				cafeManage.getCafeManageList(json.cafeManageForm);
			} else if (url.indexOf("/manage/modCafeUserRole.json") != -1){
				window.location.href="./";
			} else if (url.indexOf("/manage/cafeSecedeBoardList.json") != -1){
				// test
				cafeManage.getCafeSecedeBoardList(json.cafeManageForm);
			}
			
			// cafeSecedeBoardList
		}
		
		if (loadNode === undefined || loadNode ==null) {
			return;
		}
		
		loadNode.classList.add('blind');
		//xhttp.abort();
	}

	xhttp.send(requestParams.data);
}

window.onhashchange = function() {

	if (location.hash.length < 1) {
		return;
	}
	// #type=[data]
	// form [0] = type , form[1] json data
	var popState = location.hash.split(":");
	// 주소 게시판 비동기 호출시 페이지 처리
	if (popState[0] == "#addrBoard") {
		var decryptedMessage = CryptoJS.AES.decrypt(popState[1], "test")
			.toString(CryptoJS.enc.Utf8);
		var requestParams = common.requestParams(false, "POST",
			"/login/findAddr.json", decryptedMessage, "application/json");
		common.sync(requestParams);

	} else if (popState[0] == "#cafeBoard") {
		var decryptedMessage = CryptoJS.AES.decrypt(popState[2], "test")
			.toString(CryptoJS.enc.Utf8);
		var requestParams = common.requestParams(false, "POST",
			"/cafe"+popState[1]+"/list.json", decryptedMessage, "application/json");
		common.sync(requestParams);
	}
}

/**
 * 폼태그 만들어서 전송하기. [url]
 */
common.createForm = function(url, dataNodes) {
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Post 방식
	form.setAttribute("action", url); // 요청 보낼 주소

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
 * 숫자 유효성 검사
 */
common.validNum = "^\\d+$";

common.requestParams = function(useForm) {
	return common.requestParams(useForm, null, null, null, null);
}

common.requestParams = function(useForm, method, url, data, nodeId) {
	return {
		"useForm" : useForm,
		"method" : method,
		"url" : url,
		"data" : data,
		"nodeId" : nodeId
	};
}

/*
 * Regex 확인 로직
 */
common.Regex = function(pattern, text) {
	return new RegExp(pattern).test(text);
};

common.createPageNode = function(pageCell, value, classList, id) {
	var span = document.createElement("span");
	span.id = id;
	for (i = 0; i < classList.length; i++) {
		span.classList.add(classList[i]);
	}

	span.innerHTML = value;
	pageCell.appendChild(span);
}

common.calUtf8Bytes = function(ch) {
	//char > hex to decimail
	//var dec = 	ch.charCodeAt(0).toString(16);
	var dec = 	ch.charCodeAt(0);

	//16진수 : '00007F' > 10진수: 127
	//16진수 : '0007FF' > 10진수: 2047
	//16진수 : '00FFFF' > 10진수: 65535

	if (dec <= 127) {
		return 1;
	} else if (dec <=2047) {
		return 2;
	} else if (dec <= 65535) {
		return 3;
	} else {
		return 4;
	}

}

common.latestExpr = function (currentTime,beforeTime) {
	var timeInterval = currentTime - beforeTime;
	
	// time Interval 간격 규칙
	// 1000 -> 1초
	// 60*1000 -> 1분
	// 60*60*1000 -> 1시
	// 24*60*60*1000 -> 하루
	
	if (timeInterval < 1000) {
		// 1초 미만일때
		return "금방";
	} else if (timeInterval < 60*1000) {
		// 1분미만일떄
		return parseInt(timeInterval/1000) + "초 전";
	} else if (timeInterval < 60*60*1000) {
		// 1시미만일떄
		return parseInt(timeInterval/(60*1000)) + "분 전";
	} else if (timeInterval < 24*60*60*1000) {
		// 하루 미만일때
		return parseInt(timeInterval/(60*60*1000)) + "시간 전";
	} else {
		//하루가 넘을때
		var format = new Date(beforeTime);
		var year = format.getFullYear();
	    var month = (format.getMonth() < 10)? '0' + (format.getMonth() + 1) : format.getMonth() + 1;
	    var date = (format.getDate() < 10)? '0' + format.getDate() : format.getDate();
	    /*
	    var hour = (format.getHours() < 10)? '0' + format.getHours() : format.getHours();
	    var min = (format.getMinutes() < 10)? '0' + format.getMinutes() : format.getMinutes();
	    var sec = (format.getSeconds() < 10)? '0' + format.getSeconds() : format.getSeconds();
		*/
		return year + '/' + month + '/' + date + ' ';
	}
	
	
}