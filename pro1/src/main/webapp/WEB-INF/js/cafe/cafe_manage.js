/**
 * 
 * 비동기 방식으로 데이터 가져오는 경우 해당 url 마다 이벤트를 처리하지 않고, 무조건 동기 history로 처리하여 진행한다.
 */

var cafeManage = {
	// 초기화 business 로직
	baseParam : {
		// 페이지 묶음
		showDataListCount : 15,
		// 페이지 번호 리스트 UI 최소값
		showPageMinimumCount : 1,
		// 페이지 번호 리스트 UI 최대값
		showPageMaximumCount : 1,
		// 선택된 페이지 번호
		selectedPageNum : 1,
		// 보여줄 페이지 갯수
		showPageNumCount : 8,
		// 관리탭 타입
		cateGory : 'mycafe',
		cafeFav : 0
	},
	getCafeManageList : function(cafeList) {

		// 비동기 통신을 통해 얻은 카페리스트를 렌더링작업
		var myCafeList = cafeList.userCafeList;
		var mycafe_manage = document.getElementsByClassName("mycafe_manage")[0];
		var cafeListWrapper = mycafe_manage.getElementsByClassName("mycafe_list")[0];
		document.getElementsByClassName("mycafe_bottom")[0].style.display = "none";
		//cafeListWrapper.getElementsByTagName("tbody")[0].innerHTML = "";
		var pageUI = document.getElementsByClassName("common_page")[0];
		pageUI.innerHTML = "";
		// 카페리스트가 없으면 렌더링 중지
		if (myCafeList.length == 0) {
			return;
		}

		// 경로에 따라 카페 포맷 ui 호출
		// window.location.pathname.indexOf("/", 2)
		var myCafeTabPath = window.location.pathname;
		var selectedFormat = cafeManage.cafeFormat;
		var nicImgTag;
		// table 기본 foramt 바인드
		cafeListWrapper.innerHTML = cafeManage.mycafeTableDefaultFormat;
		
		// 탭 종류 구분하기
		if (myCafeTabPath.indexOf("managing", 2) > 0) {
			selectedFormat = cafeManage.cafeManageFormat;
			// manage 탭에 맞는 col, th 태크 일부 변경
			var headerTags = cafeListWrapper.getElementsByTagName("col");
			headerTags[0].width = "*";
			headerTags[1].width = "99px";
			headerTags[2].width = "110px";
			headerTags[3].width = "56px";

			headerTags = cafeListWrapper.getElementsByTagName("th");
			headerTags[0].textContent = "카페명";
			headerTags[1].textContent = "랭킹";
			headerTags[2].textContent = "멤버수";
			headerTags[3].textContent = "관리";
			nicImgTag = "<img src='https://cafe.pstatic.net/levelicon/1/1_1.gif' alt='' width='11' height='11' class='ico_mystatus'>";
		} else if (myCafeTabPath.indexOf("secede", 2) > 0) {
			selectedFormat = cafeManage.cafeSecedeFormat;
			var headerTags = cafeListWrapper.getElementsByTagName("col");
			headerTags[0].width = "24px";
			headerTags[1].width = "*";
			headerTags[2].width = "172px";
			headerTags[3].width = "72px";

			headerTags = cafeListWrapper.getElementsByTagName("th");
			headerTags[0].textContent = "선택";
			headerTags[1].textContent = "카페명";
			headerTags[2].textContent = "탈퇴일";
			headerTags[3].textContent = "작성글 관리";

			// 전체삭제 UI 추가
			document.getElementsByClassName("mycafe_bottom")[0].style.display = "";
		}

		cafeListWrapper = cafeListWrapper.getElementsByTagName("tbody")[0];

		for (var i = 0; i < myCafeList.length; i++) {
			var myCafe = myCafeList[i];
			var cafeTrTag = document.createElement("tr");
			cafeTrTag.innerHTML = selectedFormat;
			// var cafeTdTags = cafeTrTag.getElementsByTagName("td");
			var cafeTdTag = cafeTrTag.getElementsByClassName("bookmark")[0];

			if (cafeTdTag !== undefined) {
				cafeTdTag.getElementsByTagName("button")[0].setAttribute(
						"aria-pressed", (myCafe.cafeFav == 0) ? false : true);
			}

			cafeTdTag = cafeTrTag.getElementsByClassName("check_box")[0];
			// 탈퇴 탭을 클릭시 발생하는 체크박스 처리
			if (cafeTdTag !== undefined) {
				/*
				 * "<div class='check_box only_box'>"+ "<input type='checkbox'
				 * id='chk_21819796'>"+ "<label for='chk_21819796'>"+ "<span
				 * class='blind'>선택</span>"+ "</label>"+ "</div>"+
				 */
				cafeTdTag.getElementsByTagName("input")[0].id = 'chk_' + i;
				cafeTdTag.getElementsByTagName("label")[0].htmlFor = 'chk_' + i;
			}

			cafeTdTag = cafeTrTag.getElementsByClassName("cafe_info")[0];
			if (cafeTdTag !== undefined) {
				// 카페 url
				cafeTdTag.getElementsByTagName("a")[0].href = "/board/"
						+ myCafe.cafe.url;
				// 카페 name
				cafeTdTag.getElementsByTagName("a")[0].textContent = myCafe.cafe.name;
				// 카페에서 사용하는 닉네임
				if (cafeTdTag.getElementsByClassName("nick_name").length > 0) {
					// nickNameTag에서 IMG 필요시 imageTag 추가
					cafeTdTag.getElementsByClassName("nick_name")[0].innerHTML = (nicImgTag === undefined) ? myCafe.cafeNicName
							: myCafe.cafeNicName + nicImgTag;
				}
			}

			cafeTdTag = cafeTrTag.getElementsByClassName("member")[0];
			if (cafeTdTag !== undefined) {
				// TODO: 카페 회원수 구현
			}

			cafeTdTag = cafeTrTag.getElementsByClassName("date")[0];
			if (cafeTdTag !== undefined) {
				// 카페 탈퇴날짜 구현 date
				// vo: myCafe.cafeLeaveDate
				// 2016.09.21 18:00 탈퇴
				var format = new Date(myCafe.cafeLeaveDate);
				var leaveDate = ' 탈퇴';
				var year = format.getFullYear();
				var month = (format.getMonth() < 10) ? '0'
						+ (format.getMonth() + 1) : format.getMonth() + 1;
				var date = (format.getDate() < 10) ? '0' + format.getDate()
						: format.getDate();
				var hour = (format.getHours() < 10) ? '0' + format.getHours()
						: format.getHours();
				var min = (format.getMinutes() < 10) ? '0'
						+ format.getMinutes() : format.getMinutes();
				cafeTdTag.innerHTML = year + '.' + month + '.' + date + ' '
						+ hour + ':' + min + ' 탈퇴';

			}
			cafeListWrapper.append(cafeTrTag);
		}

		/*
		 * 페이지 번호 구현
		 */
		cafeManage.baseParam.showPageMinimumCount = cafeList.showPageMinimumCount;
		cafeManage.baseParam.showPageMaximumCount = cafeList.showPageMaximumCount;

		var min = cafeList.showPageMinimumCount;
		// 선택된 페이지 번호
		// 총 페이지 갯 수에 따라 페이지 번호 UI 보여줌
		for (var i = min; i <= cafeList.showPageMaximumCount; i++) {
			var pageNumber = document.createElement("button");
			pageNumber.classList.add("btn", "btn_pageNum");
			pageNumber.textContent = i;
			// 선택된 페이지에는 강조 표시
			if (i == cafeManage.baseParam.selectedPageNum) {
				pageNumber.classList.add("on");
				var span = document.createElement("span");
				span.classList.add("blind");
				span.textContent = "선택됨";
				pageNumber.appendChild(span);
			}
			pageUI.appendChild(pageNumber);
		}

	},
	getCafeSecedeBoardList : function (cafeList) {

		// 탈퇴한 카페의 게시글 리스트 뿌림
		// 기존 카페리스트의 dom을 제거
		var myCafeList = cafeList.userCafeList;
		var mycafe_manage = document.getElementsByClassName("mycafe_manage")[0];
		// 그룹 정렬 감춤
		document.getElementsByClassName("mycafe_top")[0].style.display="none";
		// 노출
		// secede_cafe_title
		// manage_article
		mycafe_manage.children[0].style.display="";
		mycafe_manage.children[1].style.display="";
		// 카페 테이블 내부 초기화
		var cafeListWrapper = mycafe_manage.getElementsByClassName("mycafe_list")[0];
		cafeListWrapper.classList.add("type2");
		cafeListWrapper.innerHTML = "";
		// table 기본 foramt 생헝
		cafeListWrapper.innerHTML = cafeManage.mycafeTableDefaultFormat;
		
		// 탈퇴한 게시판 리스트 ui 맞게 변경해준다.
		// 1. caption > <span class="blind">작성글 목록</span>
		cafeListWrapper.getElementsByTagName("caption")[0].getElementsByTagName("span")[0].textContent = "작성글 목록";
		/*
		 * 2. colgroup 변경
		 * <col width="24px">
		 * <col width="*">
		 * <col width="133px"> 
		 */
		var multiTags = cafeListWrapper.getElementsByTagName("colgroup")[0].children;
		// default col 갯수는 4개라, 1개 제거.
		multiTags[0].remove();
		multiTags[0].width="24px";
		multiTags[1].width="*";
		multiTags[2].width="133px";
		/*
		 * 3. thead 내부 변경
		 *     <tr>
		 *      <th scope="col">체크박스</th>
		 *      <th scope="col">제목</th>
		 *      <th scope="col">작성일시</th>
		 *     </tr>
		 */
		multiTags = cafeListWrapper.getElementsByTagName("thead")[0].firstChild.children;
		multiTags[0].remove();
		multiTags[0].textContent="체크박스";
		multiTags[1].textContent="제목";
		multiTags[2].textContent="작성일시";
		// 4. tbody는 따로
		// test
		cafeListWrapper.getElementsByTagName("tbody")[0].innerHTML += cafeManage.cafeSecedeBoardFormat;
	},
	cafeFormat : "<td class='bookmark'>"
			+ "<button aria-pressed='즐겨찾기에 따라서 true false' class='bookmark_cafe'>"
			+ "<i class='blind'>즐겨찾는 카페</i>"
			+ "</button>"
			+ "</td>"
			+ "<td class='cafe_info'>"
			+ "<a href='카페경로'= target='_blank' class='cafe_name'>카페명</a>"
			+ "<div class='common_icon_box'></div>"
			+ "<div class='user'>"
			+ "<span class='nick_name'></span>"
			+ "<a href='https://cafe.naver.com/re4mo/member/bbqbabo/article' target='_blank' class='my_article'>내가 쓴 글 보기</a>"
			+ "</div>" + "</td>" + "<td class='mail_set'>"
			+ "전체메일 <button class='btn_mail on'>ON</button>" + "</td>"
			+ "<td class='btns'>" + "<button class='btn_set'>탈퇴</button>"
			+ "</td>",
	cafeManageFormat : "<td class='cafe_info'>"
			+ "<a href='경로' class='cafe_name'>카페이름</a>"
			+ "<div class='common_icon_box'><!----></div>"
			+ "<div class='user'>"
			+ "<span class='nick_name'>카페닉네임</span> <!---->"
			+ "<a href='https://cafe.naver.com/kia12344/member/bbqbabo/article' target='_blank' class='my_article'>내가 쓴 글 보기</a>"
			+ "</div>" + "</td>" + "<td class='ranking'><!----></td>"
			+ "<td class='member'>" + "<span class='member_no'>1</span>"
			+ "</td>" + "<td class='btns'>"
			+ "<button class='btn_set'>관리</button>" + "</td>",
	cafeSecedeFormat : "<td class='check'>"
			+ "<div class='check_box only_box'>"
			+ "<input type='checkbox' id='chk_21819796'>"
			+ "<label for='chk_21819796'>" + "<span class='blind'>선택</span>"
			+ "</label>" + "</div>" + "</td>" + "<td class='cafe_info'>"
			+ "<a href='' target='_blank' class='cafe_name'>" + "</a>"
			+ "</td>" + "<td class='date'></td>" + "<td class='btns'>"
			+ "<button class='btn_set'>작성글 관리</button>" + "</td>",
	cafeAllDeleteFormat : "<div class='check_box'>"
			+ "<input type='checkbox' id='chk_all_article'>"
			+ "<label>전체선택</label>" + "</div>"
			+ "<div class='common_btn_form fr'>"
			+ "<button class='btn2'>삭제</button>" + "</div>",
	cafeSecedeBoardFormat : "<tr>"+
							  "<td class='check'>"+
							    "<div class='check_box only_box'>"+
							      "<input type='checkbox' id='chk_59556'>"+
							      "<label for='chk_59556'>"+
							        "<span class='blind'>선택</span>"+
							      "</label>"+
							    "</div>"+
							  "</td>"+
							  "<td class='tit'>"+
							    "<a href='#'>카페에 좋은 내용이  많네요..</a>"+
							  "</td>"+
							  "<td class='date'>2020.07.12. 11:37</td>"+
							"</tr>",
	mycafeTableDefaultFormat:	"<caption>"+
									"<span class='blind'>내카페 관리</span>"+
								"</caption>"+
								"<colgroup>"+
									"<col width='46px'>"+
									"<col width='*'>"+
									"<col width='145px'>"+
									"<col width='56px'>"+
								"</colgroup>"+
								"<thead class='blind'>"+
									"<tr>"+
										"<th scope='col'>즐겨찾기</th>"+
										"<th scope='col'>카페명</th>"+
										"<th scope='col'>메일 설정</th>"+
										"<th scope='col'>탈퇴</th>"+
									"</tr>"+
								"</thead>"+
								"<tbody>"+
								// " tr 정의하여 변경"+
								"</tbody>",
	init : function() {

		/*
		 * 비동기 방식으로 데이터 가져오는 경우 해당 url 마다 이벤트를 처리하지 않고, 무조건 동기 history로 처리하여
		 * 진행한다.
		 */
		var path = window.location.pathname.substring(window.location.pathname
				.indexOf("/", 2));

		var myCafeTabs = document.getElementsByClassName("mycafe_tab")[0];
		var tabUrlTag = myCafeTabs.getElementsByTagName("a");

		// 선택된 카페 UI 표시하기
		for (var i = 0; i < tabUrlTag.length; i++) {

			if (tabUrlTag[i].href.indexOf(path) > 0) {
				cafeManage.baseParam.cateGory = tabUrlTag[i].className;
				// router-link-exact-active on
				tabUrlTag[i].classList.add("router-link-exact-active", "on");
				break;
			}
		}

		// 해당탭 관련 카페 리스트 긁어오기
		// 비동기 통신을 통하여 결과같을 getCafeManageList()에서 ui생성
		var json = JSON.stringify(cafeManage.baseParam);
		var requestParams = common.requestParams(true, "POST",
				"/cafe/manage/list.json", json, null);
		common.sync(requestParams);

		var commonSelects = document.getElementsByClassName("common_select");
		// 카페 리스트에 있는 button UI들
		var btns = document.getElementsByClassName("btn_set");
		var bodyTag = document.getElementById("content");
		bodyTag
				.addEventListener(
						'click',
						function(event) {
							var selectedTag = event.target;

							// 그룹정렬에 관한 이벤트 리스너
							if (selectedTag.classList.contains("btn_select")
									&& selectedTag.parentElement.classList
											.contains("common_select")) {
								selectedTag.parentElement
										.getElementsByClassName("layer")[0].style.display = "";

							} else if (selectedTag.classList
									.contains("btn_pageNum")) {
								// 페이지 버튼에 따라 카페리스트 호출[async]
								cafeManage.baseParam.selectedPageNum = parseInt(selectedTag.textContent);
								var json = JSON.stringify(cafeManage.baseParam);
								var requestParams = common.requestParams(true,
										"POST", "/cafe/manage/list.json", json,
										null);
								common.sync(requestParams);

							} else if (selectedTag.classList
									.contains("bookmark_cafe")) {
								// bookmark 버튼눌럿을때 이벤트 리스너

								var bookmark = !(selectedTag
										.getAttribute("aria-pressed") === 'true');
								var modCafeFav = 0;
								selectedTag.setAttribute("aria-pressed",
										bookmark);

								if (bookmark) {
									cafeManage.baseParam.cafeFav = 1;
									modCafeFav = 1;
								} else {
									cafeManage.baseParam.cafeFav = 0;
									modCafeFav = -1;
								}

								var cafeUrl = selectedTag.parentElement.parentElement
										.getElementsByClassName("cafe_info")[0]
										.getElementsByTagName("a")[0].href;
								cafeUrl = cafeUrl.substr(cafeUrl
										.lastIndexOf("/") + 1);

								cafeManage.baseParam.url = cafeUrl;
								cafeManage.baseParam.selectedPageNum = parseInt(selectedTag.textContent);
								var json = JSON.stringify(cafeManage.baseParam);
								var requestParams = common.requestParams(true,
										"POST", "/cafe/manage/modCafeFav.json",
										json, null);
								common.sync(requestParams);
								// 즐겨찾기 탭에 있는 카운트 갱신
								var cafeFavCntTag = tabUrlTag[1]
										.getElementsByTagName("em")[0];
								var cnt = parseInt(cafeFavCntTag.innerHTML);
								if (cnt == 0 && modCafeFav < 0) {
									return;
								}
								cafeFavCntTag.innerHTML = parseInt(cafeFavCntTag.innerHTML)
										+ modCafeFav;

							} else if (selectedTag.classList
									.contains("btn_set")
									&& selectedTag.textContent === '탈퇴') {
								// 탈퇴 버튼을 누르면, 내카페에 사라지고 탈퇴된 카페 UI로 이동.
								var cafeUrl = selectedTag.parentElement.parentElement
										.getElementsByClassName("cafe_info")[0]
										.getElementsByTagName("a")[0].href;
								cafeUrl = cafeUrl.substr(cafeUrl
										.lastIndexOf("/") + 1);
								cafeManage.baseParam.url = cafeUrl;
								cafeManage.baseParam.userRole = -2;
								var json = JSON.stringify(cafeManage.baseParam);
								var requestParams = common.requestParams(true,
										"POST",
										"/cafe/manage/modCafeUserRole.json",
										json, null);
								common.sync(requestParams);
							} else if (selectedTag.classList
									.contains("btn_set")
									&& selectedTag.textContent === '작성글 관리') {
								// 탈퇴 버튼을 누르면, 내카페에 사라지고 탈퇴된 카페 UI로 이동.
								var cafeUrl = selectedTag.parentElement.parentElement
										.getElementsByClassName("cafe_info")[0]
										.getElementsByTagName("a")[0].href;
								cafeUrl = cafeUrl.substr(cafeUrl
										.lastIndexOf("/") + 1);
								cafeManage.baseParam.url = cafeUrl;
								cafeManage.baseParam.userRole = -2;
								var json = JSON.stringify(cafeManage.baseParam);
								var requestParams = common.requestParams(true,
										"POST",
										"/cafe/manage/cafeSecedeBoardList.json",
										json, null);
								common.sync(requestParams);
							
							}

							if (!selectedTag.classList.contains("btn_select")
									|| !selectedTag.parentElement.classList
											.contains("common_select")) {
								for (var i = 0; i < commonSelects.length; i++) {
									commonSelects[i]
											.getElementsByClassName("layer")[0].style.display = "none";
								}
							}

						});

	}
};

/**
 * Cafe Manage Business Logic 초기화
 * 
 * @returns
 */
(function() {
	cafeManage.init();
})();