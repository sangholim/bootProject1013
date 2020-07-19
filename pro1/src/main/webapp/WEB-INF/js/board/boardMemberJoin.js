// 카페 회원 가입
var boardMemberJoin = {
	init : function () {
		// 카페가입시 유효성 검사 수행.
		// cafeCheckNicknameButton
		// 카페 회원 가입 폼테그
		var joinForm = document.getElementById('applyFrm');
		joinForm.addEventListener('click', function(event) {
			var selectedTag = event.target;
			// 1. 카페 닉네임 중복 검사
			if (selectedTag.parentElement.id ==='cafeCheckNicknameButton') {
				// 카페 멤버 닉네임
				var nickNameInput = document.getElementById('cafeNickNameInput');
				// 카페 멤버 닉넴 byte 초과한 경우, 경고 메세지를 날리고 수행하지 않는다.
				if (nickNameInput.classList.contains("invalid")) {
					alert("중복검사전 허용 바이트값을 확인하세요.");
					return;
				}
				
				// 서버로 닉네임 중복검사 
				var cafeMemberJoin = {};
				cafeMemberJoin.cafeUid = document.getElementsByName("cafeUid")[0].value;
				cafeMemberJoin.cafeNicName = nickNameInput.value;
				var json = JSON.stringify(cafeMemberJoin);
				var requestParams = common.requestParams(true, "POST", "/board/existCafeNickName.json", json, null);
				common.sync(requestParams);

			} else if (selectedTag.id ==='sign_up') {
				// 유효성 실패한 요소 체크.
				var invalidList = document.getElementsByClassName('invalid');
				
				if (invalidList.length > 0) {
					alert ("카페 가입전에 한번 더 확인해 주세요.");
					return;
				}
				var url = document.getElementById('front-cafe');
					
				// 서버로 닉네임 중복검사 
				var cafeMemberJoin = {};
				// 클라이언트에서 처리하지 않는 변수  userUid, userRole 새싹멤버 (0), cafeFav, cafeLeaveDate
				cafeMemberJoin.cafeUid = document.getElementsByName("cafeUid")[0].value;
				cafeMemberJoin.cafeOfficial = document.getElementsByName("cafeOfficial")[0].value;
				cafeMemberJoin.cafeLevel = document.getElementsByName("cafeLevel")[0].value;
				cafeMemberJoin.cafeNicName = document.getElementById('cafeNickNameInput').value;
					
				// <a href="/board/${cafe_url}">
			
				/*
				 * | userUid       | bigint(20) unsigned | NO   | MUL | NULL    |       |
				 * | cafeUid       | bigint(20) unsigned | NO   | MUL | NULL    |       |
				 * | cafeLevel     | varchar(20)         | NO   |     | NULL    |       |
				 * | cafeFav       | tinyint(1)          | YES  |     | 0       |       |
				 * | cafeOfficial  | tinyint(1)          | YES  |     | 0       |       |
				 * | userRole      | tinyint(3)          | YES  |     | 0       |       |
				 * | cafeNicName   | varchar(20)         | YES  |     |         |       |
				 * | cafeLeaveDate | bigint(20)          | YES  |     | 0
				 */
				
				var json = JSON.stringify(cafeMemberJoin);
				var requestParams = common.requestParams(true, "POST", "/board/memberJoin.json", json, null);
				common.sync(requestParams);

			}
		
			

			
		});
		
		// 키를 누르고 있을때 이벤트
		joinForm.addEventListener('keyup', function(event) {
			var selectedTag = event.target;
			// 1. 카페 닉네임 글자 길이 체크
			if (selectedTag.id ==='cafeNickNameInput') {
				// 카페 멤버 닉네임
				var bytes = document.getElementById('showLengthArea');
				var textLength = selectedTag.value.length;
				// 현재 바이트 계산
				var byte = 0;
				// 키를 뗴고 나서 byte 계산
				for(var i = 0; i < textLength; i++) {
					byte += common.calUtf8Bytes(selectedTag.value.charAt(i));
				}
				bytes.innerHTML = byte + "/20bytes";
				
				// 1. 바이트수 체크
				if (byte > 20) {
					alert("허용 바이트수 초과되었습니다.");
					selectedTag.classList.add("invalid");
					return;
				}
				
				// 텍스트 유효성 검사 완료
				selectedTag.classList.remove("invalid");
				
			}
		})		

	}



};

(function() {
	boardMemberJoin.init();
})();
