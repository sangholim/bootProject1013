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
        postInfo['cafeUid'] = 8;
        postInfo['subject'] = document.getElementById("subject").value;
        postInfo['writer'] = login_info.childNodes[3].value;;
        postInfo['addfile'] = "jell";
        postInfo['createDate'] = 0;
        postInfo['modifiedDate'] = 0;

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

            var menuLink0 = document.getElementById("menuLink0");

            if(selectedTag == menuLink0) {

                //debugger;
                //alert("tt");
                event.preventDefault();
               // event.stopPropagation();
                smart_editor.style.visibility = "hidden";
                mainAreaContent.style.display = "block";
            }

            if(selectedTag == cafeWriteButton) {

                if( smart_editor.style.visibility == "hidden") {
                    smart_editor.style.visibility = "visible";
                    mainAreaContent.style.display = "none";
                }
                // else {
                //     smart_editor.style.visibility = "hidden";
                //     mainAreaContent.style.display = "block";
                // }
            }
            else if(selectedTag == saveBtn) {
                board.boardWrite(login_info);
               // alert("글쓰기");
            } else if(selectedTag == menuLink0) {
                window.location.href = "/board/"+document.getElementsByClassName("cafe_url")[0].innerText;;
            }
        });

    },
};

(function() {
    board.init();
})();
