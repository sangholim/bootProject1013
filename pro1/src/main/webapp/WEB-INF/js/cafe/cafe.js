/**
 * 카페 소스 불러올때 정의값 저장
 */

var cafe = {
	mainTitleList : [ "게임", "만화/애니메이션", "방송/연예", "문화/예술", "영화", "음악", "팬카페",
			"여행", "스포츠/레저", "반려동물/동물", "취미", "생활", "패션/미용", "건강/다이어트", "가족/육아",
			"컴퓨터/통신", "교육", "외국어", "인문/과학", "경제/금융", "정치/사회", "문학/창작", "동창/동문",
			"친목/모임", "종교/봉사" ],
	subTitleList : [
			[ "롤플레잉", "시뮬레이션", "FPS/슈팅", "액션/어드벤처", "레이싱", "스포츠", "모바일",
					"비디오 게임기", "게이머/게임제작", "길드/클랜", "게임일반" ],
			[ "순정/드라마", "코믹", "액션/무협", "공포/추리", "판타지/SF", "스포츠", "웹툰", "제작",
					"만화일반" ],
			[ "TV방송", "라디오방송", "인터넷방송", "신문/잡지", "연예정보", "오디션", "방송일반" ],
			[ "연극", "뮤지컬/오페라", "무용/댄스", "회화", "공예/장식미술", "조소/도예", "서예", "디자인",
					"건축", "사진", "미술관/박물관", "문화/예술일반" ],
			[ "드라마/로맨스영화", "코미디영화", "액션/무협영화", "공포/스릴러영화", "SF/판타지", "다큐멘터리영화",
					"고전/역사영화", "인디/예술영화", "영화제작", "영화관/극장", "영화제/영화평론", "영화일반" ],
			[ "발라드", "힙합/댄스음악", "팝/R&amp;B", "록/메탈음악", "인디음악", "재즈/뉴에이지음악",
					"클래식음악", "성악/오페라음악", "국악/민속음악", "OST", "음악이론/평론", "작곡/작사",
					"노래/연주", "콘서트/가요제", "악기/악보", "음악일반", "뮤직비디오" ],
			[ "국내배우", "해외배우", "국내가수", "해외가수", "국내모델", "해외모델", "스포츠선수", "음악가",
					"예능인", "개그맨", "아나운서", "만화작가", "기타" ],
			[ "국내여행", "일본", "중국", "동남아시아", "미주", "남태평양", "유럽", "인도/아프리카",
					"배낭여행", "호텔/리조트", "항공", "여행일반" ],
			[ "자동차", "축구", "야구", "농구", "배구", "테니스/배드민턴", "골프", "탁구/당구", "수영",
					"마라톤/달리기", "스키/보드", "스케이트", "태권도", "유도/합기도", "씨름/레슬링",
					"복싱", "검도", "체조", "모터스포츠", "올림픽/아시안게임", "자전거", "등산/낚시",
					"스포츠기타" ],
			[ "개/강아지", "고양이", "햄스터", "기니피그", "토끼", "고슴도치", "새/조류", "어류/갑각류",
					"파충류/양서류", "곤충류/거미", "동물병원", "동물보호", "반려동물/동물일반" ],
			[ "수집", "모형", "수공예", "원예", "코스프레", "바둑/장기", "마술", "놀이오락", "이색취미",
					"취미일반" ],
			[ "맛집", "요리", "인테리어", "주거살림", "교통", "생활가전", "생활정보", "운세/풍수지리",
					"중고용품", "생활일반" ],
			[ "의류", "패션잡화", "쥬얼리/액세서리", "명품", "피부관리", "헤어/네일", "화장/향수", "성형",
					"패션/미용일반" ],
			[ "식생활/식습관", "운동", "건강관리/건강식품", "다이어트", "질병/증상", "의료기관", "심리상담",
					"한방/대체의학", "건강/다이어트일반" ],
			[ "결혼", "아동복지/입양", "부부", "임신/출산", "육아/여성", "가족/가족행사", "이민",
					"가족/육아일반" ],
			[ "홈페이지/태그", "프로그래밍언어", "통신/네트워크", "웹디자인/웹기획", "운영체제", "소프트웨어",
					"하드웨어", "멀티미디어", "보안", "무선/모바일", "컴퓨터일반" ],
			[ "영유아교육", "초등학교교육", "중학교교육", "고등학교교육", "대학교육", "특수교육", "직업교육",
					"평생교육", "유학/어학연수", "학원/과외", "시험/자격증", "교육방법/정책", "교육일반" ],
			[ "영어", "일어", "중국어", "프랑스어", "독일어", "스페인어", "러시아어", "이탈리아어",
					"포르투갈어", "기타외국어", "통역/번역" ],
			[ "철학", "역사", "심리학", "수학", "물리학", "화학/화학공학", "지구과학/천문학", "생물학",
					"생명공학", "재료공학", "전기/전자공학", "건축/토목공학", "농림/축산", "의학",
					"인문/과학일반" ],
			[ "증권", "보험", "재테크", "부동산", "세금/세무", "기업/산업", "경영", "광고/마케팅", "무역",
					"취업/창업", "경제동향/경제이론", "경제기관/단체", "경제/금융일반" ],
			[ "법", "행정/민원", "정치/선거", "국제관계/통일", "국방/병역", "환경/재난재해", "복지/인권",
					"사회문화", "정치/사회일반" ],
			[ "시", "소설/인터넷소설", "수필", "희곡/시나리오", "독서/평론", "문학창작", "작가/문인",
					"아동문학", "출판/서점", "외국문학", "문학/창작일반" ],
			[ "초등학교", "중학교", "고등학교", "대학교/대학원", "학원", "동창/동문일반" ],
			[ "띠", "나이/또래", "가족", "군대", "연인/친구", "회사모임", "업종/직종", "동아리/조모임",
					"이색/엽기", "친목/모임일반", "모바일" ],
			[ "가톨릭", "개신교", "불교", "소규모종교", "자원봉사/자선" ] ],
	subSubjectValues : [],
	mainRegionList : [ "서울특별시 ", "경기도 ", "인천광역시 ", "부산광역시 ", "대전광역시 ",
			"대구광역시 ", "울산광역시 ", "광주광역시 ", "강원도 ", "충청북도 ", "충청남도 ", "경상북도 ",
			"경상남도 ", "전라북도 ", "전라남도 ", "제주특별자치도 ", "세종특별자치시 ", "아시아 ", "유럽 ",
			"미주/오세아니아 ", "아프리카" ],
	subRegionList : [
			[ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "금천구, 구로구", "노원구",
					"도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
					"송파구", "양천구", "영등포구", "은평구", "종로구", "중구, 용산구", "중랑구", "전체" ],
			[ "고양시", "과천시", "광명시", "광주시", "구리시, 하남시", "군포시", "김포시", "남양주시",
					"동두천시, 양주시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시, 평택시",
					"안양시", "연천군, 포천시", "오산시", "용인시, 의왕시", "의정부시", "이천시, 여주시",
					"파주시", "화성시", "가평군, 양평군", "전체" ],
			[ "강화군, 서구", "계양구", "남구", "남동구", "동구, 중구", "부평구", "옹진군, 연수구", "전체" ],
			[ "강서구, 사상구", "금정구, 기장군", "남구, 수영구", "동구, 서구", "동래구", "부산진구", "북구",
					"사하구", "연제구", "영도구, 중구", "해운대구", "전체" ],
			[ "대덕구", "동구", "서구", "유성구", "중구", "전체" ],
			[ "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구", "전체" ],
			[ "남구", "동구, 북구", "울주군, 중구", "전체" ],
			[ "광산구", "남구", "동구", "북구", "서구", "전체" ],
			[ "강릉시", "동해시, 삼척시", "속초시, 태백시", "원주시", "춘천시", "고성군, 인제군",
					"정선군, 홍천군", "양구군, 양양군", "영월군, 평창군", "철원군, 화천군", "횡성군", "전체" ],
			[ "제천시", "청주시", "충주시", "괴산군, 증평군", "단양군", "보은군, 청원군", "영동군, 옥천군",
					"음성군, 진천군", "전체" ],
			[ "계룡시, 논산시", "공주시", "보령시, 서산시", "아산시", "천안시", "금산군, 연기군",
					"당진군, 예산군", "부여군, 서천군", "청양군, 홍성군", "태안군", "전체" ],
			[ "경산시", "경주시, 영천시", "구미시", "김천시", "문경시, 상주시", "안동시", "영주시", "포항시",
					"고령군, 성주군", "군위군, 청도군", "봉화군, 영양군", "영덕군, 청송군", "예천군, 의성군",
					"울릉군, 울진군", "칠곡군", "전체" ],
			[ "거제시", "김해시", "밀양시", "양산시", "진주시", "통합창원시", "고성군, 남해군",
					"거창군, 합천군", "사천시, 통영시", "산청군, 함양군", "창녕군", "하동군",
					"함안군, 의령군", "전체" ],
			[ "군산시", "김제시, 정읍시", "남원시", "익산시", "전주시", "고창군, 부안군", "무주군, 장수군",
					"순창군, 임실군", "완주군, 진안군", "전체" ],
			[ "광양시", "나주시", "목포시", "순천시", "여수시", "강진군, 장흥군", "고흥군, 보성군",
					"곡성군, 화순군", "구례군, 광양시", "신안군, 무안군", "영광군, 함평군", "영암군, 해남군",
					"장성군, 담양군", "진도군, 완도군", "전체" ],
			[ "서귀포시", "제주시", "전체" ],
			[ "전체" ],
			[ "필리핀", "홍콩", "베트남", "일본", "중국", "말레이시아", "몰디브", "몽골", "태국",
					"인도네시아", "싱가포르", "기타" ],
			[ "영국", "러시아", "이탈리아", "독일", "스위스", "그리스", "프랑스", "터키", "스페인",
					"포르투갈", "폴란드", "네덜란드", "벨기에", "스웨덴", "덴마크", "핀란드", "체코",
					"기타" ],
			[ "미국", "캐나다", "브라질", "아르헨티나", "멕시코", "페루", "아이티", "호주", "뉴질랜드",
					"기타" ],
			[ "남아프리카공화국", "모로코", "케냐", "나이지리아", "탄자니아", "리비아", "모리셔스", "기타" ]

	],
	subRegionValues : [],
	createCropper: function(imgTag) {
		return new Cropper(imgTag, {
			viewMode:3,
		    zoomable:false,
		    autoCropArea : 0,
			minContainerWidth : 500,
			minContainerHeight : 300,
			minCanvasWidth: 500,
			minCanvasHeight: 300,
			responsive: false,
			background: false,
			minCropBoxWidth : 150,
			minCropBoxHeight : 150,
			data : {
				x : 176, //크로퍼 x 좌표
				y : 76, //크로퍼 y좌표
				width : 150, //크로퍼 가로길이
				height : 150, //키로퍼 새로 길이
			},
		});
	},
	showCafeListByPage : function (pageUi, showDatas, showPageUnit, maxPageCnt, currentPage, lastpageNum) {
		var maxDataSize = showDatas.length;
		var maxPage = (maxDataSize%showPageUnit == 0)? maxDataSize/showPageUnit : maxDataSize/showPageUnit +1;
		maxPage = (maxPageCnt > 10) ? 10 : maxPage;
		
		// 페이지 번호 노출
		for(var i = 0; i < maxPage; i++) {
			pageUi.children[i].style.display="";
			pageUi.children[i].classList.remove("on");
		}
		//selectedTag.classList.add("on");
		if(maxPage < 10) {
			for(var i = maxPage; i < 10; i++) {
				pageUi.children[i].style.display="none";
			}
		}

		var minNum = (lastpageNum - 1) * showPageUnit;
		var totalDatas = lastpageNum * showPageUnit;
		//이전에 노출된 페이지 감춤
		for(var i = minNum ; i < totalDatas; i++) {
			showDatas[i].style.display="none";
		}
		
		//currentPage = parseInt(selectedTag.innerText);
		//마지막 페이지 번호 저장
		//lastpageNum = currentPage;
	
		minNum = (currentPage-1) * showPageUnit;
		totalDatas = currentPage * showPageUnit;
		// 페이지에 따라 보여줄수 있는 데이터 노출 8페이지 단위
		for(var i = minNum ; i < totalDatas; i++) {
			showDatas[i].style="";
		}

	},
	selectCafeListByTab : function(selectedTag, cafeTabs) {
		var lastSelectCafeTab = 0;
		//마지막으로  카페 분류 탭 리스트를 선택한 위치 찾기
		for(var i = 0; i < cafeTabs.length; i++) {
			if(selectedTag.parentNode == cafeTabs[i]) {
				lastSelectCafeTab = i;
				break;
			}
		}
		
		// 선택된 카페 탭 UI 표시
		cafeTabs[lastSelectCafeTab].classList.add("on");
		return lastSelectCafeTab;
	},
	setCafeTabByType : function (path) {
		// 카페홈, 주제별, 지역별에 따라서 카페탭 생성
		var cafeTabContainer = document.getElementsByClassName("scroll_box_swiper")[0];
		/*
		 * 카페탭 생성시 처음 활성화 
		 */
		var cafeTabElement = document.createElement("LI");
		cafeTabElement.classList.add("on");
		var cafeTabBtn = document.createElement("BUTTON");
		cafeTabBtn.classList.add("btn_tab");
		var cafeTabSpan = document.createElement("SPAN");
		cafeTabSpan.innerHTML = "선택됨";
		cafeTabSpan.classList.add("blind");
		cafeTabBtn.appendChild(cafeTabSpan);
		cafeTabElement.appendChild(cafeTabBtn);
		cafeTabContainer.appendChild(cafeTabElement);
		
		if(path.indexOf("/sub_main") > -1) {
			
			cafeTabBtn.innerHTML = "추천카페";
			var mainCafeList = cafe.mainTitleList;
			for(var i = 0; i < mainCafeList.length; i++) {
				cafeTabElement = document.createElement("LI");
				cafeTabBtn = document.createElement("BUTTON");
				cafeTabBtn.innerHTML = mainCafeList[i];
				cafeTabBtn.classList.add("btn_tab");
				cafeTabElement.appendChild(cafeTabBtn);		
				cafeTabContainer.appendChild(cafeTabElement);
			}
		
		} else if(path.indexOf("/sub_theme") > -1) {
			cafeTabBtn.innerHTML = "게임";
			var mainCafeList = cafe.mainTitleList;
			for(var i = 1; i < mainCafeList.length; i++) {
				cafeTabElement = document.createElement("LI");
				cafeTabBtn = document.createElement("BUTTON");
				cafeTabBtn.innerHTML = mainCafeList[i];
				cafeTabBtn.classList.add("btn_tab");
				cafeTabElement.appendChild(cafeTabBtn);		
				cafeTabContainer.appendChild(cafeTabElement);
			}
			cafe.setSubListByType('theme', 0, mainCafeList[0]);
		} else if (path.indexOf("/sub_area") > -1) {
			cafeTabBtn.innerHTML = "서울특별시";
			var mainRegionList = cafe.mainRegionList;
			for(var i = 1; i < mainRegionList.length; i++) {
				cafeTabElement = document.createElement("LI");
				cafeTabBtn = document.createElement("BUTTON");
				cafeTabBtn.innerHTML = mainRegionList[i];
				cafeTabBtn.classList.add("btn_tab");
				cafeTabElement.appendChild(cafeTabBtn);		
				cafeTabContainer.appendChild(cafeTabElement);
			}
			//cafe.setSubListByType('area', 0, mainRegionList[0]);
		}
		// return {"lastSelectCafeTab" : 0, "selected" : 0}; 
	},
	setSubListByType : function (type, mainListPos, firstname) {
		
		// 서브 카테고리 리스트 UI 생성
		var subList = cafe.subTitleList[mainListPos]; 
		document.getElementsByClassName("btn_category")[0].innerHTML = firstname;
		
		var subCafeTab = document.getElementsByClassName("layer_list")[0]; 
		subCafeTab.innetHTML = "";
		var cafeTabElement = document.createElement("LI");
		cafeTabElement.classList.add("on");
		cafeTabBtn = document.createElement("BUTTON");
		cafeTabBtn.classList.add("btn");
		cafeTabBtn.innerHTML = firstname;
		var cafeTabSpan = document.createElement("SPAN");
		cafeTabSpan.innerHTML = "선택됨";
		cafeTabSpan.classList.add("blind");
		cafeTabBtn.appendChild(cafeTabSpan);
		cafeTabElement.appendChild(cafeTabBtn);
		subCafeTab.appendChild(cafeTabElement);
		
		for(var i = 0; i < subList.length; i++) {
			cafeTabElement = document.createElement("LI");
			cafeTabBtn = document.createElement("BUTTON");
			cafeTabBtn.innerHTML = subList[i];
			cafeTabBtn.classList.add("btn");
			cafeTabElement.appendChild(cafeTabBtn);		
			subCafeTab.appendChild(cafeTabElement);
		}
		
	
	},
	checkTextByte : function (value, strongTag, validTag, alertTag, limit) {
		var result = false;
		//카페 이름
		//charset= utf8이기 떄문에 utf8 기준으로 byte 계산
		textLength = value.length;
		var byte = 0;
		if(textLength == 0) {
			strongTag.innerText = byte;
			validTag.classList.add("invalid");
		}
		
		// 키를 뗴고 나서 byte 계산
		for(var i = 0; i < textLength; i++) {
			byte += common.calUtf8Bytes(value.charAt(i));
		}
		
		if(byte > limit) {
			alertTag.style = "";
			validTag.classList.add("invalid");
		}else {
			alertTag.style = "display:none";
			validTag.classList.remove("invalid");
			result = true;
		}
		strongTag.innerText = byte;
		return result;
	
	},
	addOption : function (optList, idx, value, label) {
		var opt = document.createElement('option');
		opt.value = value;
		opt.label = label;
		optList[idx] = opt;
	},
	recommend_slider : function (idx) {
		// slider 이전/다음으로 이동시킬떄 ui에서 움직일 위치값
		var value= 0;

		/*
		 * 공식찾기
		 * 
		 * index 0 - 1 
		 * 662
		 * index 1 - 2
		 * 667
		 * index 2 - 3
		 * 695
		 * 
		 */
		switch (idx) {
			case 1:
				value = 662;
				break;
			case 2:
				value = 667;
				break;
			case 3:
				value = 695;
				break;
			default:
				break;
		}
		
		return value;
	},
	addKeyword : function (keyword,idx) {
		var p = document.createElement('p');
		p.innerHTML = keyword;
		//p.innerHTML = keyword.replace(/\s+/g, '');
		//keywordList[idx].appendChild(p);
		
		//a tag 추가
		var a = document.createElement('a');
		a.href = 'javascript:void(0);';
		a.classList.add('btn_del');
		var img = document.createElement('img');
		img.src = "https://cafe.pstatic.net/img/section/btn_del3.gif";
		img.width = 5;
		img.height = 6;
		img.alt = "삭제";
		img.classList.add('img_del');
		a.appendChild(img);
		return {"p": p, "a" : a};
	},
	obj : function(tag, clsList, name, id, title, type, style, value, disabled, cols, rows) {
		return {
			"tag" : tag,
			"clsList" : clsList,
			"name" : name,
			"id" : id,
			"title" : title,
			"type" : type,
			"style" : style,
			"value" : value,
			"disabled" : disabled,
			"cols": cols,
			"rows": rows
		};
	},
	setTagAttr : function(obj) {

		var tags = obj.tag;
		// tag가 없다면 생성하지 않음
		if (tags == null) {
			return;
		}

		var length = tags.length;
		for (var i = 0; i < length; i++) {
			var tagName = tags[i].tagName;
			
			
			switch (tagName) {
				case "INPUT":
					tags[i].type = obj.type[i];
					tags[i].disabled = obj.disabled[i];
					
					break;
				case "TEXTAREA":
					tags[i].rows = obj.rows[i];
					tags[i].cols = obj.cols[i];
					break;
				default:
					break;
			}
			
			tags[i].name = obj.name[i];
			tags[i].id = obj.id[i];
			tags[i].style = obj.style[i];
			tags[i].value = obj.value[i];
			var clsLength = obj.clsList[i].length;
			for (var j = 0; j < clsLength; j++) {
				tags[i].classList.add(obj.clsList[i][j]);
			}

		}

	},
	getCafeList : function(path) {
		/*
		 * 카페 UI에서 페이지를 보여줄떄는
		 * 전체 보여주는거 빼고는 페이지수는 정해져잇음
		 * detailShowDataType = 페이지당 노풀시킬 테이터 타입 
		 * 1. 카페홈에서 탭을 누를때  1-8페이지까지 (10개씩)
		 * 2. 주제별,지역별 1- 6페이지  (20개씩)
		 * 3. 주제별,지역별 전체를 누를경우. (전부)
		 * 
		 * request담을 데이터 타입 : cafeForm을 형성
		 */
		var cafeForm = {};
		var cafeVO = {};
		if(path.indexOf("/sub_main") > -1 ) {
			cafeVO.title_mainSort = cafe.baseParam.lastSelectCafeTab;
			// UI나타나는 페이지번호 최소값
			cafeForm.showDataListCount = 10;
			cafeForm.showPageNumCount = 8;
			/*
			 * UI에 나타나는최대 페이지 카운트: 8 (기본)
			 * 하지만 서버상에 데이터에서 최대 페이지 카운트가 8보다 작으먄 변경됨
			 */
			// cafeForm.maxPageCount = 8; 
		} else if (path.indexOf("/sub_theme") > -1) {
			cafeVO.title_mainSort = cafe.baseParam.lastSelectCafeTab;
			// UI나타나는 페이지번호 최소값
			cafeForm.showDataListCount = 20;
			cafeForm.showPageNumCount = 6;
			/*
			 * UI에 나타나는최대 페이지 카운트: 6 (기본)
			 * 하지만 서버상에 데이터에서 최대 페이지 카운트가 6보다 작으먄 변경됨
			 */
			// cafeForm.maxPageCount = 6;
		} else if (path.indexOf("/sub_area") > -1) {
			cafeVO.region_mainSort = cafe.baseParam.lastSelectCafeTab;
			cafeForm.showDataListCount = 20;
			cafeForm.showPageNumCount = 6;
			/*
			 * UI에 나타나는최대 페이지 카운트: 6 (기본)
			 * 하지만 서버상에 데이터에서 최대 페이지 카운트가 6보다 작으먄 변경됨
			 */
			// cafeForm.maxPageCount = 6;
		}
		cafeForm.showPageMinimumCount = cafe.baseParam.showPageMinimumCount;
		cafeForm.selectedPageNum = cafe.baseParam.selectedPageNum;
		cafeVO.baseParam = cafe.baseParam; 
		cafeForm.cafeVO = cafeVO;
        
		var json = JSON.stringify(cafeForm);
    	document.location.hash = "cafeBoard:"+path+":"+CryptoJS.AES.encrypt(json, "test").toString();

	},
	afterCafeProcess : function (cafeForm, requestParam) {
		
		/*
		 * afterCafeProcess 
		 * 히스토리에 있는 비동기 요청들의 UI를 구현하기 위해 만든 로직
		 * (cafeList,cafeTab,cafeSlider)
		 */
		// 페이지 wrapper에 페이지 번호를 그려낸다.
		var pageUI = document.getElementsByClassName("common_page")[0];
	
		// request 요청에 의한 cafeTab 표시
		var cafeTabs = document.getElementsByClassName("scroll_box_swiper")[0].getElementsByTagName("li");
		for(var i = 0; i < cafeTabs.length; i++) {
			cafeTabs[i].classList.remove("on");
		}
		
		/*
		 * 선택된 카페 탭 UI 표시
		 * 앞으로가기/뒤로가지 하였을때 lastGetRecommendSliderIdx값이 다르면 변경
		 */
		requestBaseParam = requestParam.cafeVO.baseParam;
		// 현재 페이지 sliderIdx값 과 url 변경시 sliderIdx값으로 슬라이더 변경됨을 파악하기 
		var sliderInfo = cafe.baseParam.lastGetRecommendSliderIdx - requestBaseParam.lastGetRecommendSliderIdx;
		if (sliderInfo != 0) {
			/*
			 * 좌우 화살표 클릭시 탭이 이동후, 데이터를 서버에 전달하여 비동기로 호출한다.
			 * sliderInfo (-): 오른쪽
			 * sliderInfo (+): 왼쪽
			 */
			var btn_scroll_next = document.getElementsByClassName("btn_scroll_next")[0];
			var btn_scroll_prev = document.getElementsByClassName("btn_scroll_prev")[0];
			var scrollTag = cafeTabs[0].parentElement; 
			var translateInfo = parseInt(scrollTag.style.transform.replace(/[^-^\d.]/g, ''));
			scrollTag.style.transform = "translateX("+requestBaseParam.translateInfo +"px)";
			
			/* 좌우 화살표를 누른후 데이터 추출을 위한 데이터 설정
			 * idx 0(0) : 좌측 버튼 비활성화 > 추천 카페에 해당하는 카페 리스트  출력  
			 * 	   1(7) : 좌측,우측 활성화   > 영화에 해당하는 카페리스트 출력
			 *     2(14) : 좌측,우측 활성화   > 건강/다이어트에 해당하는 카페리스트 출력
			 *     3(21) : 우측 버튼 비활성화  > 스포츠 레저 에 해당하는 카페리스트 출력
			 */
			switch (requestBaseParam.lastGetRecommendSliderIdx) {
				case 0:
					btn_scroll_prev.disabled = true;
					// cafe.baseParam.lastSelectCafeTab = 0;
					break;
				case 1:
				case 2:
					btn_scroll_prev.disabled = false;
					btn_scroll_next.disabled = false;
					break;
				case 3:
					btn_scroll_next.disabled = true;
					break;
				default:
					break;
			}
			cafeTabs[requestParam.cafeVO.baseParam.lastSelectCafeTab].classList.remove("on");
		} 
		
		cafe.baseParam.translateInfo = requestBaseParam.translateInfo;
		cafe.baseParam.lastGetRecommendSliderIdx = requestBaseParam.lastGetRecommendSliderIdx;
		cafe.baseParam.lastSelectCafeTab = requestParam.cafeVO.baseParam.lastSelectCafeTab;
		cafeTabs[cafe.baseParam.lastSelectCafeTab].classList.add("on");
		
		//common_list (ul) 내부 cafe data(li) 태그에 집어넣기
		// 끝난후, 카페리스트 결과 UI를 보여준다.
		var cafeListWrapper = document.getElementsByClassName("common_list")[0];
		// 카페 데이터 리스트 초기화
		cafeListWrapper.innerHTML ='';
		var cafedataList = cafeForm.showCafeList;
		if (cafedataList == null) {
			pageUI.innerHTML="";
			return;
		}
		var cafeDataSize = cafedataList.length;
		
		// 카페 데이터가 없을떄
		if (cafeDataSize == 0) {
			pageUI.innerHTML="";
			return;
		}
		
		// 결과 리스트 만큼 데이터 생성
		for (var i = 0; i < cafeDataSize; i++) {
			var cafeResult = cafedataList[i].cafe;
			var cafeDataWrapper = document.createElement('li');
			cafeDataWrapper.innerHTML = cafe.cafedataForm;
			// 카페 url
			cafeDataWrapper.getElementsByClassName("list_link")[0].href = "/board/" + cafeResult.url;
			// 카페이름
			cafeDataWrapper.getElementsByClassName("name")[0].textContent = cafeResult.name;
			// 카페 이미지
			cafeDataWrapper.getElementsByTagName("img")[0].src = "/" + cafeResult.icon;
			// 카페 대표인지 체크
			if(cafedataList[i].cafeOfficial == 1) {
				cafeDataWrapper.getElementsByClassName("common_icon_box")[0].display = '';
			}
			// 카페 설명
			cafeDataWrapper.getElementsByClassName("txt")[0].textContent = cafeResult.desc;
			// 카페 멤버수
			cafeDataWrapper.getElementsByClassName("info")[0].textContent = "멤버 " + cafeResult.memberCnt + "명";
			cafeListWrapper.appendChild(cafeDataWrapper);
		}
		
		/*
		 * 페이지 번호 구현
		 */
		pageUI.innerHTML = "";
		var min = cafe.baseParam.showPageMinimumCount;
		cafe.baseParam.selectedPageNum = requestBaseParam.selectedPageNum;
		
		// 선택된 페이지 번호
		// 총 페이지 갯 수에 따라 페이지 번호 UI 보여줌
		for (var i = min; i < cafeForm.showPageMaximumCount; i++) {
			var pageNumber = document.createElement("button");
			pageNumber.classList.add("btn");
			pageNumber.classList.add("btn_pageNum");
			pageNumber.textContent = i;
			// 선택된 페이지에는 강조 표시
			if (i == cafe.baseParam.selectedPageNum) {
				pageNumber.classList.add("on");
				var span = document.createElement("span");
				span.classList.add("blind");
				span.textContent = "선택됨";
				pageNumber.appendChild(span);
			}
			pageUI.appendChild(pageNumber);
		}

	},
	baseParam : {
		// 마지막으로 선택한 카페 탭 위치
		lastSelectCafeTab : 0,
		// 마지막으로 누른 슬라이더 idex [0,1,2,3]
		lastGetRecommendSliderIdx : 0,
		// 마지막으로 선택한 페이지 번호
		lastpageNum : 1,
		// UI나타나는 페이지번호 최소값
		// UI에서 보여줄 페이지에서 화살표 및 더보기를 누를경우 이값이 갱신된다.
		showPageMinimumCount: 1,
		// 선택된 페이지 번호
		selectedPageNum: 1,
		// 마지막으로 바뀐 transfor변경값
		translateInfo: 0
	},
	cafedataForm : 
		// li 태그는 따로 만들어서 string 집어 넣는 방식으로 작업
		"<a href='/board/#{카페URL}' class='list_link'>"+
			"<div class='list_thumb'>" +
				"<img src='/#{아이콘 경로}' width='80' height='80' onerror='this.src=https://ssl.pstatic.net/static/cafe/thumb/cafe_thumb_noimg_116.svg' alt=''>"+
			"</div>" +
			"<div class='list_info'>" +
				"<div class='name_area'>" +
					"<strong class='name'>#{카페이름}</strong>" +
					"<div class='common_icon_box' style='display:none;'>" +
						// 대표 카페 표시가 있는 경우
						"<em class='icon-powercafe'>" +
							"<span class='blind'>대표카페</span>" +
						"</em>" +
					"</div>" +
				"</div>" +
				"<div class=txt_area>" +
					"<p class='txt'>#{카페설명}</p>" +
				"</div>" +
				"<div class='info_area'>" +
					"<span class='info'>멤버 #{카페수}명</span>" +
				"</div>" +
			"</div>" +
		"</a>",
	init : function() {

		var path = window.location.pathname.substring(window.location.pathname
				.indexOf("/", 2));

		// cafe 상위 메뉴 UI에서 카페홈/ 주제별/ 지역별/ 랭킹/  공통 기능
		// ui a 태그의 href 부분과 상위 변수 'path'가 포함되면 색깔 변하게 처리
		var cafe_top_list = document.getElementsByClassName("lnb_link");
		
		for(var i = 0; i < cafe_top_list.length; i++) {
			var href = cafe_top_list[i].href;
			var li = cafe_top_list[i].parentElement;
			if(href.indexOf(path) > -1) {
				li.classList.add("on");
				var span = document.createElement("span"); 
				span.classList.add('blind');
				span.innerText = "선택됨";
				li.append(span);
				break;
			}
		}
	
		var container = document.getElementById("container");
		var bodyTag = document.getElementById("content");
		
		/*
		 * 카페 메인 , 카페 주제 , 카페 지역 공통 기능 추가
		 * 1. 카페탭 생성
		 * 2. 카페탭에 따라 서버에서 카페 리스트 정보 호출하기 비동기
		 */
		if(path.indexOf("/sub_main") > -1 || path.indexOf("/sub_theme") > -1 || path.indexOf("/sub_area") > -1) {
			var registerUi = document.getElementsByClassName("btn_cafe_make")[0];
			registerUi.href = "/cafe/register";
			
			// 페이지 UI 랩퍼
			var pageUi = document.getElementsByClassName("common_page")[0]; 
			//추천 카페탭 
			var cateTabs = document.getElementsByClassName("scroll_box_swiper")[0].getElementsByTagName("li");
			cafe.setCafeTabByType(path);
			
			// cafe.baseParam.lastSelectCafeTab = 0;
			//var lastOpenCafeIdx = 0;
			// 마지막으로 누른 슬라이더 idex [0,1,2]
			// cafe.baseParam.lastGetRecommendSliderIdx = 0;
			// 마지막으로 선택한 페이지 번호
			// cafe.baseParam.lastpageNum = 1;
			// 메인에서 카페버튼누르면 서버에서 페이지 렌더링후 또한번 비동기로 카페탭에 있는 리스트 호출
			cafe.getCafeList(path);
			bodyTag.addEventListener('click', function(event) {

				// 추천 카페 분류 이전,이후 버튼 
				var selectedTag = event.target;
				var btn_scroll_next = document.getElementsByClassName("btn_scroll_next")[0];
				var btn_scroll_prev = document.getElementsByClassName("btn_scroll_prev")[0];
				// 일반카페탭 클릭시 이벤트
				if (selectedTag.parentNode.parentNode.classList.contains("scroll_box_swiper")) {
					// 추천 카페 카테고리의 버튼 tag의 어머니 태그중 'scroll_box_swiper' 가 존재시 이벤트 진행
					var selected_title_mainSort = selectedTag.textContent.trim();
					// 추천 카페 탭에서 클릭시 해당 주제에 대한 카페리스트호출
					cateTabs[cafe.baseParam.lastSelectCafeTab].classList.remove("on");
					
					// 카페 탭에서 선택후 해당 데이터 리스트 추출 (페이징 포함)
					cafe.baseParam.lastSelectCafeTab = cafe.selectCafeListByTab (selectedTag, cateTabs);
					// 페이지 번호 초기화
					cafe.baseParam.selectedPageNum = 1;
					cafe.getCafeList(path);
					
				} else if (selectedTag.parentNode.classList.contains("common_box_tab")) {
					// 비동기에서 cafeTabSlider 기능을 사용하지 못하기 때문에 처리가 필요
					// 좌우 화살표 클릭시 탭이 이동후, 데이터를 서버에 전달하여 비동기로 호출한다.
					// 카페탭들의 부모 태그
					// 화살표 태그에 따라 카페탭 UI 변경 기능
					var scrollTag = cateTabs[0].parentElement; 
					
					// 화살표 태그에 따라 카페탭 UI 변경 기능
					if(selectedTag.className == btn_scroll_next.className) {
						//translateX(0px); 이런 형태를 숫자로 반환
						var translateInfo = parseInt(scrollTag.style.transform.replace(/[^-^\d.]/g, ''));
						cafe.baseParam.lastGetRecommendSliderIdx++;
						translateInfo -=cafe.recommend_slider(cafe.baseParam.lastGetRecommendSliderIdx);
					} else if (selectedTag.className == btn_scroll_prev.className ) {
						var translateInfo = parseInt(scrollTag.style.transform.replace(/[^-^\d.]/g, ''));
						translateInfo +=cafe.recommend_slider(cafe.baseParam.lastGetRecommendSliderIdx);
						cafe.baseParam.lastGetRecommendSliderIdx--;
					}
					cafe.baseParam.translateInfo = translateInfo;
					scrollTag.style.transform = "translateX("+translateInfo +"px)";
					
					// 좌우 화살표를 누른후 데이터 추출을 위한 데이터 설정
					// idx 0(0) : 좌측 버튼 비활성화 > 추천 카페에 해당하는 카페 리스트  출력
					// 	   1(7) : 좌측,우측 활성화   > 영화에 해당하는 카페리스트 출력
					//     2(14) : 좌측,우측 활성화   > 건강/다이어트에 해당하는 카페리스트 출력
					//     3(21) : 우측 버튼 비활성화  > 스포츠 레저 에 해당하는 카페리스트 출력
					switch (cafe.baseParam.lastGetRecommendSliderIdx) {
						case 0:
							btn_scroll_prev.disabled = true;
							cateTabs[cafe.baseParam.lastSelectCafeTab].classList.remove("on");
							cafe.baseParam.lastSelectCafeTab = 0;
							cateTabs[0].classList.add("on");
							break;
						case 1:
							btn_scroll_prev.disabled = false;
							btn_scroll_next.disabled = false;
							cateTabs[cafe.baseParam.lastSelectCafeTab].classList.remove("on");
							break;
						case 2:
							btn_scroll_prev.disabled = false;
							btn_scroll_next.disabled = false;
							cateTabs[cafe.baseParam.lastSelectCafeTab].classList.remove("on");
							break;
						case 3:
							btn_scroll_next.disabled = true;
							cateTabs[cafe.baseParam.lastSelectCafeTab].classList.remove("on");
							break;
		
						default:
							break;
					}
					cafe.baseParam.lastSelectCafeTab = cafe.baseParam.lastGetRecommendSliderIdx * 7;
					cateTabs[cafe.baseParam.lastSelectCafeTab].classList.add("on");
					cafe.getCafeList(path);
				} else if (selectedTag.classList.contains("btn_pageNum")) {
					// 페이지 버튼 눌렀을때 서버로 부터 데이터 리스트 호출
					// 1. 서버로 데이터 전송
					// 2. 전송후, 데이터 처리페이지 처리
					cafe.baseParam.selectedPageNum = parseInt(selectedTag.textContent);
					cafe.getCafeList(path);
				}
			});
			
			
		}
		
			
		if(path.indexOf("/sub_theme") > -1) {
			var btn_category = document.getElementsByClassName("btn_category")[0];
			var isSubListHover = false;
			/*
			 * 이벤트 발생순
			 * container [화면전체] -> btn_category[주제화면 버튼] -> btn_category.nextElementSibling [부 주제 리스트]
			 */
			//주제 , 지역에 필요한 이벤트 등록
			btn_category.addEventListener('mouseover', function(event) {
				btn_category.classList.add("on");
				btn_category.nextElementSibling.style.display = "";
			},true);
			btn_category.nextElementSibling.addEventListener('mouseover', function(event) {
				btn_category.classList.add("on");
				btn_category.nextElementSibling.style.display = "";
			},true);
			container.addEventListener('mouseover', function(event) {
				btn_category.classList.remove("on");
				btn_category.nextElementSibling.style.display = "none";
			},true);
			
		} else if (path.indexOf("/sub_main") > -1) {
			// 이벤트 리스너 추가

			//cafe 개별 정보 INFO
			// 1. 카페홈/주제별/지역별/랭킹/대표카페/내소식/채팅 기능
			// 2. Editor pick 기능
			// 3. 내 카페 새글 피드 기능
			// 4. 전체/ 즐겨찾는 카페/ 운영카페 클릭스 해당 카페 리스트 뿌리기
			
			// 1. 카페홈/주제별/지역별/랭킹/대표카페/내소식/채팅 기능
			// 내가 가입하거나 만든 카페들의 갯수가 5개 단위로 보여주며, 그 이후로는 숨긴다.
			var user_cafe_container = document.getElementsByClassName("user_mycafe_container");
			var user_cafe_container_length = user_cafe_container.length;
			if (user_cafe_container_length == 0) {
				return;
			}
			// 내가 가입한 카페 노출
			user_cafe_container[0].style.display="";
			var more_show_user_idx = 1;
			
			
			// 4. 전체/즐겨찾는 카페/운영카페 클릭스 해당 카페 리스트 뿌리기
			var myCafeType = document.getElementsByClassName("common_option_list")[0].getElementsByTagName("li");
			//var bodyTag = document.getElementById("content");
			// 나의 카페 정보를 보여주는 큰 덩어리 
			var user_mycafe_area = document.getElementsByClassName("user_mycafe_area");
			var user_mycafe_area_size =user_mycafe_area.length;
			var btn_mycafe_more = document.getElementsByClassName("btn_mycafe_more")[0];
			
			// 5. 추천 카페 뿌리기.
			bodyTag.addEventListener('click', function(event) {

				var selectedTag = event.target;
				var myCafeTypeSize = myCafeType.length;
				
				/*
				 * 전체: 나의 카페 모든걸 공개 [카페 더보기 가능]
				 * 즐겨 찾기: 즐겨찾기만 공개  [카페 더보기 불가능]
				 * 운영진 : 운영진만 공개 [카페 더보기 불가능]
				 * 카페의 큰 덩어리: user_mycafe_area
				 */
				if(myCafeType[0].firstElementChild == selectedTag) {
					// 전체보기 탭인경우 카퍼 더보기 기능 초기화
					more_show_user_idx = 1;
					for(var i = 1; i < user_cafe_container_length; i++) {
						user_cafe_container[i].style.display="none";
					}
					btn_mycafe_more.style = "";
					
					
					for (var k = 0; k <myCafeTypeSize; k++) {
						myCafeType[k].classList.remove("on");
					}
					myCafeType[0].classList.add("on");
					
					for (var i = 0; i < user_mycafe_area_size; i ++) {
						user_mycafe_area[i].style ="";
					}
					
				} else if (myCafeType[1].firstElementChild == selectedTag) {
					btn_mycafe_more.style.display = "none";
					
					for (var k = 0; k <myCafeTypeSize; k++) {
						myCafeType[k].classList.remove("on");
					}
					
					myCafeType[1].classList.add("on");
					
					for (var i = 0; i < user_mycafe_area_size; i ++) {
						user_mycafe_area[i].style ="";
						// 나의 카페 리스트에서 즐겨찾기 시에 추가되는 class가 없다면 감춘다.
						var cafeFav = user_mycafe_area[i].getElementsByClassName("info_area")[0];
						if (!cafeFav.firstElementChild.classList.contains("on")) {
							user_mycafe_area[i].style.display ="none";
						}
					}
				
				} else if (myCafeType[2].firstElementChild == selectedTag) {
					btn_mycafe_more.style.display = "none";
					
					for (var k = 0; k <myCafeTypeSize; k++) {
						myCafeType[k].classList.remove("on");
					}
					myCafeType[2].classList.add("on");
					
					for (var i = 0; i < user_mycafe_area_size; i ++) {
						// 나의 카페중 운영자일떄 새성되는 클래스가 존재하는지 체크후 없다면 감춤
						user_mycafe_area[i].style ="";
						var cafeFav = user_mycafe_area[i].getElementsByClassName("icon_manager");
						if (cafeFav === undefined || cafeFav.length == 0) {
							user_mycafe_area[i].style.display ="none";
						}
					}
				} else if (selectedTag.classList.contains("user_mycafe_bookmark")) { 
					//이미 즐겨찾기 상태일떄는 즐켜찾기 해제가 되고
					// 즐켜찾기 아닌 상태일떄는 즐찾기됨
					if(!selectedTag.classList.contains("on")) {
						selectedTag.classList.add("on");
					} else {
						selectedTag.classList.remove("on");
					}
					
				} else if(selectedTag.classList.contains("btn_mycafe_more")) {
					//카페 더보기를 눌렀을떄 추가 카페를 보여준다 (5개씪)
					user_cafe_container[more_show_user_idx].style="";
					more_show_user_idx ++;
					
					//만약 더 보여줄 카페가 없다면 카페 더보기버튼을 감춘다
					if(more_show_user_idx == user_cafe_container_length) {
						selectedTag.style.display = "none";
						return;
					} 
				}
			});
			
				
		} else if (path == "/register" || path == "/register/") {
			// 카페 생성 UI
			// cafe 생성 > form tag로 추가
			// 카페이름 , 카페주소는, 카페 설명 상위태그 검색
			var input_areas = document.getElementsByClassName("input_area");
			var classList = [ 'input_txt', 'spot_off' ];
			var result = {};
			
			/*
			 * tag, clsList, name, id, title, type, style, value, disabled, cols, rows
			 * 태그에 필요한 노드 생성 주소 태그에 필요한 속성 추가
			 */
			var inputAttrs = cafe.obj(
					[input_areas[0].getElementsByTagName("input")[0],
					input_areas[1].getElementsByTagName("input")[0],
					input_areas[2].getElementsByTagName("textarea")[0]], 
					[[ 'input_txt', 'spot_off' ], [ 'input_txt', 'spot_off' ], ['input_txt3'] ],
					[ 'name', 'url', 'desc' ], 
					[ null, null, null ], 
					[ '카페이름', '카페주소', '카페설명' ], 
					['text', 'text', null],
					[ 'width: 631px', 'width: 500px', null], 
					[ null, null, null], 
					[false, false, null],
					[null, null, 30],
					[null, null, 5]
			);

			
			
			cafe.setTagAttr(inputAttrs);

			// tag, clsList, name, id, title, type, style, value
			// 공개 여부, 가입 방식, 별명 사용, 카페 멤버 노출 여부
			var txt_areas = document.getElementsByClassName("txt_area");

			var changeSets = {};
			changeSets.name = [[], ["joinType", "joinType"], [], [ "useNickname", "useNickname" ], [ "showMember", "showMember" ]];
			changeSets.id = [[], ["join_nosign", "join_sign"], [], ["use_nick", "use_name"], ["showMember", "showMember"]];
			changeSets.value = [[], [0, 1], [], [0, 1], [1, 0]];
			changeSets.disabled = [[], [false, false], [], [false, false], [false, false]];
			
			for(var i = 0; i < 5; i++) {
				
				if( i == 2) {
					continue;
				}
				var inputs = txt_areas[i].getElementsByTagName("input");
				
				if(i == 0) {
					inputAttrs = cafe.obj(inputs, 
							[[ "input_rdo" ], [ "input_rdo" ] ], 
							[ "usePrivate", "usePrivate" ], 
							[ "open1", "close1" ], 
							[ null, null ], 
							['radio', 'radio' ], 
							[ null, null ],
							[ 1, 0 ], [ false, false ]);
				} else {
					inputAttrs = Object.create(inputAttrs);
					inputAttrs.tag = inputs;
					inputAttrs.name = changeSets.name[i];
					inputAttrs.id = changeSets.id[i];
					inputAttrs.value = changeSets.value[i];
					inputAttrs.disabled = changeSets.disabled[i];
				}
				cafe.setTagAttr(inputAttrs);
			}

						
			/*
			 * <주제: 대분류 소분류>
			 * <지역: 대분류 소분류>
			 * 
			 * 기능들은 rel class로 wrapping 되어잇음
			 * select[4] 가있는데
			 * 0,1 = subject / 2,3 = region
			 */
			var selectWrap = document.getElementsByClassName("rel")[0];
			var subject_region = selectWrap.getElementsByTagName("select");
			
			var selectSize = subject_region.length;
			// 주제, 지역 대분류 options 추기
			for (var i = 0; i < selectSize; i++ ) {
				
				//주제 소분류 / 지역 소분류는 추가하지 않느다.
				if(i==1 || i==3) {
					continue;
				}
				
				//주제 대분류일댸 기본 데이터값
				var optionList = cafe.mainTitleList;
				var defaultOptionVal = 100;
				var subOptList = cafe.subTitleList;
				var subOpValtList = cafe.subSubjectValues;
				//지역 대분류일떄 기본 데이터값
				if(i == 2) {
					optionList = cafe.mainRegionList;
					defaultOptionVal = 1100;
					subOptList = cafe.subRegionList;
					subOpValtList = cafe.subRegionValues;
				}
				// 대분류 소분류 values값 추가한다.
				var optionSize  =  optionList.length;
				for(var j = 0; j < optionSize; j++) {
					cafe.addOption(subject_region[i].options, j+1, j+1, optionList[j]);
				}
				
				// subSubjectValues, subRegionValues
				// 대분류 option 클릭시 그에 따른 소분류 value 값 저장
				optionSize  =  subOptList.length;
				// subOptList [][] 이중 배열로 구성되어있는 상태
				for (var j = 0; j < optionSize; j++) {
					var subOptionSize =  subOptList[j].length;
					var subOptionValue = [];
					for (var k = 0; k < subOptionSize; k++) {
						subOptionValue.push(defaultOptionVal);
						defaultOptionVal++;
					}
					//소분류 데이터 value 리스트 저장
					subOpValtList.push(subOptionValue);
				}
				
			}
			
			
			/*
			 * 주제,지역 대분류를 클릭할때마다 소분류를 동적으로 바인딩하기 
			 * select[0]에 있는 option 클릭시 select[1] options추가
			 * select[2]에 있는 option 클릭시 select[3] options추가
			 */
			selectWrap.addEventListener('change', function(event) {
				var selecgtedTag = -1;
				// 선택된 select tag  찾기
				for (var i = 0; i < selectSize; i++) {
					if(event.target == subject_region[i]) {
						selecgtedTag = i;
						break;
					}
				}
				
				//주제, 지역 대분류 선택시, 소분류 옵션 추가
				if(selecgtedTag == 0 || selecgtedTag == 2 ) {
					var optionsList = event.target.options;
					// 대분류 선택을 클릭했을떄는 처리하지 않는다.
					console.log(optionsList.selectedIndex);
					if(optionsList.selectedIndex == 0 ) {
						return;
					}
					// 소분류 데이터 호출 로직
					var subOptionList = (selecgtedTag == 0)? cafe.subTitleList[optionsList.selectedIndex - 1] : cafe.subRegionList[optionsList.selectedIndex - 1];
					var subOptionValueList = (selecgtedTag == 0)? cafe.subSubjectValues[optionsList.selectedIndex - 1] : cafe.subRegionValues[optionsList.selectedIndex - 1];
					var subOptionSize = subOptionList.length;
					
					// option tag 초기화
					subject_region[selecgtedTag+1].innerHTML = '';
					cafe.addOption(subject_region[selecgtedTag+1].options, 0, -1, "소분류 선택");
				
					for (var i = 0 ; i < subOptionSize; i++) {
						cafe.addOption(subject_region[selecgtedTag+1].options, i+1, subOptionValueList[i], subOptionList[i]);
					}
					
				}
				
			});

			var imgTag = document.getElementsByClassName("thmb")[0].getElementsByTagName("img")[0];
			imgTag.width=114;
			imgTag.height=114;
			imgTag.alt="이미지를 등록하세요";
			imgTag.src="https://ssl.pstatic.net/static/cafe/thumb/make_cafe_thumb_default.png";
			imgTag.style = "border-radius:40px";
			// btn_srch > 사진 등록, 삭제 , 선택영역저장, 전체영역 저장...
			var buttonTag = document.getElementsByClassName("btn_srch");
			
			// 등록/취소
			var buttonTag2 = document.getElementsByClassName("btn");
			
			/*
			 * 키워드 등록 UI 이벤트 등록시 필요 변수
			 */
			var keywordIdx = 0;
			var keywordValList = [];
			var keyword = document.getElementById("cafeKeywordArea");
			result["keywordList"] = keywordValList; //default
			
			/*
			 * 파일 업로드 버튼 uI 
			 */
			
			var upLoadTag = document.getElementsByClassName("int_file")[0];
			var showImg = document.getElementById("tmp_img");
			var img_name = document.getElementsByClassName("img_name");
		    /*
		     * cropper
		     */
			var cropper = cafe.createCropper(showImg);
			var imgWidth,imgHeight;
			
			
			/*
			 * 키워드에 태그
			 */
			var keywordTag = document.getElementsByName("cafeKeyword")[0];
			
			
			// 바디로 부터 이벤트를 등록하게 하기
			var bodyTag = document.getElementsByClassName("section_create")[0];
			bodyTag.addEventListener('click', function(event) {
				var selected = event.target;
				var tagByCls = document.getElementsByClassName(event.target.className);
				var keywordList = keyword.getElementsByTagName("li");
				

				//등록하고자하는 이벤트를 찾음
				if(selected == buttonTag[0]) {
					// 검색어를 등록하면 > 검색어 하단 UI 추가함
					// 검색어 등록 버튼 class 일떄 이벤트 등록
						var value = keywordTag.value;
						
						if(keywordTag.classList.contains('invalid')) {
							alert("키워드 입력 길이 초과입니다.");
							return;
						}
						
						if(value.length < 1) {
							alert("키워드를 입력하세요.");
							return;
						}
						
						if(keywordIdx == 10) {
							alert("더이상 키워드를 추가할수 없습니다.");
							return;
						}
						
						value = value.replace(/\s+/g, '');
						
						var validListCheck = keywordValList.length; 
						for (var i = 0; i < validListCheck; i++) {
							if(value == keywordValList[i]) {
								alert("동일한 키워드를 검색할수 없습니다.");
								return;
							}
						}
						
						var addKeywordTag = cafe.addKeyword(value, keywordIdx);
						//공백제거후 추가
						keywordList[keywordIdx].classList.add('full');
						keywordList[keywordIdx].appendChild(addKeywordTag.p);
						keywordList[keywordIdx].appendChild(addKeywordTag.a);
						keywordValList.push(keywordTag.value);
						keywordTag.value = ''; 
						keywordIdx++;
						result["keywordList"] = keywordValList;
				} else if (selected.className == 'btn_del' || selected.className == 'img_del') {
					
					// 키워드 등록된거 삭제 버튼 눌럿을때 이벤트 처리
					// 클릭된 이벤트는 a tag -> numbering 되어있는 em tag를 찾는다.
					keywordIdx--;
					var selectedEmNumber = (selected.className == 'btn_del') ? selected.previousElementSibling.previousElementSibling.previousElementSibling.innerText
											: selected.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.innerText;
					
					var selectedEm = parseInt(selectedEmNumber) -1;
					
					//유효성 체크 키워드 리스트에서 제거
					keywordValList.splice(selectedEm,1);
					result["keywordList"] = keywordValList;
					// selectedEm Index ~ 끝까지  등록된 키워드 값만 재배치, ptag 
					if(selectedEm == keywordIdx) {
						var lastNodeChildren = keywordList[keywordIdx].children;
						keywordList[keywordIdx].removeChild(lastNodeChildren[2]);
						keywordList[keywordIdx].removeChild(lastNodeChildren[2]);
						keywordList[keywordIdx].classList.remove('full');
						return;
					}
					
					for (var i = selectedEm; i < keywordIdx; i++) {
						keywordList[i].getElementsByTagName('p')[0].innerText = keywordList[i+1].getElementsByTagName('p')[0].innerText;
					}
					
					var lastNodeChildren = keywordList[keywordIdx].children;
					keywordList[keywordIdx].removeChild(lastNodeChildren[2]);
					keywordList[keywordIdx].removeChild(lastNodeChildren[2]);
					keywordList[keywordIdx].classList.remove('full');
				} else if (selected == buttonTag[1]) {
					// 상세 사진 등록 UI 호출
					var detailImgTag = selected.parentElement.parentElement.parentElement.parentElement.parentElement.nextElementSibling.style;
					
					if(detailImgTag.display.length == 0) {
						detailImgTag.display="none";
					} else {
						detailImgTag.display="";
					}
				} else if (selected.className == 'btn_find') {
					// input file을 실행
					upLoadTag.click();
					upLoadTag.desc = "upLoaded";
					
				} else if (selected == buttonTag[2]) {
					// 등록되 이미지 삭제 click 이벤트
					upLoadTag.value = '';
					//cropper img 초기화
					showImg.style ='';
			        showImg.src = 'https://ssl.pstatic.net/static/phinf/profile/default_v2.jpg';
			        
			        //imgTag 초기화
			        imgTag.src = "https://ssl.pstatic.net/static/cafe/thumb/make_cafe_thumb_default.png";
			        imgTag.style = "";
					
			        img_name[0].innerText = "";
					img_name[1].innerText = "현재 사용중인 파일이 없습니다.";
					
					cropper.destroy();
					cropper = cafe.createCropper(showImg);
				
				} else if (selected == buttonTag[3]) {
					if(upLoadTag.value.length == 0) {
						alert("이미지 파일이 존재하지 않습니다.");
						return;
					}
					
					var cropperData = cropper.getCroppedCanvas();
					var ctx = cropperData.getContext("2d");
					imgWidth = cropperData.width;
					imgHeight = cropperData.height;
					imgTag.src = cropperData.toDataURL('image/jpeg');
				
				} else if (selected == buttonTag[4]) {
					if(upLoadTag.value.length == 0) {
						alert("이미지 파일이 존재하지 않습니다.");
						return;
					}
					
					imgTag.src = cropper.cropper.firstElementChild.firstElementChild.firstElementChild.src;
					imgWidth = cropper.cropper.firstElementChild.firstElementChild.firstElementChild.width;
					imgHeight = cropper.cropper.firstElementChild.firstElementChild.firstElementChild.height;
					
					
				} else if (selected == buttonTag2[0]) {
					
					//등록 버튼
					var cafeForm = {};
				    
					// 서버에 저정할 파일 이름 부여
					result["icon"] = img_name[0].textContent;
					//만약 이미지 등록이되어있지 않다면 기본 경로
					if(result["icon"] !== undefined && result["icon"].length > 0 ){
						//등록 버튼
						var c = document.createElement("canvas");
						c.width = 114;
						c.height = 114;
						var ctx = c.getContext("2d");
						ctx.drawImage(imgTag, 0, 0, 114, 114); // destination rectangle
						//var base64Data = c.toDataURL('image/jpeg');
						cafeForm['imageDatas'] = c.toDataURL('image/jpeg');
					} else {
						result["icon"] ='https://ssl.pstatic.net/static/phinf/profile/default_v2.jpg';
					}
					
					
					//유효성 검사가 필요
					
					
					if(document.getElementsByClassName('invalid').length > 0) {
						alert("카페 생성시 부적절한 조건을 발견하였습니다. 다시한번 확인해주세요.");
						//console.log(document.getElementsByClassName('invalid').length);
						return;
					}
					
					result['keywordList'] = result['keywordList'].toString();
				    cafeForm['cafeVO'] = result;
				    
				    
				    var json = JSON.stringify(cafeForm);
					
				    //form tag 안쓰고 xmlHttpRequest 사용.
					//common.createForm('/cafe/add',json);
					// response 값을담는곳 node id
					var requestParams = common.requestParams(true ,"POST", "/cafe/add.json", json, null);
					common.sync(requestParams);
				} else if (selected == buttonTag2[1]) {
					//취소 버튼
					console.log("취소버튼");
				}
				
				
			});
			
			//focus out 이벤트 처리
			//입력 유효성 검사
			var dataTags = document.getElementsByClassName("validate");
			var selectTags = document.getElementsByTagName("select");
			//select Tag에 이름 부여
			selectTags[0].name="title_mainSort";
			selectTags[1].name="title_subSort";
			selectTags[2].name="region_mainSort";
			selectTags[3].name="region_subSort";
			selectTags[4].name="useShortCut";
			
			// 유효성 검사가 필요 없는 부분
			var radioIdx = [2,3,4,5,6,7,8,9,10,12];
			// 카페이름, 카페 url , 카테고리 선택사항 클릭 입력시 이벤트  [유효성검사후 데이터 추가]
			bodyTag.addEventListener('focusout',function(event){
				var selected = event.target;
				
				if(selected == dataTags[0]) {
					//카페 이름
					result[selected.name] = selected.value;
				} else if (selected == dataTags[1]) {
					//카페 url
					result[selected.name] = selected.value;
				} else if (selected == dataTags[11] ) {
					//카페 설명
					result[selected.name] = selected.value;
				} else if (selected.type == "select-one"){
					/*
					 * 카페 메인 주제/ 부주제
					 * 카페 지역 주제/ 부주제
					 */
					for(var i = 0; i < selectTags.length; i++) {
						if(selected == selectTags[i]) {
							result[selected.name] = selected.value;
							if(selected.value == '-1') {
								selectTags[i].classList.add("invalid");
							} else {
								selectTags[i].classList.remove("invalid");
							}
							break;
						}
					}
					
					
					
				} else if(selected != buttonTag2[0]){
					//radion 버튼 유효성 검사
					var radioPos = 0;
					
					// 라디오 버튼 선택후 이벤트
					for(var i=0; i < radioIdx.length; i++) {
						if(selected == dataTags[i]) {
							result[selected.name] = selected.value;
							break;
						}
					}
					
					//선택된 input tag의 부모 태그를 선택 > 그리고 전체 input 검색한다.
					var pairRadioNode = selected.parentElement.getElementsByTagName('input');
					pairRadioNode[0].classList.remove("invalid");
					pairRadioNode[1].classList.remove("invalid");
					
				}
				
			});
			
			//byte 체크 태그들 호출
			var byteTag = document.getElementsByClassName("byte");
			var alertTag = document.getElementsByClassName("alert");

			//키를 뗴었을때 byte코드를 계산한다.
			bodyTag.addEventListener('keyup', function(event) {
				var selected = event.target;
				if(event.keyCode == 13 ) {
					//엔터키를 누를때는 이벤트진행 안함.
					return;
				}
				
				var textLength = 0;
				var selectedStrongTag;
				var byte = 0;
				
				/*
				 * 글자 변화에 따른 byte 계산
				 */
				if (selected == dataTags[0]) {
					//test code
					cafe.checkTextByte (selected.value, byteTag[0].firstChild, dataTags[0], alertTag[0], 60);
				} else if (selected == dataTags[1]) {
					cafe.checkTextByte (selected.value, byteTag[1].firstChild, dataTags[1], alertTag[1], 20);
				} else if (selected == keywordTag) { //cafe keyword
					cafe.checkTextByte (selected.value, byteTag[2].lastElementChild, keywordTag, alertTag[2], 20);
					
				} else if (selected == dataTags[11]) {
					cafe.checkTextByte (selected.value, byteTag[3].lastElementChild, dataTags[11], alertTag[3], 100);
				}
			});
			
			//change 이벤트
			bodyTag.addEventListener('change', function(event) {
				var selected = event.target;
				
				if(selected.className == 'int_file') {
					// 프로필 이미지 등록 버튼 눌룬후 이벤트
					//파일이 존재할떄 존재하지 않을떄 체크.
					var files = selected.files;
					// show Img
					var reader = new FileReader();
					var uploadImgFile = files[0];
					//reader.readAsDataURL(uploadImgFile);
					reader.onload = function (e) {
						cropper.replace(e.target.result, true);
					    
						for(var i = 0; i < img_name.length; i++) {
							img_name[i].innerText = uploadImgFile.name;
						}
					
		            }
					reader.readAsDataURL(uploadImgFile);
				}
				
			});
		}
	}
	};

(function() {
	cafe.init();
})();
