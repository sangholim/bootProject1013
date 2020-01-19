<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div id="contnet" class="content">
	<div class="common_title">
		<h2 class="title">
				카페 만들기
		</h2>
		<p class="txt">나와 같은 관심사를 가진 멤버를 모집하고 열심히 운영하여 카페를 성장시켜보세요.</p>
	</div>
	<div class="section_create">
		<table class="cafe_input">
			<caption>
				<span class="blind">카페 만들기 입력 양식</span>
			</caption>
			<colgroup>
				<col width="114">
				<col width="545">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row" class="th_name">
						<div class="stit">
							* 카페이름
							<button class="help">
								<span class="blind">도움말</span>
							</button>
							<div class="layer_pop">
								<div class="cont">
									<p>카페이름은 마지막 변경일을 기준으로 <br>6개월 이후에 수정할 수 있습니다. 
										<br>단, 카페 개설 후 최초 2회는 기간에 관계없이 <br>변경 가능합니다.
									</p>
								</div>
								<a href="#" class="btn_close">닫기</a>
								<span class="arr"></span>
							</div>
						</div>
					</th>
					<td>
						<div class="input_area">
							<input class="validate invalid">
							<span class="byte"><strong>0</strong> / 60 bytes</span>
						</div>
						<p class="txt">카페주제와 어울리는 이름으로 입력하면 많은 사람들이 카페를 찾기가 쉬워집니다.</p>
						<p class="txt alert" style="display: none;"><strong>글자수가 초과되었습니다.</strong></p>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_addr">
						<div class="stit">
							* 카페주소
							<button class="help">
								<span class="blind">도움말</span>
							</button>
							<div class="layer_pop">
								<div class="cont">
									<p>카페 주소는 추후 변경이 불가능합니다.</p>
								</div>
								<a href="#" class="btn_close">닫기</a>
									<span class="arr"></span>
							</div>
						</div>
					</th>
					<td>
						<div class="input_area">
							<label for="cafe_addr">https://cafe.naver.com/</label> 
							<!-- value="카페 주소를 입력해 주세요." -->
							<input class="validate invalid">
							<span class="byte"><strong>0</strong> / 20 bytes</span>
						</div>
						<p class="txt alert" style="display: none;"><strong>글자수가 초과되었습니다.</strong></p>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_priv">
						<div class="stit">* 카페성격</div>
					</th>
					<td class="th_priv">
						<div class="txt_area">
							<input class="validate invalid">
							<label for="open1">공개</label> 
							<input class="validate invalid">
							<label for="close1">비공개</label>
							<p class="txt" style="display: none;">
								<span class="note">비공개 카페는 검색에 노출되지 않고, 카페 주소를 통해서도 방문할 수 없습니다.</span>
							</p>
							<p class="txt">
								<span class="note note_v1">신규 카페의 경우 개설 후 24시간 경과 후에 검색에 반영됩니다.</span>
							</p>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_join">
						<div class="stit">* 가입방식</div>
					</th>
					<td class="th_join">
						<div class="txt_area radio">
							<input class="validate invalid">
							<label for="join_nosign">가입 신청시 바로 가입할 수 있습니다.</label><br>
							<input class="validate invalid">
							<label for="join_sign">가입 신청 시 운영진 승인을 거쳐 가입할 수 있습니다.</label>
						</div>
						<div class="txt_area" style="display: none;">비공개 카페는 운영진의 초대를 통해서만 가입할 수 있습니다.</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_maddr">
						<div class="stit off">* 멤버주소록</div>
					</th>
					<td class="th_maddr">
						<div class="txt_area">
							<input class="validate invalid">
							<!-- 
							<input type="radio" id="use_nick" name="" value="N" disabled="disabled" class="input_rdo validate">
							 -->
							<label for="use_nick">별명사용</label>
							<input class="validate invalid">
							<!-- 
							<input type="radio" id="use_name" name="" value="Y" disabled="disabled" class="input_rdo validate">
							 -->
							<label for="use_name">이름사용</label>
							<span class="note" style="display: none;">멤버관리메뉴에 이름이 공개됩니다.</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_minfo">
						<div class="stit">* 멤버목록</div>
					</th>
					<td class="th_priv">
						<div class="txt_area">
							<input class="validate invalid">
							<label for="open">공개</label>
							<input class="validate invalid">
							<label for="close">비공개</label>
							<p class="txt" style="display: none;">멤버목록을 모든 멤버가 열람할 수 있습니다.</p>
							<p class="txt">멤버목록을 매니저, 부매니저, 멤버등급스탭 이상만 열람할 수 있습니다.</p>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_dir">
						<div class="stit"> * 디렉토리
							<button class="help">
								<span class="blind">도움말</span>
							</button>
							<div class="layer_pop">
								<div class="cont">
									<p>
										디렉토리는 마지막 변경일을 기준으로 <br>6개월 이후에 수정할 수 있습니다. <br>단,
										카페 개설 후 최초 2회는 기간에 관계없이 <br>변경 가능합니다.
									</p>
								</div>
								<a href="#" class="btn_close">닫기</a>
								<span class="arr"></span>
							</div>
						</div>
					</th>
					<td>
						<div class="rel">
							<label for="group">주제</label>
							<select id="group"  class="invalid" title="대분류 선택" style="width: 280px;">
								<!--  이건 cafe.js 소스에 있음 -->
								<option value="-1">대분류 선택</option>
								<!-- 
								<option value="-1">대분류 선택</option>
								<option value="1">게임</option>
								<option value="2">만화/애니메이션</option>
								<option value="3">방송/연예</option>
								<option value="4">문화/예술</option>
								<option value="5">영화</option>
								<option value="6">음악</option>
								<option value="7">팬카페</option>
								<option value="8">여행</option>
								<option value="9">스포츠/레저</option>
								<option value="10">반려동물/동물</option>
								<option value="11">취미</option>
								<option value="12">생활</option>
								<option value="13">패션/미용</option>
								<option value="14">건강/다이어트</option>
								<option value="15">가족/육아</option>
								<option value="16">컴퓨터/통신</option>
								<option value="17">교육</option>
								<option value="18">외국어</option>
								<option value="19">인문/과학</option>
								<option value="20">경제/금융</option>
								<option value="21">정치/사회</option>
								<option value="22">문학/창작</option>
								<option value="23">동창/동문</option>
								<option value="24">친목/모임</option>
								<option value="25">종교/봉사</option>
								 -->
							</select>
							<select title="소분류 선택" class="invalid" style="width: 280px;">
								<option value="-1">소분류 선택</option>
							</select>
							<div>
								<label for="group2">지역</label>
								<select id="group2" title="대분류 선택" class="invalid"  style="width: 280px;">
									<!--  이미 소스에 있음 -->
									<option value="-1">대분류 선택</option>
									<!-- 
									<option value="1001">서울특별시</option>
									<option value="1002">경기도</option>
									<option value="1003">인천광역시</option>
									<option value="1004">부산광역시</option>
									<option value="1005">대전광역시</option>
									<option value="1006">대구광역시</option>
									<option value="1007">울산광역시</option>
									<option value="1008">광주광역시</option>
									<option value="1009">강원도</option>
									<option value="1010">충청북도</option>
									<option value="1011">충청남도</option>
									<option value="1012">경상북도</option>
									<option value="1013">경상남도</option>
									<option value="1014">전라북도</option>
									<option value="1015">전라남도</option>
									<option value="1016">제주특별자치도</option>
									<option value="1334">세종특별자치시</option>
									<option value="1017">아시아</option>
									<option value="1018">유럽</option>
									<option value="1019">미주/오세아니아</option>
									<option value="1020">아프리카</option>
									 -->
								</select>
								<select title="소분류 선택" class="invalid" style="width: 280px;">
									<option value="-1">소분류 선택</option>
								</select>
							</div>
						</div>
						<p class="txt" style="margin-left: 48px;">선택정보로서, 특정 지역의 정보를 다루는 지역이 있다면 설정해 주세요.</p>
					</td>
				</tr>
				<tr id="cafeKeywordArea">
					<th scope="row" class="th_keyword">
						<div class="stit">카페검색어
							<button class="help">
								<span class="blind">도움말</span>
							</button>
							<div class="layer_pop">
								<div class="cont">
									<p>
										카페검색어는 네이버 검색에 반영됩니다. <br>카페별 최대 10개까지 등록이 가능합니다.
									</p>
								</div>
								<a href="#" class="btn_close">닫기</a>
								<span class="arr" style="left: 71px;"></span>
							</div>
						</div>
					</th>
					<td>
						<p class="txt" style="margin-bottom: 6px;">
							공백은 자동으로 붙여쓰기 하여 한 키워드로 등록됩니다.
						</p>
						<input type="text" name="cafeKeyword" title="카페검색어" maxlength="40" class="input_txt2" style="width: 205px;">
						<button type="button" title="검색어 등록" class="btn_srch"></button>
						<span class="byte">
							<strong class="vm">0</strong> / 20 bytes
						</span>
						<p class="txt alert" style="display: none;">
							<strong>글자수가 초과되었습니다.</strong>
						</p>
						<div id="CafeKeywordListArea" class="srch_word_area">
							<ul class="validate">
								<li class="">
									<em>1</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>2</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>3</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>4</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>5</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<!---->
								<!---->
								<!---->
								<!---->
								<!---->
							</ul>
							<ul>
								<li class="">
									<em>6</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>7</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>8</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>9</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
								<li class="">
									<em>10</em>
									<input type="hidden" name="cafeKeywords" value="">
									<!----> <!---->
								</li>
							</ul>
						</div>
						<p class="txt">검색결과에 중요한 영향을 미치므로 카페와 연관성 있는 정확한 키워드를 입력해 주세요.</p>
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_dsc">
						<div class="stit">* 카페설명</div>
					</th>
					<td>
						<div class="input_area">
							<!-- 
							<textarea cols="30" rows="5" title="카페설명" class="input_txt3"></textarea>
							 -->
							<textarea class="validate"></textarea>
							<span class="byte"><strong>0</strong> / 100 bytes</span>
						</div>
						<p class="txt">입력한 내용이 카페 메인, 검색결과등의 카페리스트에 반영 됩니다.</p>
						<p class="txt alert" style="display: none"><strong>카페 설명 글자수가 초과되었습니다.</strong></p>
						<!---->
					</td>
				</tr>
				<tr>
					<th scope="row" class="th_major">
						<div class="stit">카페아이콘</div>
					</th>
					<td>
						<div class="major_img">
							<div class="thmb">
								<img class="validate">
							</div>
							<div class="detail">
								<div class="ly_btn">
									<button type="button" title="등록" class="btn_srch"></button>
									<span class="btn_del">
										<button type="button" title="삭제" class="btn_srch"></button>
									</span>
									<div id="btnDelLayer" class="cont_layer layer_type" style="width: 308px; left: 37px; top: 23px; display: none;">
										<div class="cont">
											<p class="txt2">
												카페아이콘을 <strong>삭제</strong>하시겠습니까?
											</p>
											<p class="dsc" style="vertical-align: baseline;">
												카페아이콘을 삭제할 경우, 카페 섹션의 주제별/지역별 카페,<br> 카페 네임카드, 소셜 검색
												등에서 대표 이미지가 노출되지 않습니다.
											</p>
										</div>
										<div class="btn2">
											<a href="#">
												<img src="http://static.naver.com/kin/09renewal/btn_confirm3.gif" width="45" height="26" alt="확인">
											</a>
											<a href="#">
												<img src="http://static.naver.com/kin/09renewal/btn_cancel2.gif" width="45" height="26" alt="취소">
											</a>
										</div>
										<a href="#" class="close">
											<img src="http://static.naver.com/kin/09renewal/btn_close_layer3.gif" width="19" height="19" alt="닫기">
										</a>
									</div>
								</div>
								<ul class="dot_list">
									<li>모바일에서 우리 카페를 표현할 카페아이콘을 등록해주세요. <a
										href="/cafe-home/cafe-notice?noticeId=1006&amp;boardId=1000003528&amp;boardDocId=10000000000020936353"
										target="_new" class="btn_view">자세히보기</a></li>
									<li>등록하신 아이콘은 모바일웹, 카페앱 및 PC 카페 &gt; 네임카드 등에 활용됩니다.<br>(150px
										* 150px / <em>10</em>MB미만)
									</li>
								</ul>
							</div>
						</div>
					</td>
				</tr>
				<!--  Test -->
				<tr style="display: none;">
					<th scope="row" class="th_major">
					</th>
					<td>
						<div>
							<div style="background-color: #f8f9fa; padding: 12px 0 6px 6px;">
								<p><b>프로필 사진 올리기</b></p>
							</div>
							<div style="padding: 12px 0 6px 6px;">
								<p><b>프로필 사진 설정 방법</b></p>
							</div>
							<ul style="list-style:circle; padding: 6px 0 6px 15px;">
								<li>이미지 중앙에 생긴 점선창을 조절하여 프로필 사진으로 만들고 싶은 영역이 점선 안에 보이도록 합니다.</li>
								<li>점선창의 비율은 1:1로 크기는 1:1비율로만 커지고, 작아집니다.</li>
								<li><b style="color: green;">하단 저장 버튼</b>을 클릭하거나, 점선창 더블클릭시 프로필 사진으로 등록됩니다.</li>
							
							</ul>
							<ul style="list-style:circle; padding: 6px 0 6px 15px; border-top: 1px solid #ededed;">
								<li>등록할 수 있는 사진의 크기는 <b style="color: green;">150*150픽셀 이상, 최대용량은 10MB미만</b> 입니다.</li>
								<li>파일 이름이 영문, 숫자가 아닐 경우 이미지가 안 보일 수 있습니다.</li>
								<li>확장자가 gif인 움직이는 이미지 파일의 경우 정지된 이미지로 제공됩니다.</li>
								<li style="list-style:none;">
									<span class="img_name"></span>
									<button class="btn_find">찾아보기</button>	
									<!--  찾아보기 버튼을 눌렀을떄 아래 input file 을 누름 -->
									<input  class="int_file" type="file" value="찾아보기" style="display: none;" >
								</li>
							</ul>
							
							현재사진:<span class="img_name">현재 사용중인 파일이 없습니다.</span>
							<div class="sel_img">
								<!--  cropper에 의해서 이미지 조절 -->
								<img src="https://ssl.pstatic.net/static/phinf/profile/default_v2.jpg"  style="max-width:100%; width: 461px; height: 300px;" class="_crop_source info" id="tmp_img" alt="프로필이미지">
								<!-- masking - 배경화면 -->
							</div>
							<!--  선택 영역 저장 -->
							<div style="padding: 12px 0 6px 6px;">
								<!--  선택 영역 저장[crop] -->
							    <img class="btn_srch" src="https://ssl.pstatic.net/static/phinf/profile/btn01.gif" alt="선택영역저장" style="cursor:pointer">
							    <!--  전체 영역 저장 -->
							    <img class="btn_srch" src="https://ssl.pstatic.net/static/phinf/profile/btn02.gif" width="100" height="28" alt="" style="cursor:pointer">
							    <!--  자른 파일의 영역의 중심으로 부터 150X150으로만 저장한다. -->
							</div>
						</div>
					</td>
				</tr>
								
				<tr>
					<th scope="row" class="th_shortcut">
						<label for="group_set1" class="stit">지름길 설정</label>
					</th>
					<td>
						<div class="group_select">
							<select id="group_set1" class="invalid" style="width: 202px;">
								<option value="999">기본 그룹</option>
							</select>
						</div>
						<p class="txt">원하는 그룹에 바로 추가하여 사용하시면 편리합니다.</p>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<p class="txt txt_commerce">카페를 상거래 목적으로 운영하는 경우, 전자상거래법에 따라 사업자정보를 표시해야 합니다. 
							<a href="/cafe-home/cafe-notice?noticeId=1505&amp;boardId=1000003528&amp;boardDocId=10000000000030634325" target="_blank" class="btn_view">자세히보기</a>
						</p>
					</td>
				</tr>

			</tbody>
		</table>
		<!--  -->
		<div class="common_btn_form">
			<button class="btn">
				<strong>확인</strong>
			</button>
			<button class="btn">취소</button>
		</div>

	</div>	

</div>
