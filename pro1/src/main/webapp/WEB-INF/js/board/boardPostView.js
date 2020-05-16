/*
    게시글의 Update,delete 요청 등을 담당하는 js
 */

var boardPostView = {

    init : function () {


        //돔이 다 불러와졌을떄 실행 -> DOMContentLoaded
        document.addEventListener("DOMContentLoaded", function(){

            var inbox = document.getElementById("content-area");

            var removeBtn = document.getElementById("postRemove");

            var modifyFormLink = document.querySelector("#modifyFormLink");
            // url정보 취득
            // 개인 게시글  존재하는 url 정보 추가
            var boardViewLink = document.getElementsById("linkUrl");
            boardViewLink.textContent = window.location.origin+boardViewLink.textContent; 
  
            inbox.addEventListener('click',function (event) {

                var selectedTag = event.target;
                if(selectedTag == removeBtn) {
                    var result = confirm("정말로 게시글을 삭제 하시겠습니까?");

                    if(result) {
                        boardPostView.postDelete();
                    }
                } else if (selectedTag == modifyFormLink) {

                  //  alert("test");
                    var boardUid = document.querySelector("input[name=boardUid]").value;
                    var subject = document.querySelector("#post_subject").textContent;
                    var content = document.querySelector("#tbody").textContent;
                    window.location.href="/board/d/update_post?boardUid="
                        +boardUid+"&subject="+subject+"&content="+content;


                }
            });
        });
    },

    postDelete : function () {

        var boardUid = document.querySelector("#board_info [name=boardUid]").value;

        frm.action = "/board/d/delete_post?boardUid="+boardUid;
        frm.method = "post";
        frm.submit();
    },
    postUpdate : function() {

    }




};

(function() {
    boardPostView.init();
})();
