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
	var login_input_nodes = document.getElementsByClassName("login_input");
	var login_btn = document.getElementsByClassName("login_btn")[0];
	
})();

/**
 * 동기 처리
 */
login.doLogin = function(login_input) {
	var user = {};
	user.id = login_input[0].value;
	user.pw = login_input[1].value;
	var json = JSON.stringify(user);
	common.sync("POST", "login/isChekcUser.json", json, "application/json");
}