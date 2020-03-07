<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--<input type="text" id="post_subject" placeholder="제목" height="100px"/>--%>

<link rel="stylesheet" href="/css/board/board.css" type="text/css">

<%--
<label class="item" for="subject">제목</label>
<input type="text" name="subject" placeholder="게시글 제목을 입력하세요" id="subject" class="box_input">

<!--  게시판 구성 페이지 [admin / user(회원) / 자게] -->
    <textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
    <script type="text/javascript" src="/js/package/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript">
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "ir1",
            sSkinURI: "/js/package/dist/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
    </script>

<input type="button" id="insertbtn" value="글쓰기" />--%>

<div id="nboard" style="width: 860px; text-align: left;">
    <div id="editer_border">
        <div id="naver_common_editor">

            <!-- smart editor 타이틀 -->
            <h3 class="bi">
                <img src="https://cafe.pstatic.net/cafe4/write_bi.gif" width="104" height="14" border="0" alt="SMART EDITOR" style="margin-right: 3px;"><a href="#" onclick="popEditorHelp();return false;"><img src="https://cafe.pstatic.net/cafe4/btn_help.gif" width="14" height="14" alt="스마트에디터 도움말" class="help"></a>
            </h3>

            <!-- 게시판 -->
            <ul class="subject">
                <li>
                    <label class="item" for="boardCategory">게시판</label>
                    <!-- 게시판 선택 -->
                    <div>


                        <select name="menuid" class="step01" style="width: 156px;" id="boardCategory">
                            <option value="-1">게시판선택</option>
                            <option wf="" wfid="" value="1" selected="">자유게시판</option>
                        </select>

                        <!-- 말머리 선택 -->
                        <select name="headid" id="headid" style="width: 115px;" title="게시판말머리">
                            <option value="">말머리선택</option>
                        </select>
                        <span id="go_headid" class="go_headid"><a target="_top" href="https://cafe.naver.com/ManageMenu.nhn?clubid=29995789&amp;menuid=1">말머리추가</a></span>


                        <span id="noticeAreaMain" class="notice_area">
									<input type="checkbox" id="typeClubNotice" name="typeClubNotice" class="box_check2">
									<label for="typeClubNotice" class="notice-1">공지로 등록</label>
							 	</span>

                        <select style="width:115px; display: none;" title="공지 유형" id="typeNoticeOption">
                            <option id="noticeN" value="N">전체 공지</option>
                            <option id="noticeM" value="M">게시판 공지</option>
                            <option id="noticeR" value="R">필독 공지</option></select>

                    </div>
                </li>

                <!-- 제목 -->
                <li class="post_subject">
                    <label class="item" for="subject">제목</label>
                    <div>
                        <input type="text" name="subject" value="게시글 제목을 입력하세요" id="subject" class="box_input">
                        <span id="tempsaving_text" class="save" style="display: none;">임시 저장된 글
                            <strong id="tempsaving_count">(0)</strong>
                        </span>
                        <div class="tooltip temporary_save" id="tempSave_tooltip" style="display: none;">
                            <div class="inner"><p class="txt">임시 저장은 최대 300개까지 가능합니다.<br>오래된 게시글을 삭제해 주세요.</p></div>
                            <a class="clse _click(TempSaveTooltip|Close) _stopDefault" href="#">닫기</a>
                            <div class="tail"></div>
                        </div>
                    </div>
                </li>

                <!-- 파일 첨부 -->
                <li id="file_attach_menu" class="file_attach_menu"><label class="item">파일첨부</label>
                    <div id="fileDB">
                        <ul>
                            <li id="iImage" class="first"><a class="ico_pic" href="#"><strong>사진</strong></a></li>
                            <li id="iMovie"><a class="ico_movie" href="#"><strong>동영상</strong></a><img src="https://cafe.pstatic.net/cafe4/ico-new.gif" alt="NEW" width="10" height="9" style="margin:-1px 6px 1px -4px;vertical-align:middle"></li>
                            <li id="iMap"><a class="ico_map" href="#"><strong>지도</strong></a></li>
                            <li id="iCalendar"><a class="ico_calendar" href="#"><strong>일정</strong></a></li>
                            <li id="iLink"><a class="ico_link _click(AttachLinkHandler|ShowAttachLinkLayer)" href="#"><strong>링크</strong></a></li>
                            <li id="iFile"><a class="ico_file" href="#"><strong>파일</strong></a></li>
                            <li id="iPoll"><a class="ico_vote" href="#"><strong>투표</strong></a></li>
                        </ul>
                    </div>
                </li>

                <!-- 정보 첨부 -->
                <li id="info_attach_menu" style="height:25px;">
                    <label class="pd02">정보첨부</label>
                    <div id="infoDB" class="infoattach">
                        <a href="#">책DB</a>
                        <span>|</span>
                        <a href="#">영화DB</a>
                        <span>|</span>
                        <a href="#">드라마DB</a>
                        <span>|</span>
                        <a href="#">음악DB</a>
                        <span>|</span>
                        <a href="#">상품DB</a>
                        <span>|</span>
                        <a href="#">인물DB</a>
                        <span>|</span>
                        <a href="#">날씨DB</a>
                        <span>|</span>
                        <a href="#">지식백과DB</a>
                    </div>
                </li>
            </ul>

            <!-- 광고 -->
            <%--<div class="blind" id="_suicideSaver">

                <div class="su_campaign">
                    <div class="su_prevention">
                        <div class="advice">
                            <div class="tit">
                                <h4>당신은 <strong>소중한 사람입니다.</strong></h4>
                                <p>당신은 그 존재만으로도 아름답고 가치있는 사람입니다. 포기하지마세요!</p>
                            </div>
                            <div class="advice_lst">
                                <div class="cal_lk">
                                    <h5>전화상담</h5>
                                    <ul>
                                        <li>자살예방상담전화 <span class="r_txt">1393</span></li>
                                        <li>정신건강상담전화 <span class="r_txt">1577-0199</span></li>
                                        <li>청소년전화 1388 <span class="r_txt">1388</span></li>
                                        <li>한국생명의전화 <span class="r_txt">1588-9191</span></li>
                                        <li>한마음한몸자살예방센터 <span class="r_txt">1599-3079</span></li>
                                    </ul>
                                </div>
                                <div class="cal_lk">
                                    <h5>온라인상담</h5>
                                    <ul>
                                        <li><a href="http://www.lifeline.or.kr/" target="_blank">한국생명의전화</a></li>
                                        <li><a href="https://www.cyber1388.kr:447/" target="_blank">청소년사이버상담센터</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="help_lk">
                            <div class="lk_lst">
                                <h5>포기하지마세요!</h5>
                                <ul>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109960&amp;cid=51011&amp;categoryId=51011" target="_blank">지금 자살을 생각하고 있는 당신에게</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109975&amp;cid=51011&amp;categoryId=51011" target="_blank">자살 시도자, 죽음의 늪에서 나오기까지</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109899&amp;cid=51011&amp;categoryId=51011" target="_blank">자살을 생각하는 청소년에게 고함</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109971&amp;cid=51011&amp;categoryId=51011" target="_blank">어디에서 도움을 받을 수 있을까?</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109972&amp;cid=51011&amp;categoryId=51011" target="_blank">정신건강의학과 도움 받기</a></li>
                                </ul>
                            </div>
                            <div class="lk_lst">
                                <h5>어떻게 도울까요?</h5>
                                <ul>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109964&amp;cid=51011&amp;categoryId=51011" target="_blank">고통에 대한 경청</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109961&amp;cid=51011&amp;categoryId=51011" target="_blank">자살을 암시하는 말과 행동</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109968&amp;cid=51011&amp;categoryId=51011" target="_blank">누군가 자살을 생각할 때 대처법</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109919&amp;cid=51011&amp;categoryId=51011" target="_blank">노인의 우울과 자살 징후</a></li>
                                    <li><a href="http://terms.naver.com/entry.nhn?docId=2109967&amp;cid=51011&amp;categoryId=51011" target="_blank">자살 고위험자 전문기관으로 연결하기</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>

            <!-- 기본 쓰기 탭 -->
            <div id="form_template_tab" class="tab_category">
                <div id="setupCafeTemplate" class="txt_template"> <!-- 공통 요소 삭제시 js수정 필요. setupCafeTemplate  --></div>
                <ul role="tablist">
                    <li id="ftm_basic" role="tab" aria-selected="true" class="first  on" style="cursor: pointer;"><a href="#">기본쓰기</a></li>
                </ul>
            </div>

            <!-- 템플릿 ? -->
          <%--  <div class="template" id="form_template" style="display:none;">
                <div id="ftm_basic_view" style="display:none;">
                </div>
            </div>--%>

            <textarea name="ir1" id="ir1" rows="20" cols="120">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
            <script type="text/javascript" src="/js/package/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
            <script type="text/javascript">
                var oEditors = [];
                nhn.husky.EZCreator.createInIFrame({
                    oAppRef: oEditors,
                    elPlaceHolder: "ir1",
                    sSkinURI: "/js/package/dist/SmartEditor2Skin.html",
                    fCreator: "createSEditor2"
                });
            </script>

            <ul class="post">

                <li id="file_list" style="display: none;"><label class="item">첨부파일</label>
                    <div class="file_list">
                        <ul id="fileTxtArea" class="file_txt" style="display: none;">
                            <xmp id="fileTxtArea_template" style="display:none">
                                <li class="#classname#"><a href="#">#filename#</a> <span>#filesize# <img src="https://blogimgs.pstatic.net/nblog/mylog/post/btn_file_delete.gif" width="12"
                                                                                                         height="11" alt="file delete" onclick="attachArea.delFile(#fileid#,'fileTxtArea');">
									</span></li>
                            </xmp>
                        </ul>

                        <ul id="fileThumbArea" class="file_thumb" style="display: none;">
                            <xmp id="fileThumbArea_template" style="display:none">

                                <li class="" name="thumbLi" onmouseover="attachArea.showDelete(this)" onmouseout="attachArea.hideDelete(this)">
                                    <span class="ic_rep"><span class="blind">대표</span></span>
                                    <div class="thumb_wrap" onClick="attachArea.selectRepresentImage(#fileid#);try{clickcr(this,'wrt.thumbnail','','',event);}catch(e){};return false;">
                                        <img id="attachThumb#fileid#" src="#thumbnail#" width="54" height="54" alt="첨부이미지">
                                    </div>
                                    <a href="#" class="ic_close" onclick="window.focus(); attachArea.delFile(#fileid#,'fileThumbArea');"><span class="blind">닫기</span></a>
                                </li>
                            </xmp>
                        </ul>
                    </div>
                    <div id="filesizeGuide" class="amount_info" style="display: none;"><em>최대 50MB</em>까지 파일을 올리실 수 있습니다.</div>
                    <div class="amount" style="display: none;">
                        <span><strong id="filesizeCurrent">0</strong>KB</span> <span class="section">/</span> <span class="total"><span id="filesizeTotal">51200</span>KB</span>
                        <div class="graph">
                            <span id="filesizeGuage" style="width: 0%; height: 7px;"></span>
                        </div>
                    </div>
                    <div class="cboth"></div>
                </li>

                <li>
