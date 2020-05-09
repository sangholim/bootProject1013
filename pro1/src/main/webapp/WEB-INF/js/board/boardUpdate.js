var boardUpdate = {

    init : function () {

        //oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);


        var login_info = document.getElementById("login_info");

        //글 저장
        var saveBtn = document.getElementById("insertbtn");

        //스마트 에디터
        var smart_editor = document.getElementById("smart_editor");



        var bodyTag = document.getElementById("nboard");
        bodyTag.addEventListener('click', function(event) {


            var selectedTag = event.target;


            if(selectedTag == saveBtn) {
                boardUpdate.boardUpdateFn();

                // alert("글쓰기");
            }

        });

    },
    boardUpdateFn : function () {

        //smart editor에 입력받은 내용을 해당(ir1)텍스트영역에 값집어넣기.
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

        var ir1 = document.getElementsByName("ir1");

        var postInfo = {};

        postInfo['boardUid'] = document.querySelector("input[name=boardUid]").value;
        postInfo['content'] = ir1[0].value;
        postInfo['subject'] = document.getElementById("subject").value;
        postInfo['createDate'] = 0;
        postInfo['modifiedDate'] = 0;
        //postInfo['cafeUrl'] = document.querySelector("#cafe_info [name=cafeUrl]").value;

        var json = JSON.stringify(postInfo);
        //request 파람만들고
        var requestParams = common.requestParams(true ,"POST", "/board/d/update_post.json", json, null);
        //서버에 호출하는 로직
        common.sync(requestParams);
    },

};

(function() {
    boardUpdate.init();
})();
