/**
 * 
 */

var board = {

    boardWrite : function (login_info) {

        var ir1 = document.getElementsByName("ir1");

        //form tag 안쓰고 xmlHttpRequest 사용.
        //common.createForm('/cafe/add',json);
        // response 값을담는곳 node id

        var postInfo = {};

        postInfo['content'] = ir1[0].value;
        postInfo['userUid'] = login_info.childNodes[1].value;
        postInfo['cafeUid'] = 8;
        postInfo['subject'] = document.getElementById("post_subject").value;
        postInfo['writer'] = login_info.childNodes[3].value;;
        postInfo['addfile'] = "jell";
        postInfo['createDate'] = 100000;
        postInfo['modifiedDate'] = 100000;

        var json = JSON.stringify(postInfo);
        //request 파람만들고
        var requestParams = common.requestParams(true ,"POST", "/board/insert_post.json", json, null);
        //서버에 호출하는 로직
        common.sync(requestParams);
    },

    init : function () {

        var login_info = document.getElementById("login_info");

        var bodyTag = document.getElementById("content-area");
        bodyTag.addEventListener('click', function(event) {
            var cafeWriteButton = document.getElementById("boardwrite");
            var selectedTag = event.target;

            //카페글쓰기
            var cafeWriteButton = document.getElementById("boardwrite");

            //메인 영역
            var mainAreaContent = document.getElementsByClassName("main_content")[0];

            //글 저장
            var saveBtn = document.getElementById("insertbtn");

            //스마트 에디터
            var smart_editor = document.getElementById("smart_editor");


            if(selectedTag == cafeWriteButton) {

                if( smart_editor.style.visibility == "hidden") {
                    smart_editor.style.visibility = "visible";
                    mainAreaContent.style.display = "none";
                }
                else {
                    smart_editor.style.visibility = "hidden";
                    mainAreaContent.style.display = "block";
                }
            }
            else if(selectedTag == saveBtn) {
                board.boardWrite(login_info);
                alert("글쓰기");
            }
        });

    },
};

(function() {
    board.init();
})();
