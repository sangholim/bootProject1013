/**
 * index 페이지에서 필요한 UI 기능 추가
 */

var index = {};

// index 에서 필요한 기능을 addEventListner로 등록한다.
index.init = function() {
	
	// refresh 이슈
	// 해야할일 
	var xxxx = common.encType;
	var admin_board_viewUrl = "board/admin/view";
	var admin_board_viewNodes = document
			.getElementsByClassName("board/admin/view")[0]
			.getElementsByTagName("div");
	// 진짜 데이터 리스트 있는 노드들을 호출하고 패이징 번호
	var admin_board_view_Leng = admin_board_viewNodes.length;

	for (var i = 0; i < admin_board_view_Leng; i++) {
		if (admin_board_viewNodes[i].addEventListener) {
			//클릭시 form을 생성하여 전송함.
			admin_board_viewNodes[i].addEventListener('click', function(event) {
				common.createForm(admin_board_viewUrl);
				//form의 데이터를 json으로
			});
		}
	}

}
// test 실행
index.init();
