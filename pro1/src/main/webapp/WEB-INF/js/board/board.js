/**
 * 
 */

var board = {

    boardWrite : function (login_info) {

        //smart editor에 입력받은 내용을 해당(ir1)텍스트영역에 값집어넣기.
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

        var ir1 = document.getElementsByName("ir1");

        var postInfo = {};

        postInfo['content'] = ir1[0].value;
        postInfo['userUid'] = login_info.childNodes[1].value;
        postInfo['cafeUid'] = document.querySelector("#cafe_info [name=cafeUid]").value;
        postInfo['subject'] = document.getElementById("subject").value;
        postInfo['writer'] = login_info.childNodes[3].value;;
        postInfo['addfile'] = "";
        postInfo['createDate'] = 0;
        postInfo['modifiedDate'] = 0;
        postInfo['cafeUrl'] = document.querySelector("#cafe_info [name=cafeUrl]").value;

        var json = JSON.stringify(postInfo);
        //request 파람만들고
        var requestParams = common.requestParams(true ,"POST", "/board/insert_post.json", json, null);
        //서버에 호출하는 로직
        common.sync(requestParams);
    },
    signUp : function () {

        var signUpInfo = {};

        /*var cafeJoinJson = {
                            'cafeLevel':'',
                            'cafeUid':0,
                            'cafeNicName':''
                        };*/

        var cafeJoinJson = {};

        //cafeJoinJson['userUid'] = 0;
        cafeJoinJson['cafeUid'] = parseInt(document.querySelector("input[name=cafeUid]").value);
        cafeJoinJson['cafeLevel'] = document.querySelector("input[name=cafeLevel]").value;
        cafeJoinJson['cafeFav'] = 0;
        cafeJoinJson['cafeOfficial'] = 0;
        cafeJoinJson['userRole'] = 0;
        cafeJoinJson['cafeNicName'] = document.querySelector("#cafeNickNameInput").value;
        //cafeJoinJson['cafeNicName'] = document.getElementsByName('nickname').value;

        var json = JSON.stringify(cafeJoinJson);

        var requestParams = common.requestParams(true ,"POST", "/board/MemberJoin.json", json, null);
        //서버에 호출하는 로직
        common.sync(requestParams);
    },
    init : function () {

        
    	
    	//카페글쓰기 & 카페 가입하기 버튼
        var boardMainBtn = document.getElementById("boardMainBtn");
    	// 로그인한 유저 정보
        var login_info = document.getElementById("login_info");
        
    	// 유저 정보에 따라서 카페 가입/글쓰기 버튼 UI 설정
    	var isMemeber = document.getElementsByName("isCafeUser")[0].value;
    	
    	// 카페 가입되었다면 버튼 UI 변경
    	if (isMemeber == "true") {
    		boardMainBtn.textContent = "카페 글쓰기";
    	}
    	
        //스마트 에디터
        var smart_editor = document.getElementById("smart_editor");
        
        var bodyTag = document.getElementById("content-area");
        bodyTag.addEventListener('click', function(event) {

            var selectedTag = event.target;

            //메인 영역
            var mainAreaContent = document.getElementsByClassName("main_content")[0];

            //글 저장
            var saveBtn = document.getElementById("insertbtn");

            var menuLink0 = document.getElementById("menuLink0");

            var sign_up = document.getElementById("sign_up");

            //로그인한 사용자가 카페가입자인지
            var isCafeUser = document.querySelector("input[name='isCafeUser']").value;
        
            if(selectedTag == menuLink0) {
            	event.preventDefault();
            	smart_editor.style.visibility = "hidden";
            	mainAreaContent.style.display = "block";
            }

            if(selectedTag == boardMainBtn) {
            	if(isCafeUser == 'true') {
                    if( smart_editor.style.visibility == "hidden") {
                        smart_editor.style.visibility = "visible";
                        smart_editor.style.height="";
                        mainAreaContent.style.display = "none";
                    }
                } else {
                    //alert("카페 가입자가 아닙니다.");
                    if(join_editor.style.visibility == "hidden") {
                        join_editor.style.visibility = "visible";
						smart_editor.style.visibility = "hidden";
                        smart_editor.style.height="1px";
                        // smart_editor.style.display = "none";
                        mainAreaContent.style.display = "none";
                    }
                }
 
            }
            else if(selectedTag == saveBtn) {
                board.boardWrite(login_info);
               // alert("글쓰기");
            } else if(selectedTag == menuLink0) {
                window.location.href = "/board/"+document.getElementsByClassName("cafe_url")[0].innerText;
            } else if(selectedTag == sign_up) {
                board.signUp();
            }
        
        });

    },
};

(function() {
     board.init();
})();