<%--                    <label class="item" for="tagnames">태그달기</label>--%>
                    <%--<div>
                        <input type="text" name="tagnames" id="tagnames" class="box_input _click(TagValidator|TagNames) _keyup(TagValidator|ValidateTagNames) _blur(TagValidator|ValidateTagNames)">
                        <a href="#" id="tageditonclick" name="tageditonclick" onclick="clickTagEditOnArticleWrite(this); return false;" role="button" aria-expanded="false" aria-haspopup="true">
                            <img src="https://cafe.pstatic.net/cafe4/w_btn_mytag.gif" width="83" height="20" alt="나의 태그보기" class="mytag">
                        </a>
                        <a href="#" onclick="return false;" id="tagHelpIcon" role="button" class="help">
                            <img src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="태그 도움말" onmouseover="oCafeWrite.setCursor(this);return false;">
                        </a>
                    </div>--%>
                    <div id="tageditstack" style="display: none;">
                        <div class="cafe_tag" id="cafetagdiv" style="word-break: break-all;">
                            <div class="tag">
                                <strong>카페</strong> 태그
                            </div>
                            <div class="no_tag_list" id="cafetag">카페 태그 목록이 없습니다.</div>
                        </div>
                    </div>
                    <p style="clear: both;"></p>
                </li>



                <li class="open_edit"><label class="item">공개설정</label>
                    <div>
                        <input type="radio" name="openyn" value="Y" id="all_open" style="margin-left: 0; *margin-left: -4px" title="전체공개"> <label for="all_open" class="item_align">전체공개</label>
                        <input type="radio" name="openyn" value="N" id="member_open" checked="" title="멤버공개"> <label for="member_open" class="item_align">멤버공개</label>
                    </div>
                    <div class="search_allow">
                        <input type="checkbox" name="searchopen" value="1" class="box_check" id="search_conform" checked="">
                        <label for="search_conform" checked="">검색ㆍ네이버 서비스공개 허용</label>
                        <a href="#" id="searchHelpIcon" role="button">
                            <span class="notice"><img src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="도움말"> 검색 및 네이버 서비스를 통해 멤버가 아닌 사람도 글을 볼 수 있습니다.</span>
                        </a>
                    </div>
                </li>




                <li class="edit_date"><label class="item">기능설정</label>
                    <div style="margin-bottom: 4px; padding-top: 4px">
                        댓글
                        <span class="allow" id="replyynspan" tabindex="0" name="replyynlayer">허용</span>
                        <span class="bar">ㅣ</span>
                        블로그/카페 공유
                        <span class="allow" id="scrapynspan" tabindex="0">허용</span>

                        <span class="bar">ㅣ</span>
                        외부 공유
                        <span class="allow" id="metoospan" tabindex="0">사용</span>

                        <span class="bar">ㅣ</span>
                        마우스 오른쪽버튼
                        <span class="allow" id="rclickspan" tabindex="0">허용</span>

                        <span class="bar">ㅣ</span>
                        동영상 공유
                        <span class="prohibit" id="videoLinkSpan" tabindex="0" style="cursor: default;">비허용</span>

                        <div style="padding: 7px 0 0 0">
                            자동출처
                            <span class="prohibit" id="autosourcingspan" tabindex="0">사용 안함</span>
                            <span class="bar">ㅣ</span>
                            CCL
                            <span class="prohibit" id="cclspan" tabindex="0">사용 안함</span>
                            <a href="#" id="changeFunction" role="button" aria-expanded="false" aria-haspopup="true">
                                <img src="https://cafe.pstatic.net/cafe4/btn_set_modity2.gif" width="40" height="20" alt="설정변경" class="set_btn">
                            </a>
                        </div>
                    </div>
                    <div class="set" id="functiondiv" style="display: none">
                        <ul id="functionDivUl">

                            <li id="enabledComment">
                                <span class="set_item">댓글설정</span>
                                <span class="wd01">
											<input type="radio" name="replyyn" value="Y" id="reply_0" checked="">
											<label for="reply_0">허용</label>
										</span>
                                <span class="wd02">
											<input type="radio" name="replyyn" value="N" id="reply_1">
											<label for="reply_1">비허용</label>
										</span>
                            </li>
                            <li id="disabledComment" style="display:none">
                                <span class="set_item">댓글설정 </span>
                                <span class="wd01">
											<input type="radio" name="replyyn" value="Y" id="reply_2">
											<label for="reply_2">허용</label>
										</span>
                                <span>
											<input type="radio" name="replyyn" value="N" id="reply_3" disabled="">
											<label for="reply_3">비허용<span class="gray">매니저가 댓글설정을 허용하지 않았습니다.</span></label>
										</span>
                            </li>
                            <li>
										<span class="set_item">블로그/카페 공유
											<span id="linkscrapInfoMsgForsaleBoard" style="display: none;">(링크스크랩)</span>

											<a href="#"><img id="scrapHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="블로그/카페 공유 도움말" class="help02"></a>
										</span>
                                <span class="wd01">
											<input type="radio" name="scrapyn" value="Y" id="scrap_0" checked="">
											<label for="scrap_0">허용</label>
										</span>
                                <span>
											<input type="radio" name="scrapyn" value="N" id="scrap_1">
											<label for="scrap_1">비허용<span class="gray">기존의 스크랩 기능과 동일한 기능입니다.</span></label>
										</span>
                            </li>

                            <li>
										<span class="set_item">
											외부 공유
											<a href="#"><img id="metooExternalHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="외부 공유 도움말" class="help02"></a>
										</span>
                                <span class="wd01">
											<input type="radio" name="metoo" value="true" id="metoo_0" checked="">
											<label for="metoo_0">허용</label>
										</span>
                                <span>
											<input type="radio" name="metoo" value="false" id="metoo_1">
											<label for="metoo_1">비허용<span class="gray">메일과 외부SNS로 글을 보낼 수 있습니다.</span></label>
										</span>
                            </li>

                            <li>
										<span class="set_item">
											마우스 오른쪽클릭
											<a href="#"><img id="rClickHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="마우스 오른쪽클릭 도움말" class="help02"></a>
										</span>
                                <span class="wd01">
											<input type="radio" name="rclick" value="0">
											<label for="rclick_0">허용</label>
										</span>
                                <span>
											<input type="radio" name="rclick" value="1" id="rclick_1">
											<label for="rclick_1">비허용<span class="gray">무단복사 방지를 위해서는 비허용 체크 권장</span></label>
										</span>
                            </li>


                            <li>
												<span class="set_item">
													동영상 공유
													<a href="#"><img id="videoLinkHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="동영상 공유 도움말" class="help02"></a>
												</span>
                                <span class="wd01">
													<input type="radio" name="videoLink" value="true">
													<label for="videoLink_0">허용</label>
												</span>
                                <span>
													<input type="radio" name="videoLink" value="false" id="videoLink_1">
													<label for="videoLink_1">비허용</label>
												</span>
                            </li>



                            <li>
										<span class="set_item">
											자동출처 사용설정
											<a href="#"><img id="autoSourcingHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="자동출처 사용설정 도움말" class="help02"></a>
										</span>
                                <span class="wd01">
											<input type="radio" name="autosourcing" value="0" id="autosourcing_0">
											<label for="autosourcing_0">사용</label>
										</span>
                                <span>
											<input type="radio" name="autosourcing" value="1" checked="">
											<label for="autosourcing_1">사용 안함</label>
										</span>
                            </li>
                            <li>
										<span class="set_item">
											CCL 사용설정
											<a href="#"><img id="cclHelpIcon" src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="CCL 사용설정 도움말" class="help02"></a>
										</span>
                                <span class="wd01">
											<input type="radio" name="ccl" value="7"  id="ccl_0">
											<label for="ccl_0">사용</label>
										</span>
                                <span>
											<input type="radio" name="ccl" value="0"  id="ccl_1">
											<label for="ccl_1">사용 안함</label>
										</span>
                                <ul class="ccl_edit" id="ccl_edit" style="display: none;">
                                    <li class="first">저작자 표시 <span class="allow">필수</span></li>
                                    <li>영리적 이용 <span id="cclncspan" class="prohibit" tabindex="0">허락하지 않음</span></li>
                                    <input type="hidden" id="cclnc" value="2">
                                    <li>컨텐츠 변경 <span class="prohibit" tabindex="0">허락하지 않음</span></li>
                                    <input type="hidden" id="cclndsa" value="4">
                                </ul>
                            </li>
                        </ul>
                    </div>
                </li>

                <li id="li_cafe_send_post_go_kin" style="display: none;"><label class="item" for="go_kin">글 공유</label>
                    <div class="post_send">
                        <input type="checkbox" value="" name="" id="go_kin" class="go_kin"> 이 글을 지식iN으로 보냅니다. <span class="kin_rule"><a target="_blank" href="http://kin.naver.com/etc/rules.php">지식iN 운영원칙<img src="https://cafe.pstatic.net/cafe4/w_btn_help.gif" width="14" height="14" alt="지식iN 운영원칙 도움말" class="help02 _kinIntroLayerHoverArea">
								</a> (지식iN 을 통해 네이버 검색에도 노출됩니다.)</span>
                    </div>
                </li>

            </ul>


            <div id="edit_skin" style="display: none">


                <div class="fontname_items">
                    <div class="fontfamily_items">
                        <div class="shadow01">
                            <div class="shadow01_side">
                                <div class="shadow02">
                                    <div class="shadow02_side">
                                        <div class="rbox03">
                                            <div class="rbox03_t">
                                                <div></div>
                                            </div>
                                            <div class="rbox03_bg">
                                                <div class="rbox03_conts">
                                                    <ul id="fn_name_list">
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="rbox03_b">
                                                <div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="fontsize_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox03">
                                        <div class="rbox03_t">
                                            <div></div>
                                        </div>
                                        <div class="rbox03_bg">
                                            <div class="rbox03_conts">
                                                <ul id="fs_size_list">
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="rbox03_b">
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="fontcolor_items" class="fontcolor_items">
                    <div class="fontcolor_top_items">
                        <div class="shadow01">
                            <div class="shadow01_side">
                                <div class="shadow02">
                                    <div class="shadow02_side">
                                        <div class="rbox02">
                                            <div class="rbox02_t">
                                                <div></div>
                                            </div>
                                            <div class="rbox02_bg">
                                                <div class="rbox02_conts">
                                                    <table role="presentation" id="fc_color_tbl" cellspacing="1" cellpadding="0">
                                                        <tbody><tr>
                                                            <td bgcolor="#FF0000"></td>
                                                            <td bgcolor="#FF6C00"></td>
                                                            <td bgcolor="#FFAA00"></td>
                                                            <td bgcolor="#FFEF00"></td>
                                                            <td bgcolor="#A6CF00"></td>
                                                            <td bgcolor="#009E25"></td>
                                                            <td bgcolor="#00B0A2"></td>
                                                            <td bgcolor="#0075C8"></td>
                                                            <td bgcolor="#3A32C3"></td>
                                                            <td bgcolor="#7820B9"></td>
                                                            <td bgcolor="#EF007C"></td>
                                                            <td bgcolor="#000000"></td>
                                                            <td bgcolor="#252525"></td>
                                                            <td bgcolor="#464646"></td>
                                                            <td bgcolor="#636363"></td>
                                                            <td bgcolor="#7D7D7D"></td>
                                                            <td bgcolor="#9A9A9A"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#FFE8E8"></td>
                                                            <td bgcolor="#F7E2D2"></td>
                                                            <td bgcolor="#F5EDDC"></td>
                                                            <td bgcolor="#F5F4E0"></td>
                                                            <td bgcolor="#EDF2C2"></td>
                                                            <td bgcolor="#DEF7E5"></td>
                                                            <td bgcolor="#D9EEEC"></td>
                                                            <td bgcolor="#C9E0F0"></td>
                                                            <td bgcolor="#D6D4EB"></td>
                                                            <td bgcolor="#E7DBED"></td>
                                                            <td bgcolor="#F1E2EA"></td>
                                                            <td bgcolor="#ACACAC"></td>
                                                            <td bgcolor="#C2C2C2"></td>
                                                            <td bgcolor="#CCCCCC"></td>
                                                            <td bgcolor="#E1E1E1"></td>
                                                            <td bgcolor="#EBEBEB"></td>
                                                            <td bgcolor="#FFFFFF"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#E97D81"></td>
                                                            <td bgcolor="#E19B73"></td>
                                                            <td bgcolor="#D1B274"></td>
                                                            <td bgcolor="#CFCCA2"></td>
                                                            <td bgcolor="#CFCCA2"></td>
                                                            <td bgcolor="#61B977"></td>
                                                            <td bgcolor="#53AEA8"></td>
                                                            <td bgcolor="#518FBB"></td>
                                                            <td bgcolor="#6A65BB"></td>
                                                            <td bgcolor="#9A54CE"></td>
                                                            <td bgcolor="#E573AE"></td>
                                                            <td bgcolor="#5A504B"></td>
                                                            <td bgcolor="#767B86"></td>
                                                            <td rowspan="2" colspan="4"><img id="fc_bt_cp_more" src="https://cafe.pstatic.net/editor/btn_fontcolor_more.gif" alt="색상 더보기" width="47" height="23"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#951015"></td>
                                                            <td bgcolor="#6E391A"></td>
                                                            <td bgcolor="#785C25"></td>
                                                            <td bgcolor="#5F5B25"></td>
                                                            <td bgcolor="#4C511F"></td>
                                                            <td bgcolor="#1C4827"></td>
                                                            <td bgcolor="#0D514C"></td>
                                                            <td bgcolor="#1B496A"></td>
                                                            <td bgcolor="#2B285F"></td>
                                                            <td bgcolor="#45245B"></td>
                                                            <td bgcolor="#721947"></td>
                                                            <td bgcolor="#352E2C"></td>
                                                            <td bgcolor="#3C3F45"></td>
                                                        </tr>
                                                        </tbody></table>
                                                </div>
                                            </div>
                                            <div class="rbox02_b">
                                                <div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="fc_div_cp" class="pickercolor_items" style="display: none">
                        <div class="shadow01">
                            <div class="shadow01_side">
                                <div class="shadow02">
                                    <div class="shadow02_side">
                                        <div class="rbox02">
                                            <div class="rbox02_t">
                                                <div></div>
                                            </div>
                                            <div class="rbox02_bg">
                                                <div class="rbox02_conts">
                                                    <div class="color_set">
                                                        <div class="color_box">
                                                            <span id="fc_txt_color" class="color" style="background-color: #B9DE73;"></span>
                                                        </div>
                                                        <input type="text" id="fc_txt_colorCode" value="#6CB858" class="box_input" title="컬러코드" style="width: 68px; height: 20px;">
                                                        <img id="fc_bt_cp_ok" src="https://cafe.pstatic.net/editor/btn_fontcolor_apply.gif" alt="입력" width="33" height="20" class="btn01"> <span><img id="fc_bt_cp_less" src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"></span>
                                                    </div>
                                                    <div id="fc_cp"></div>
                                                </div>
                                            </div>
                                            <div class="rbox02_b">
                                                <div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="fontbackgroundcolor_items" class="fontbackgroundcolor_items">
                    <div class="fontbackgroundcolor_top_items">
                        <div class="shadow01">
                            <div class="shadow01_side">
                                <div class="shadow02">
                                    <div class="shadow02_side">
                                        <div class="rbox02">
                                            <div class="rbox02_t">
                                                <div></div>
                                            </div>
                                            <div class="rbox02_bg">
                                                <div class="rbox02_conts">
                                                    <table role="presentation" id="fbgc_list_tbl" cellspacing="0" cellpadding="0" class="bg">
                                                        <tbody><tr>
                                                            <td bgcolor="#000000" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td bgcolor="#9334D8" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td class="last" bgcolor="#FF0000" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#333333" style="color: #FFFF00;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td bgcolor="#0000FF" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td class="last" bgcolor="#FF6600" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#8E8E8E" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td bgcolor="#009999" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td class="last" bgcolor="#FFA700" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#FFDAED" style="color: #000000;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td bgcolor="#E4FF75" style="color: #000000;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td class="last" bgcolor="#CC9900" style="color: #FFFFFF;">
                                                                <div>가나다</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#99DCFF" style="color: #000000;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td bgcolor="#A6FF4D" style="color: #000000;">
                                                                <div>가나다</div>
                                                            </td>
                                                            <td class="last" bgcolor="#FFFFFF" style="color: #000000;">
                                                                <div>가나다</div>
                                                            </td>
                                                        </tr>
                                                        </tbody></table>

                                                    <table role="presentation" id="fbgc_color_tbl" cellspacing="1" cellpadding="0" class="color">
                                                        <tbody><tr>
                                                            <td bgcolor="#FF0000"></td>
                                                            <td bgcolor="#FF6C00"></td>
                                                            <td bgcolor="#FFAA00"></td>
                                                            <td bgcolor="#FFEF00"></td>
                                                            <td bgcolor="#A6CF00"></td>
                                                            <td bgcolor="#009E25"></td>
                                                            <td bgcolor="#00B0A2"></td>
                                                            <td bgcolor="#0075C8"></td>
                                                            <td bgcolor="#3A32C3"></td>
                                                            <td bgcolor="#7820B9"></td>
                                                            <td bgcolor="#EF007C"></td>
                                                            <td bgcolor="#000000"></td>
                                                            <td bgcolor="#252525"></td>
                                                            <td bgcolor="#464646"></td>
                                                            <td bgcolor="#636363"></td>
                                                            <td bgcolor="#7D7D7D"></td>
                                                            <td bgcolor="#9A9A9A"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#FFE8E8"></td>
                                                            <td bgcolor="#F7E2D2"></td>
                                                            <td bgcolor="#F5EDDC"></td>
                                                            <td bgcolor="#F5F4E0"></td>
                                                            <td bgcolor="#EDF2C2"></td>
                                                            <td bgcolor="#DEF7E5"></td>
                                                            <td bgcolor="#D9EEEC"></td>
                                                            <td bgcolor="#C9E0F0"></td>
                                                            <td bgcolor="#D6D4EB"></td>
                                                            <td bgcolor="#E7DBED"></td>
                                                            <td bgcolor="#F1E2EA"></td>
                                                            <td bgcolor="#ACACAC"></td>
                                                            <td bgcolor="#C2C2C2"></td>
                                                            <td bgcolor="#CCCCCC"></td>
                                                            <td bgcolor="#E1E1E1"></td>
                                                            <td bgcolor="#EBEBEB"></td>
                                                            <td bgcolor="#FFFFFF"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#E97D81"></td>
                                                            <td bgcolor="#E19B73"></td>
                                                            <td bgcolor="#D1B274"></td>
                                                            <td bgcolor="#CFCCA2"></td>
                                                            <td bgcolor="#CFCCA2"></td>
                                                            <td bgcolor="#61B977"></td>
                                                            <td bgcolor="#53AEA8"></td>
                                                            <td bgcolor="#518FBB"></td>
                                                            <td bgcolor="#6A65BB"></td>
                                                            <td bgcolor="#9A54CE"></td>
                                                            <td bgcolor="#E573AE"></td>
                                                            <td bgcolor="#5A504B"></td>
                                                            <td bgcolor="#767B86"></td>
                                                            <td rowspan="2" colspan="4"><img id="fbgc_bt_cp_more" src="https://cafe.pstatic.net/editor/btn_fontcolor_more.gif" alt="배경색상 더보기" width="47" height="23"></td>
                                                        </tr>
                                                        <tr>
                                                            <td bgcolor="#951015"></td>
                                                            <td bgcolor="#6E391A"></td>
                                                            <td bgcolor="#785C25"></td>
                                                            <td bgcolor="#5F5B25"></td>
                                                            <td bgcolor="#4C511F"></td>
                                                            <td bgcolor="#1C4827"></td>
                                                            <td bgcolor="#0D514C"></td>
                                                            <td bgcolor="#1B496A"></td>
                                                            <td bgcolor="#2B285F"></td>
                                                            <td bgcolor="#45245B"></td>
                                                            <td bgcolor="#721947"></td>
                                                            <td bgcolor="#352E2C"></td>
                                                            <td bgcolor="#3C3F45"></td>
                                                        </tr>
                                                        </tbody></table>
                                                </div>
                                            </div>
                                            <div class="rbox02_b">
                                                <div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="fbgc_div_cp" class="pickercolor_items" style="display: none">
                        <div class="shadow01">
                            <div class="shadow01_side">
                                <div class="shadow02">
                                    <div class="shadow02_side">
                                        <div class="rbox02">
                                            <div class="rbox02_t">
                                                <div></div>
                                            </div>
                                            <div class="rbox02_bg">
                                                <div class="rbox02_conts">
                                                    <div class="color_set">
                                                        <div class="color_box">
                                                            <span id="fbgc_txt_color" class="color" style="background-color: #B9DE73;"></span>
                                                        </div>
                                                        <input type="text" id="fbgc_txt_colorCode" value="#6CB858" class="box_input" title="컬러코드" style="width: 68px; height: 20px;"><img id="fbgc_bt_cp_ok" src="https://cafe.pstatic.net/editor/btn_fontcolor_apply.gif" alt="입력" width="33" height="20" class="btn01"><span><img id="fbgc_bt_cp_less" src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"></span>
                                                    </div>
                                                    <div id="fbgc_cp"></div>
                                                </div>
                                            </div>
                                            <div class="rbox02_b">
                                                <div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="lineheight_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox03">
                                        <div class="rbox03_t">
                                            <div></div>
                                        </div>
                                        <div class="rbox03_bg">
                                            <div class="rbox03_conts">
                                                <ul id="lh_height_list"></ul>
                                            </div>
                                        </div>
                                        <div class="rbox03_b">
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="scharinsertion_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox02">
                                        <div class="rbox02_t">
                                            <div></div>
                                        </div>
                                        <div class="rbox02_bg">
                                            <div class="rbox02_conts">
                                                <div class="kind">
                                                    <a href="#" id="cset1" class="this_on">일반기호</a> <span class="bar">|</span>
                                                    <a href="#" id="cset2">숫자와 단위</a> <span class="bar">|</span> <a href="#" id="cset3">원,괄호</a> <span class="bar">|</span> <a href="#" id="cset4">한글</a> <span class="bar">|</span> <a href="#" id="cset5">그리스,라틴어</a> <span class="bar">|</span> <a href="#" id="cset6">일본어</a> <span class="close"> <img src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"  style="cursor: pointer">
															</span>
                                                </div>
                                                <table role="presentation" id="charTable" width="419" cellspacing="1" cellpadding="0"></table>
                                                <div class="insert">
                                                    <label for="specialChar">선택한 기호</label> <input type="text" name="" value="" id="specialChar" class="box_input" style="width: 306px; height: 20px; font-size: 14px">
                                                    <img src="https://cafe.pstatic.net/editor/btn_confirm.gif" alt="확인" width="38" height="21" style="cursor: pointer">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rbox02_b">
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="emoticoninsertion_items">
							<div class="emoticon_items">
								<div class="shadow01">
									<div class="shadow01_side">
										<div class="shadow02">
											<div class="shadow02_side">
												<div class="rbox02">
													<div class="rbox02_t">
														<div></div>
													</div>
													<div class="rbox02_bg">
														<div class="rbox02_conts">
															<div class="kind">
																<a href="#" id="eset1" class="this_on">표정</a> <span class="bar">|</span>
																<a href="#" id="eset2">동식물</a> <span class="bar">|</span> <a href="#" id="eset3">사물1</a> <span class="bar">|</span> <a href="#" id="eset4">사물2</a> <span class="bar">|</span> <a href="#" id="eset5">말풍선</a> <span class="close"><img src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="{act|close}" width="15" height="14" style="cursor: pointer"></span>
															</div>

															<table role="presentation" id="emoTable" width="281" cellspacing="1" cellpadding="0" class="list">
															</table>

														</div>
													</div>
													<div class="rbox02_b">
														<div></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</span> <span id="hyperlink_items" class="hyperlink_items">
							<div class="url_items">
								<div class="shadow01">
									<div class="shadow01_side">
										<div class="shadow02">
											<div class="shadow02_side">
												<div class="rbox02">
													<div class="rbox02_t">
														<div></div>
													</div>
													<div class="rbox02_bg">
														<div class="rbox02_conts">
															<div class="make">
																<fieldset>
																	<legend>하이퍼링크</legend>
																	<div class="hyperlink">
																		<input type="text" id="hlnk_txt_url" value="http://" title="링크 입력" class="box_input">
																	</div>
																</fieldset>
																<div class="make_btm"></div>
															</div>
															<div class="btn02">
																<img src="https://cafe.pstatic.net/editor/btn_confirm.gif" style="cursor: pointer" alt="확인" width="38" height="21"> <img src="https://cafe.pstatic.net/editor/btn_cancel.gif" style="cursor: pointer" onclick="{act|close}" alt="취소" width="38" height="21">
															</div>
														</div>
													</div>
													<div class="rbox02_b">
														<div></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</span>
                <!-- 라인 스티커 -->
                <div class="linesticker_items se2_line_layer expand">
                    <div class="se2_in_layer">
                        <div class="se2_line_sticker">
                            <!-- [D] 활성화 .se2_prev / 비활성화 .se2_prev_off -->
                            <button type="button" title="이전" class="se2_prev" disabled="">
                                <span>이전</span>
                            </button>
                            <ul class="se2_line_sticker_set">
                            </ul>
                            <!-- [D] 활성화 .se2_next / 비활성화 .se2_next_off -->
                            <button type="button" title="다음" class="se2_next">
                                <span>다음</span>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="quote_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox02">
                                        <div class="rbox02_t">
                                            <div></div>
                                        </div>
                                        <div class="rbox02_bg">

                                            <div class="rbox02_conts">
                                                <ul>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer01.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer02.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer03.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer04.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer05.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer07.gif" width="32" height="34" alt=""></a></li>
                                                    <li><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer08.gif" width="32" height="34" alt=""></a></li>
                                                    <li class="last"><a href="#" style="cursor: pointer"><img src="https://cafe.pstatic.net/editor/quote_layer09.gif" width="32" height="34" alt=""></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="rbox02_b">
                                            <div></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>



                <!-- table_items -->
                <div class="inserttable_items">
                    <div class="inserttable_top_items">
                        <div class="rbox02">
                            <div class="rbox02_t">
                                <div></div>
                            </div>
                            <div class="rbox02_bg">
                                <div class="rbox02_conts">
                                    <div class="make" id="insertTable_plugin_cellrow">
                                        <fieldset>
                                            <legend>칸 수 지정</legend>
                                            <table role="presentation" width="200" cellspacing="0" cellpadding="0">
                                                <colgroup><col width="73">
                                                    <col width="137">

                                                </colgroup><tbody><tr valign="top">
                                                <td>
                                                    <table role="presentation" cellspacing="0" cellpadding="0">
                                                        <tbody><tr>
                                                            <td class="tit">행</td>
                                                            <td>
                                                                <div class="control">
                                                                    <input type="text" id="rows_val" name="rows_val" title="행 입력" value="4" onblur="{act|change|'chRows', this.value }">
                                                                    <span><img src="https://cafe.pstatic.net/editor/btn_updown.gif" alt="행 조절" width="15" height="16" usemap="#btnRows"></span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="5" colspan="2"></td>
                                                        </tr>

                                                        <tr>
                                                            <td class="tit">열</td>
                                                            <td>
                                                                <div class="control">
                                                                    <input type="text" id="cols_val" name="cols_val" title="열 입력" value="4" onblur="{act|change|'chCols', this.value }">
                                                                    <span><img src="https://cafe.pstatic.net/editor/btn_updown.gif" alt="열 조절" width="15" height="16" usemap="#btnCols"></span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        </tbody></table> <map name="btnRows">
                                                    <area alt="행 추가" coords="0,0,16,8" href="#">
                                                    <area alt="행 삭제" coords="0,9,16,20" href="#">
                                                </map> <map name="btnCols">
                                                    <area alt="열 추가" coords="0,0,16,8" href="#">
                                                    <area alt="열 삭제" coords="0,9,16,20" href="#">
                                                </map> <map name="btnBorder">
                                                    <area alt="테두리 굵기 증가" coords="0,0,16,8" href="#">
                                                    <area alt="테두리 굵기 감소" coords="0,9,16,20" href="#">
                                                </map>
                                                </td>
                                                <td>
                                                    <div style="overflow: hidden; width: 137px;">
                                                        <table role="presentation" id="insertTable_plugin_pretable" border="0" width="100%" height="40" cellspacing="1" bgcolor="#B7BBB5">
                                                            <tbody><tr bgcolor="#FFFFFF">
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr bgcolor="#FFFFFF">
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr bgcolor="#FFFFFF">
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr bgcolor="#FFFFFF">
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                            </tr>
                                                            </tbody></table>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody></table>
                                        </fieldset>
                                        <div class="make_btm"></div>
                                    </div>

                                    <div class="make">
                                        <fieldset>
                                            <legend>표 속성 지정</legend>

                                            <table role="presentation" width="200" cellspacing="0" cellpadding="0">
                                                <colgroup><col width="57">
                                                    <col width="143">
                                                </colgroup><tbody><tr valign="top">
                                                <td class="tit">테두리 굵기</td>
                                                <td>
                                                    <div class="control">
                                                        <input type="text" id="border_val" name="border_val" title="테두리 굵기 입력" value="1" onblur="{act|change|'chBorder', this.value }">
                                                        <span><img src="https://cafe.pstatic.net/editor/btn_updown.gif" alt="테두리 굵기 조절" width="15" height="16" usemap="#btnBorder"></span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="5" colspan="2"></td>
                                            </tr>

                                            <tr>
                                                <td height="20" class="tit02">테두리 색</td>
                                                <td>
                                                    <div class="color_set">
                                                        <div class="color_box" style="cursor: pointer">
                                                            <span id="borderColor" class="color" style="background-color: #B7BBB5;"></span>
                                                        </div>
                                                        <input type="text" id="borderColorCode" name="borderColorCode" title="테두리 색 입력" value="#B7BBB5" class="box_input" style="width: 78px; height: 20px;" onblur="{act|change|'chBorderColor',this.value}">
                                                        <a href="#"><img src="https://cafe.pstatic.net/editor/btn_search.gif" alt="찾기" width="33" height="20" class="btn01"></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="3" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="tit02">표 배경색</td>

                                                <td>
                                                    <div class="color_set">
                                                        <div class="color_box" style="cursor: pointer">
                                                            <span id="backColor" class="color" style="background-color: #FFFFFF;"></span>
                                                        </div>
                                                        <input type="text" id="backColorCode" name="backColorCode" title="표 배경색" value="#FFFFFF" class="box_input" style="width: 78px; height: 20px;" onblur="{act|change|'chBgColor',this.value}">
                                                        <a href="#"><img src="https://cafe.pstatic.net/editor/btn_search.gif" alt="찾기" width="33" height="20" class="btn01"></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="10" colspan="2"></td>
                                            </tr>
                                            </tbody></table>
                                        </fieldset>
                                        <div class="make_btm"></div>
                                    </div>

                                    <div class="btn02">
                                        <a href="#"><img src="https://cafe.pstatic.net/editor/btn_confirm.gif" alt="확인" width="38" height="21"></a> <a href="#" onclick="{act|close}"><img src="https://cafe.pstatic.net/editor/btn_cancel.gif" alt="취소" width="38" height="21"></a>
                                    </div>

                                </div>
                                <!-- //rbox02_conts -->
                            </div>
                            <div class="rbox02_b">
                                <div></div>
                            </div>
                        </div>
                    </div>

                    <div id="table_div_cp">
                        <div class="fontcolor_top_items">
                            <div class="rbox02" style="position: relative">
                                <div class="rbox02_t">
                                    <div></div>
                                </div>
                                <div class="rbox02_bg">
                                    <div class="rbox02_conts">
                                        <table role="presentation" id="table_color_tbl" cellspacing="1" cellpadding="0">
                                            <tbody><tr>
                                                <td bgcolor="#FF0000"></td>
                                                <td bgcolor="#FF6C00"></td>
                                                <td bgcolor="#FFAA00"></td>
                                                <td bgcolor="#FFEF00"></td>
                                                <td bgcolor="#A6CF00"></td>
                                                <td bgcolor="#009E25"></td>
                                                <td bgcolor="#00B0A2"></td>
                                                <td bgcolor="#0075C8"></td>
                                                <td bgcolor="#3A32C3"></td>
                                                <td bgcolor="#7820B9"></td>
                                                <td bgcolor="#EF007C"></td>
                                                <td bgcolor="#000000"></td>
                                                <td bgcolor="#252525"></td>
                                                <td bgcolor="#464646"></td>
                                                <td bgcolor="#636363"></td>
                                                <td bgcolor="#7D7D7D"></td>
                                                <td bgcolor="#9A9A9A"></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#FFE8E8"></td>
                                                <td bgcolor="#F7E2D2"></td>
                                                <td bgcolor="#F5EDDC"></td>
                                                <td bgcolor="#F5F4E0"></td>
                                                <td bgcolor="#EDF2C2"></td>
                                                <td bgcolor="#DEF7E5"></td>
                                                <td bgcolor="#D9EEEC"></td>
                                                <td bgcolor="#C9E0F0"></td>
                                                <td bgcolor="#D6D4EB"></td>
                                                <td bgcolor="#E7DBED"></td>
                                                <td bgcolor="#F1E2EA"></td>
                                                <td bgcolor="#ACACAC"></td>
                                                <td bgcolor="#C2C2C2"></td>
                                                <td bgcolor="#CCCCCC"></td>
                                                <td bgcolor="#E1E1E1"></td>
                                                <td bgcolor="#EBEBEB"></td>
                                                <td bgcolor="#FFFFFF"></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#E97D81"></td>
                                                <td bgcolor="#E19B73"></td>
                                                <td bgcolor="#D1B274"></td>
                                                <td bgcolor="#CFCCA2"></td>
                                                <td bgcolor="#CFCCA2"></td>
                                                <td bgcolor="#61B977"></td>
                                                <td bgcolor="#53AEA8"></td>
                                                <td bgcolor="#518FBB"></td>
                                                <td bgcolor="#6A65BB"></td>
                                                <td bgcolor="#9A54CE"></td>
                                                <td bgcolor="#E573AE"></td>
                                                <td bgcolor="#5A504B"></td>
                                                <td bgcolor="#767B86"></td>
                                                <td rowspan="2" colspan="4"><img style="cursor: pointer" src="https://cafe.pstatic.net/editor/btn_fontcolor_more.gif" alt="색상 더보기" width="47" height="23"></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#951015"></td>
                                                <td bgcolor="#6E391A"></td>
                                                <td bgcolor="#785C25"></td>
                                                <td bgcolor="#5F5B25"></td>
                                                <td bgcolor="#4C511F"></td>
                                                <td bgcolor="#1C4827"></td>
                                                <td bgcolor="#0D514C"></td>
                                                <td bgcolor="#1B496A"></td>
                                                <td bgcolor="#2B285F"></td>
                                                <td bgcolor="#45245B"></td>
                                                <td bgcolor="#721947"></td>
                                                <td bgcolor="#352E2C"></td>
                                                <td bgcolor="#3C3F45"></td>
                                            </tr>
                                            </tbody></table>
                                    </div>
                                </div>
                                <div class="rbox02_b">
                                    <div></div>
                                </div>

                            </div>
                        </div>

                        <div id="table_div_cp_bottom" class="pickercolor_items" style="display: none;">

                            <div class="rbox02" style="position: relative">
                                <div class="rbox02_t">
                                    <div></div>
                                </div>
                                <div class="rbox02_bg">
                                    <div class="rbox02_conts">
                                        <div class="color_set">
                                            <div class="color_box">
                                                <span id="tbg_txt_color" class="color" style="background-color: #B9DE73;"></span>
                                            </div>
                                            <input type="text" id="tbg_txt_colorCode" title="컬러 코드" value="#6CB858" class="box_input" style="width: 68px; height: 20px;"><a href="#"><img id="tbg_bt_cp_ok" src="https://cafe.pstatic.net/editor/btn_fontcolor_apply.gif" alt="입력" width="33" height="20" class="btn01"></a><span><a href="#" onclick="{act|closecp2}"><img src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"></a></span>
                                        </div>
                                        <div id="cp_table"></div>
                                    </div>
                                </div>
                                <div class="rbox02_b">
                                    <div></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="searchkeyword_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox01">
                                        <div class="rbox01_t">
                                            <div></div>
                                            <h4 class="subject">찾기/바꾸기 <span><a href="#"><img src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"></a></span></h4>
                                        </div>
                                        <div class="rbox01_bg">
                                            <div class="rbox01_conts">
                                                <div class="tab_menu"><img src="https://cafe.pstatic.net/editor/tab_serch01.gif" alt="" width="89" height="23" usemap="#tab_menu1"></div>
                                                <map name="tab_menu1">
                                                    <area alt="바꾸기" coords="40,2,87,21" href="#">
                                                </map>


                                                <div class="box_line">
                                                    <span class="ul_bg"></span>
                                                    <ul>
                                                        <li><label class="tit" for="keyword">찾을단어</label> <input type="text" name="keyword" value="" id="keyword" class="box_input" style="width: 150px;" autocomplete="off"></li>
                                                    </ul>
                                                </div>

                                                <div class="box_line_btm">
                                                    <div></div>
                                                </div>

                                                <div class="btn02">
                                                    <a href="#"><img src="https://cafe.pstatic.net/editor/btn_next_search.gif" alt="다음찾기" width="62" height="21"></a> <a href="#" onclick="{act|close}"><img src="https://cafe.pstatic.net/editor/btn_edit_cancel.gif" alt="취소" width="38" height="21"></a>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="rbox01_b">
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="writeformmanager_items member_layer" style="width: 310px">
                    <div class="layer_contents">
                        <div class="write_form_contents" id="formList">



                            <div class="writeform_text">
                                <h4>글양식이란?</h4>
                                <p>
                                    우리 카페에서 자주 사용하는 글 양식을 매니저,<br> 스탭이 등록하면, 등록된 글양식을 쉽게
                                    불러와 <br> 정해진 양식대로 글을 쓸 수 있습니다.
                                </p>
                                <p>
                                    카페만의 리뷰양식, 백문백답, 자기소개 양식 등을<br> 등록해서 사용하세요.
                                </p>
                            </div>
                            <div class="btns">
                                <a href="#"><img src="https://cafe.pstatic.net/cafe4/btn_layer_confirm.gif" width="40" height="21" alt="확인"></a>
                            </div>
                            <div class="btn_help">
                                <a href="#">사용안내
                                    <img src="https://cafe.pstatic.net/cafe4/ico_ques.gif" width="14" height="14" alt="도움말">
                                </a>
                            </div>



                            <a href="#" class="btn_close" role="button"><img src="https://cafe.pstatic.net/editor/btn_x_close.gif" width="15" height="14" alt="닫기"></a>
                        </div>
                    </div>
                </div>

                <div class="layoutmanager_items">
                    <div class="layer_box" style="height: 305px">

                        <div class="basic_box">
                            <ul>
                                <li id="elLayoutContainer_91"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout01.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_92"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout02.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_93"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout03.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_94"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout04.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_95"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout05.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_96"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout06.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_97"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout07.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_98"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout08.gif" width="40" height="40" alt=""></a></li>
                                <li id="elLayoutContainer_99"><a href="#"><img src="https://cafe.pstatic.net/editor/layout/img_nlayout09.gif" width="40" height="40" alt=""></a></li>
                            </ul>
                        </div>
                        <p class="cboth blank3"></p>
                        <div class="rnd_layer_box">
                            <ul class="design">
                                <li><a id="elLayoutContainer_03" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout03.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'01'}" onmouseout="{act|mouseout|'01'}" id="elPreviewButton_01" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'03'}" onkeydown="if(isEnter(event)){{act|previewlayout|'03'}}"></li>
                                <li><a id="elLayoutContainer_05" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout05.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'02'}" onmouseout="{act|mouseout|'02'}" id="elPreviewButton_02" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'05'}" onkeydown="if(isEnter(event)){{act|previewlayout|'05'}}"></li>
                                <li><a id="elLayoutContainer_06" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout06.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'03'}" onmouseout="{act|mouseout|'06'}" id="elPreviewButton_03" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'06'}" onkeydown="if(isEnter(event)){{act|previewlayout|'06'}}"></li>
                                <li><a id="elLayoutContainer_07" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout07.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'04'}" onmouseout="{act|mouseout|'04'}" id="elPreviewButton_04" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'07'}" onkeydown="if(isEnter(event)){{act|previewlayout|'07'}}"></li>
                                <li><a id="elLayoutContainer_08" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout08.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'05'}" onmouseout="{act|mouseout|'05'}" id="elPreviewButton_05" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'08'}" onkeydown="if(isEnter(event)){{act|previewlayout|'08'}}"></li>
                                <li><a id="elLayoutContainer_09" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout09.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'06'}" onmouseout="{act|mouseout|'06'}" id="elPreviewButton_06" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'09'}" onkeydown="if(isEnter(event)){{act|previewlayout|'09'}}"></li>
                                <li><a id="elLayoutContainer_10" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout10.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'07'}" onmouseout="{act|mouseout|'07'}" id="elPreviewButton_07" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'10'}" onkeydown="if(isEnter(event)){{act|previewlayout|'10'}}"></li>
                                <li class="end"><a id="elLayoutContainer_11" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout11.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'08'}" onmouseout="{act|mouseout|'08'}" id="elPreviewButton_08" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'11'}" onkeydown="if(isEnter(event)){{act|previewlayout|'11'}}"></li>
                                <li class="end"><a id="elLayoutContainer_13" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout13.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'09'}" onmouseout="{act|mouseout|'09'}" id="elPreviewButton_09" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'13'}" onkeydown="if(isEnter(event)){{act|previewlayout|'13'}}"></li>
                                <li class="end"><a id="elLayoutContainer_14" href="#" ><img src="https://cafe.pstatic.net/editor/layout/img_tlayout14.gif" width="80" height="85" alt=""></a> <img onmouseover="{act|mouseover|'10'}" onmouseout="{act|mouseout|'10'}" id="elPreviewButton_10" src="https://cafe.pstatic.net/editor/layout/ico_magnifying_on.gif" width="14" height="14" alt="미리보기" class="magnifying" tabindex="0" onclick="{act|previewlayout|'14'}" onkeydown="if(isEnter(event)){{act|previewlayout|'14'}}"></li>
                            </ul>
                            <p class="cboth"></p>

                        </div>
                        <div class="rnd_layer_box_b"></div>
                        <div class="btns">
                            <img src="https://cafe.pstatic.net/editor/layout/btn_apply.gif" width="40" height="21" alt="적용" onclick="{act|insertlayout}">
                            <img src="https://cafe.pstatic.net/editor/layout/btn_cancelapply.gif" width="63" height="21" alt="적용취소" onclick="{act|cancellayout}">
                            <div class="r_btn">
                                <a href="#" onclick="popEditorHelp('sub06.jsp');return false;">사용안내</a>
                                <img src="https://cafe.pstatic.net/editor/layout/ico_question.gif" width="14" height="14" alt="사용안내" onclick="popEditorHelp('sub06.jsp');return false;">
                            </div>
                        </div>
                        <span class="close"><a href="#" onclick="{act|closelayout}"><img src="https://cafe.pstatic.net/editor/layout/btn_x_close.gif" alt="close" width="15" height="14"></a></span>
                    </div>
                </div>
                <div class="replacekeyword_items">
                    <div class="shadow01">
                        <div class="shadow01_side">
                            <div class="shadow02">
                                <div class="shadow02_side">
                                    <div class="rbox01">
                                        <div class="rbox01_t">
                                            <div></div>
                                            <h4 class="subject">찾기/바꾸기 <span><a href="#" onclick="{act|close}"><img src="https://cafe.pstatic.net/editor/btn_x_close.gif" alt="close" width="15" height="14"></a></span></h4>
                                        </div>
                                        <div class="rbox01_bg">
                                            <div class="rbox01_conts">
                                                <div class="tab_menu"><img src="https://cafe.pstatic.net/editor/tab_serch02.gif" alt="" width="89" height="23" usemap="#tab_menu2"></div>
                                                <map name="tab_menu2">
                                                    <area alt="찾기" coords="1,2,38,21" href="#" onclick="{act|gosearch}">
                                                </map>
                                                <div class="box_line">
                                                    <span class="ul_bg"></span>
                                                    <ul>
                                                        <li><label class="tit" for="keyword_re">찾을단어</label> <input type="text" name="keyword_re" value="" id="keyword_re" class="box_input" style="width: 150px;" autocomplete="off"></li>
                                                        <li><label class="tit" for="replace">바꿀단어</label> <input type="text" name="replace" value="" id="replace" class="box_input" style="width: 150px;" autocomplete="off"></li>
                                                    </ul>
                                                </div>

                                                <div class="box_line_btm">
                                                    <div></div>
                                                </div>

                                                <div class="btn02">
                                                    <a href="#" onclick="{act|search}"><img src="https://cafe.pstatic.net/editor/btn_next_search02.gif" alt="다음찾기" width="55" height="21"></a> <a href="#" onclick="{act|replace}"><img src="https://cafe.pstatic.net/editor/btn_replace.gif" alt="바꾸기" width="48" height="21"></a> <a href="#" onclick="{act|allreplace}"><img src="https://cafe.pstatic.net/editor/btn_all_replace.gif" alt="모두바꾸기" width="69" height="21"></a> <a href="#" onclick="{act|close}"><img src="https://cafe.pstatic.net/editor/btn_edit_cancel.gif" alt="취소" width="38" height="21"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="rbox01_b">
                                            <div></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span id="spellcheck_suggestionlayer">
							<div id="edit_module" style="width: 118px; position: relative; top: -1px; left: -1px;">
								<table role="presentation" width="100%" cellspacing="0" cellpadding="0">

									<tbody><tr valign="top">
										<td>
											<div>
												<!--shadow removed [[-->
												<div class="spell_check">
													<ul>{REPLACE}
													</ul>
													<div class="spell_search">
														<input type="text" id="chspell" title="직접입력" value="직접입력" style="width: 70px; height: 19px; font-size: 12px;" onfocus="this.value='';spellcheckDocPlugin.directInput=1;">
														<img src="https://cafe.pstatic.net/editor/btn_spellingedit.gif" width="31" height="20" alt="맞춤법 수정" style="vertical-align: top;" onclick="spellcheckDocPlugin.changeSpell(this.previousSibling.previousSibling.value)">
													</div>
												</div>
                                                <!--]] shadow removed-->
											</div>
										</td>
									</tr>
								</tbody></table>
							</div>
						</span>
            </div>

            <div id="attachLinkLayer" class="se2_og_layer" style="display: none;">
                <h3><strong>링크추가</strong></h3>
                <div class="se2_og_input">

		<span class="se2_og_url">
			<input id="attachLinkUrl" type="text" title="URL 입력" value="URL을 입력해주세요." class="_focus(AttachLinkHandler|InitAttachLinkUrl) _blur(AttachLinkHandler|InitAttachLinkUrl) _keydown(AttachLinkHandler|InitAttachLinkUrl) _paste(AttachLinkHandler|PreviewAttachLink)">

			<a id="attachLinkUrlDelBtn" href="#" class="se2_delete _click(AttachLinkHandler|RemoveAttachLinkUrl) _stopDefault" style="display:none"><span class="blind">삭제</span></a>
		</span>
                    <button type="button" class="se2_preview _click(AttachLinkHandler|PreviewAttachLink) _stopDefault"><span>미리보기</span></button>
                </div>
                <div id="attachLinkPreview" class="se2_og_content" style="display: none;">
                </div>
                <div id="attachLinkLoading" class="se2_og_loading" style="display: none;"><img src="https://ssl.pstatic.net/static.se2/static/full/20141105/ico_loading.gif" width="54" height="54" alt="로딩중"></div>
                <p id="attachLinkErrorMsg" class="se2_og_txt" style="display: none;">해당 링크의 정보를 불러올 수 없습니다. 링크를 다시 확인해주세요.</p>
                <p class="se2_og_btns">
                    <button type="button" class="se2_apply _click(AttachLinkHandler|AddAttachLink) _stopDefault"><span>적용</span></button><button type="button" class="se2_cancel _click(AttachLinkHandler|HideAttachLinkLayer) _stopDefault"><span>취소</span></button>
                </p>
            </div>

        </div>
    </div>

    <div class="warning_message">&nbsp;&nbsp;저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시글은 이용약관 및 관련법률에 의해 제재를 받으실 수 있습니다.</div>

    <div class="btn_post ">
        <a href="#" id="tempsaving_btn" class="btn_type1 " title="Ctrl+S를 클릭해도 임시저장 됩니다.">임시저장</a>
        <a href="#" id="cafePreviewbtn" class="btn_type1 " >미리보기</a>

        <a href="#" id="insertbtn" class="btn_type1 "><strong>확인</strong></a>

    </div>
</div>
