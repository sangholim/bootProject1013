/*
    게시글의 Update,delete 요청 등을 담당하는 js
 */

var boardJoinView = {

    // init : function () {
    //
    //     var sign_up = document.querySelector('#sign_up');
    //
    //     // document.addEventListener("DOMContentLoaded",function () {
    //
    //     var joinUserInfo = {};
    //
    //     var inputList = [];
    //     inputList = document.querySelectorAll('input');
    //
    //         inputList.forEach(function(input) {
    //             input.addEventListener('click', function () {
    //
    //                 var selectInput = event.target;
    //
    //                 if(selectInput == sign_up) {
    //
    //                     boardJoinView.MemberJoin();
    //                 }
    //             });
    //         });
    // },
    // MemberJoin : function() {
    //
    //     var cafe_simple_info = [];
    //     cafe_simple_info = document.querySelector("#cafe_simple_info");
    //
    //     cafeInfoList = document.querySelector("#cafe_simple_info").children;
    //     cafeInfoList = Array.from(cafeInfoList);
    //
    //     var cafeJoinJson = {
    //                 'cafeLevel':0,
    //                 'desc':'',
    //                 'cafeMemberCnt':0,
    //                 'cafeUid':0,
    //                 'cafeNicName':''
    //             };
    //
    //     cafeJoinJson['cafeLevel'] = cafeInfoList[0].value;
    //     cafeJoinJson['desc'] = cafeInfoList[1].value;
    //     cafeJoinJson['cafeMemberCnt'] = cafeInfoList[2].value;
    //     cafeJoinJson['cafeUid'] = cafeInfoList[3].value;
    //     cafeJoinJson['cafeNicName'] = document.querySelector("#cafeNickNameInput").value;
    //
    //     //console.log(cafeJoinJson);
    //
    //     var requestParams = common.requestParams(true ,"POST", "/board/MemberJoin.json", cafeJoinJson, null);
    //     common.sync(requestParams);
    //
    // }




};

(function() {
    boardJoinView.init();
})();
