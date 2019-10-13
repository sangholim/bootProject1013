/**
 * 렌더링 페이지 css 등록하기. var currentLocation = window.location; 0 : main page 1 :
 * login page
 */
var common = {};

// load page (이동할 페이지 , 현재 페이지 , pushState여부)

common.sync = function(method, url, data, contentType) {

	var xhttp = new XMLHttpRequest();
	var result;
	xhttp.open(method, url, false);
	xhttp.setRequestHeader("Content-Type", contentType);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			result = JSON.parse(xhttp.responseText);
		} else {
			result = "not found response data";
		}
	}

	xhttp.send(data);
	xhttp.abort();
	return result;
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
