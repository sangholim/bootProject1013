/**
 * 
 */

var board = {


    init : function () {

        var bodyTag = document.getElementById("group-area");

        bodyTag.addEventListener('click', function(event) {
            var selectedTag = event.target;
            //var myCafeTypeSize = myCafeType.length;
            var cafeWriteButton = document.getElementById("boardwrite");
            var mainAreaContent = document.getElementsByClassName("main_content")[0];

            /*var child = mainAreaContent[0].childNodes[0];*/
            if(selectedTag == cafeWriteButton) {

            }
            else {
                alert('이벤트감지');
            }

        });
    }
};


(function() {
    board.init();
})();
