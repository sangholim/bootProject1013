<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<%--
	<link rel="stylesheet" href="/css/board/board.css" type="text/css">
	 --%>
<link class="personal_css" rel="stylesheet"
	href="/css/board/board.css?${applicationScope.cachetype}"
	type="text/css">
</head>

<div id="basisElement">
	<div id="content-area">
		<div id="main-area">
			<!--  style 변경사항  -->
			<div class="list-blog border-sub" id="post_2">
				<div class="inbox">
					<!-- 타이틀,게시글 등록일,보관,수정 박스 -->
					<div class="tit-box">
						<div class="fl">
							<table role="presentation" cellspacing="0" cellpadding="0"
								border="0">
								<tbody>
									<tr valign="top">
										<td>
											<!-- 타이틀 --> <span id="post_subject" class="b m-tcol-c">${post.userCafeBoardVO.subject}</span>
										</td>
										<td nowrap="" class="m-tcol-c filter-30">|</td>
										<td nowrap="" class="m-tcol-c"><a href="" onclick=""
											class="m-tcol-c">자유게시판</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr">
							<table role="presentation" cellspacing="0" cellpadding="0"
								border="0">
								<tbody>
									<tr>
										<td></td>
										<td class="m-tcol-c date">
											${post.userCafeBoardVO.createDateStr}</td>

										<td nowrap="" class="m-tcol-c filter-30">|</td>
										<td class="edit _rosRestrict"><a id="addArticleStorage"
											href="#" onclick="clickcr(this,'art.keep','','',event);"
											class="m-tcol-c">보관</a></td>

										<td nowrap="" class="m-tcol-c filter-30">|</td>
										<td class="edit _rosRestrict"><a id="modifyFormLink"
											href="#" class="m-tcol-c">수정</a></td>

										<td nowrap="" class="m-tcol-c filter-30">|</td>
										<td class="delete _rosRestrict"><a href="#"
											class="m-tcol-c" id="postRemove">삭제</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 카페정보가 담긴 hidden form -->
					<form name="articleHeadModifyForm" action="/ArticleHeadModify.nhn">
						<input type="hidden" name="m" value="modifyInArticle"> <input
							type="hidden" name="cluburl" value="yulimhall"> <input
							type="hidden" name="clubid" value="29995789"> <input
							type="hidden" name="menuid" value="1"> <input
							type="hidden" name="articleid" value="2"> <input
							type="hidden" name="targetarticleheadid" value="">

						<!-- 말머리 -->
						<%-- <div id="headListLayer" class="ly_sbjt" style="top:88px;left:15px">
                            <ul>
                                <li class="_rosRestrict" value="-1"><a
                                        href=""><span>말머리없음</span></a>
                                </li>

                            </ul>
                        </div>--%>
					</form>

					<%--                    <div class="board-box-line-dashed"></div>--%>

					<!-- 작성자 이름, 카페url , 주소복사 버튼등 박스 -->
					<div class="etc-box">
						<div class="fl">
							<table role="presentation" cellspacing="0" cellpadding="0"
								border="0">
								<tbody>
									<tr>
										<td class="m-tcol-c b nick">
											<table role="presentation" cellspacing="0">
												<tbody>
													<tr>
														<td class="pc2w"><a
															href="/CafeMemberNetworkView.nhn?m=view&amp;clubid=29995789&amp;memberid=ued_123">
																<img
																src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png"
																width="24" height="24"
																onerror="this.onerror='';this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png';">
														</a></td>
														<td class="p-nick"><a href="#" class="m-tcol-c b"
															onclick="ui(event, 'ued_123',3,'이승헌','29995789','ma', 'true', 'false', 'yulimhall', 'true', '1'); return false;">
																${post.userCafeBoardVO.writer} </a></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="m-tcol-c step"></td>

									</tr>
								</tbody>
							</table>
						</div>
						<div class="fr">
							<table role="presentation" cellspacing="0" cellpadding="0"
								border="0">
								<tbody>
									<tr>
										<td valign="top" class="url" align="right"><span
											class="filter-50"> <a id="linkUrl"
												href="${post.cafeBoardUrl}" target="_top"
												class="m-tcol-c url-txt">
													${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${post.cafeBoardUrl}
											</a>
										</span> <span> <a href="#" onclick="return false;"
												class="_copyUrl url-btn" data-clipboard-action="copy"
												data-clipboard-target="#linkUrl"> <img
													src="https://cafe.pstatic.net/cafe4/btn-copy-add.gif"
													width="41" height="15" alt="주소복사" class="copy">
											</a>
										</span> <i class="ic_and"></i> <span class=""> <a href="#"
												id="naverStatArticleAnalysis" class="url-btn _stopDefault">
													<img
													src="https://ssl.pstatic.net/static/cafe/btn_statistic.png"
													width="62" height="15" alt="게시글분석" class="copy">
											</a>
										</span></td>
									</tr>
									<tr>
										<td id="sendPost_2" class="m-tcol-c" align="right"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<%--                    <div class="h-10"></div>--%>

					<!-- 게시글 글 내용 -->
					<!--  변경사항
                                                          기본 정렬: left
                          padding-left:43px -> 0px;                                                          
                     -->
					<div class="tbody m-tcol-c" id="tbody"
						style="text-align: left; width: 744px; padding-left:43px; padding-right: 43px; margin-right: 0px;">
						${post.userCafeBoardVO.content}</div>

					<!-- 게시글에 해댕하는 태그가 들어가는곳 -->
					<table role="presentation" cellspacing="0"
						class="tag_n_id tag_list_area">
						<tbody>
							<tr>
								<td class="tagarea">
									<div id="tagview" class="tag m-tcol-c">
										<div id="tagListArea">&nbsp;</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<!-- 게시글 더보기 -->
					<%--<table role="presentation" cellspacing="0" class="tag_n_id">
                        <tbody>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="idarea">

                                <div class="other_view m-tcol-c">
                                    <a href=""
                                       class="more m-tcol-c _rosRestrict"
                                       onclick="">이 작성자의 게시글 더보기</a>
                                </div>

                                <table role="presentation" cellspacing="0" cellpadding="0" align="right">
                                    <colgroup>
                                        <col>
                                        <col width="55">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td height="1" valign="top" colspan="2">
                                            <div class="per-info board-box-line"></div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                            </td>
                        </tr>
                        </tbody>
                    </table>--%>

					<%--                    <div class="h-35"></div>--%>

					<!-- 댓글의 좋아요 ,등록순 정렬 등 상태를 보여줌 -->
					<%-- <div class="reply-box" id="cmtMenu">
                        <div class="fl reply_sort">
                            <table role="presentation" cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                <tr style="vertical-align:top">

                                    <td class="reply">
                                        <a href="" class="reply_btn b m-tcol-c m-tcol-p _totalCnt"
                                           id="comment">댓글 0
                                        </a>
                                    </td>
                                    <td class="m-tcol-c filter-30">|</td>
                                    <td class="_sortList" style="padding:0;">
                                        <div style="position:relative;_top:3px;"><a href="#" class="b m-tcol-c"><span>등록순</span><span
                                                style="display:none">최신순</span><span id="cafe-menu"><span
                                                class="cafe-menu-tit"
                                                style="background:none; width:13px; height:13px; margin:0;"><span
                                                class="down-btn"
                                                style="background-position:0 0; background-repeat:no-repeat; vertical-align:top"><img
                                                height="13" width="13" alt=""
                                                src="https://cafe.pstatic.net/cafe4/hidden.gif"></span></span></span></a>
                                            <div class="perid-layer2" style="display:none;">
                                                <ul>
                                                    <li class="asc"><a href="#"><span>등록순</span></a></li>
                                                    <li class="desc"><a href="#"><span>최신순</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="m-tcol-c filter-30">|</td>

                                    <td><span class="b m-tcol-c reply ">조회수 </span><span
                                            class="b m-tcol-c reply">0</span></td>

                                    <td class="m-tcol-c filter-30">|</td>
                                    <td>
                                        <a href="#"
                                           class="b m-tcol-c like like_lst_btn _click(LikeItMember|LikeItMember|29995789|2) _stopDefault"
                                           id="likeItMemberBtn">좋아요
                                            <span id="cafe-menu"><span class="cafe-menu-tit"
                                                                     style="background:none; width:13px; height:13px; margin:0;"><span
                                                id="likeItArrow" class="down-btn"
                                                style="background-position:0 0; *background-position:0 0; background-repeat:no-repeat; vertical-align:top"><img
                                                height="13" width="13" alt=""
                                                src="https://cafe.pstatic.net/cafe4/hidden.gif"></span></span></span></a>

                                        <div class="u_likeit_list_module _reactionModule" data-sid="CAFE"
                                             data-cid="29995789_yulimhall_2" data-did="CAFE" data-catgid="29995789"
                                             data-loaded="1" data-facetype="0" style="visibility: visible;">
                                            <a href="#" class="u_likeit_list_btn _button off" data-type="like"
                                               data-log="art.like|art.unlike" aria-pressed="false">
                                                <span class="u_ico _icon"></span>
                                                <em class="u_cnt _count">0</em>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="fr cafe_spi">
                            <table role="presentation" cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                <tr>
                                    <td>


                                        <div id="spiButton" data-style="type_c" class="naver-splugin"
                                             data-url="https://cafe.naver.com/yulimhall/2" data-title="test"
                                             data-likeserviceid="CAFE" data-likecontentsid="29995789_yulimhall_2"
                                             data-option="{textClass: 'm-tcol-c', align: 'right', onLoginRedirect: parent.openLoginLayer}"
                                             data-cafe-source-type="111" data-cafe-source-title="test"
                                             data-blog-source-type="111" data-blog-source-title="test"
                                             data-blog-proxy-url="https://cafe.naver.com/CafeScrapContent.nhn?clubid=29995789&amp;articleid=2&amp;type=blog"
                                             data-cafe-proxy-url="https://cafe.naver.com/CafeScrapContent.nhn?clubid=29995789&amp;articleid=2&amp;type=cafe"
                                             data-me-display="off" data-oninitialize="splugin_oninitialize();"
                                             splugin-id="7795553956">
                                            <div class="_ly_spi spi_default" style="display: block;">
                                                <ul class="_spi_lst spi_lst">
                                                    <li class="_spi_blog spi_btn_blog"><a href="#" title="블로그 보내기"
                                                                                          class="_spi_blog"
                                                                                          target="_blank">블로그</a></li>
                                                    <li class="_spi_cafe spi_btn_cafe"><a href="#" title="카페 보내기"
                                                                                          class="_spi_cafe"
                                                                                          target="_blank">카페</a></li>
                                                    <li class="_spi_keep spi_btn_keep"><a href="#" title="Keep 보내기"
                                                                                          class="_spi_keep"
                                                                                          target="_blank">Keep</a></li>
                                                    <li class="_spi_memo spi_btn_memo"><a href="#" title="메모 보내기"
                                                                                          class="_spi_memo"
                                                                                          target="_blank">메모</a></li>
                                                    <li class="_spi_release_cont _spi_release_btn spi_btn_release"><a
                                                            href="#" class="_spi_release m-tcol-c"
                                                            title="기타 보내기 펼치기"><span
                                                            class="_spi_release spi_bg_release"></span>보내기<em
                                                            class="_spi_release " style="display: block"></em></a></li>
                                                </ul>
                                                <div class="_spi_ly_bmk_ok spi_ly_pop"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">북마크 되었습니다.<br> <a
                                                        href="http://me.naver.com/tab/bookmark.nhn" target="_blank"
                                                        class="_ly_bmk_ok_cls _ly_bmk_lnk spi_impact">네이버 북마크 가기</a></p>
                                                    <button class="_ly_bmk_ok_cls spi_close" type="button"><span
                                                            class="_ly_bmk_ok_cls" title="북마크 레이어 닫기"></span><em
                                                            class="_ly_bmk_ok_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_bmk_cnf spi_ly_pop spi_ly_pop_v2"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">현재 북마크 되어 있습니다.<br>북마크를 해제하시겠습니까?</p>
                                                    <div class="spi_btn"><a href="#" class="_ly_bmk_cnf_y spi_y "
                                                                            target="_blank"><span
                                                            class="_ly_bmk_cnf_y"></span>예</a> <a href="#"
                                                                                                  class="_ly_bmk_cnf_n spi_n "
                                                                                                  target="_blank"><span
                                                            class="_ly_bmk_cnf_n"></span>아니오</a></div>
                                                    <button class="_ly_bmk_cnf_cls spi_close" type="button"><span
                                                            class="_ly_bmk_cnf_cls" title="북마크 레이어 닫기"></span><em
                                                            class="_ly_bmk_cnf_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_bmk_err spi_ly_pop"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">서버 접속이 원활하지 않습니다.<br> 잠시 후 다시 시도해 주십시오.</p>
                                                    <button class="_ly_bmk_err_cls spi_close" type="button"><span
                                                            class="_ly_bmk_err_cls" title="북마크 레이어 닫기"></span><em
                                                            class="_ly_bmk_err_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_bmk_ros spi_ly_pop"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">북마크 서비스 점검 중으로,<br>현재 북마크 읽기만 가능하오니<br>이용에 참고해
                                                    주시기 바랍니다.</p>
                                                    <button class="_ly_bmk_ros_cls spi_close" type="button"><span
                                                            class="_ly_bmk_ros_cls" title="북마크 레이어 닫기"></span><em
                                                            class="_ly_bmk_ros_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_keep_ok spi_ly_pop spi_ly_pop_v2"
                                                     style="left: -91px; top: 33px; width: 255px;display:none;"><p
                                                        class="spi_dsc">Keep에 저장되었습니다.</p>
                                                    <div class="spi_btn"><a href="#" class="_ly_keep_lnk spi_y "
                                                                            onclick="return false;">목록보기</a> <a href="#"
                                                                                                                class="_ly_keep_edt spi_n "
                                                                                                                onclick="return false;">편집하기</a>
                                                    </div>
                                                    <button type="button" class="_ly_keep_ok_cls spi_close"><span
                                                            class="_ly_keep_ok_cls"></span><em
                                                            class="_ly_keep_ok_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_keep_cnf spi_ly_pop"
                                                     style="left: -91px; top: 33px; width: 255px;display:none;"><p
                                                        class="spi_dsc">이미 Keep에 저장되었습니다.<br>목록에서 확인하시겠습니까?<br> <a
                                                        href="#" class="_ly_keep_lnk spi_impact"
                                                        onclick="return false;">Keep 목록 가기</a></p>
                                                    <button type="button" class="_ly_keep_cnf_cls spi_close"><span
                                                            class="_ly_keep_cnf_cls"></span><em
                                                            class="_ly_keep_cnf_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_keep_err spi_ly_pop"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">서버 접속이 원활하지 않습니다.<br> 잠시 후 다시 시도해 주십시오.</p>
                                                    <button class="_ly_keep_err_cls spi_close" type="button"><span
                                                            class="_ly_keep_err_cls" title="Keep 레이어 닫기"></span><em
                                                            class="_ly_keep_err_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_keep_ros spi_ly_pop"
                                                     style="display:none;left: -78px; top: 20px; width: 253px;"><p
                                                        class="spi_dsc">북마크 서비스 점검 중으로,<br>현재 북마크 읽기만 가능하오니<br>이용에 참고해
                                                    주시기 바랍니다.</p>
                                                    <button class="_ly_keep_ros_cls spi_close" type="button"><span
                                                            class="_ly_keep_ros_cls" title="Keep 레이어 닫기"></span><em
                                                            class="_ly_keep_ros_cls">X</em></button>
                                                </div>
                                                <div class="_spi_ly_pop spi_ly_pop ly_pop_v1"
                                                     style="display:none;top: -82px; left: 136px; width: 213px"><p
                                                        class="_ly_pop spi_dsc">이 __feed_info__ 마음에 드셨다면<br><a
                                                        href="http://me.naver.com/" target="_blank"
                                                        class="_ly_pop_lnk _ly_pop spi_impact">네이버 MY구독</a>에서 편하게 받아보세요.
                                                </p>
                                                    <div class="_ly_pop spi_ico_arr spi_ico_right"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="m-tcol-c filter-30">|</td>
                                    <td><a href="#"
                                           onclick="showArticleScraplayer(); saveScrapArticleId('2', '1', 'Y'); return false;"
                                           class="m-tcol-c _rosRestrict btn_ly_open"><span class="blind"></span></a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>--%>

					<!-- 댓글 박스 -->
					<div class="box-reply2 bg-color u_cbox" id="hAJ52"
						style="display: block; width:770px">
						<!-- 댓글 리스트  -->
						<ul class="cmlist" id="cmt_list"></ul>
						<div style="clear: both; height: 0pt; font: 0pt/0pt arial;"></div>
						<div style="display: none;" class="cc_paginate cmt"
							id="cmt_paginate"></div>

						<table cellspacing="0" class="cminput">
							<tbody>
								<tr>
									<td class="i2">
										<div class="comm_write_wrap border-sub skin-bgcolor">
											<textarea id="comment_text" cols="50" rows="2"
												class="textarea m-tcol-c" maxlength="6000"
												style="overflow: hidden; line-height: 14px; height: 39px;"
												title="댓글입력"></textarea>
											<div class="u_cbox_upload_image" style="display: none"></div>
										</div>
									</td>
									<td class="i3">
										<div class="u_cbox_btn_upload _submitBtn">
											<a href="#" class="u_cbox_txt_upload _submitCmt">등록</a>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<ul class="u_cbox_addition">
											<li>
												<div class="_stickerBtn u_cbox_btn_upload_sticker">
													<span class="u_cbox_ico_upload_sticker"></span> <span
														class="m-tcol-c u_cbox_txt_upload_sticker">스티커</span> <a
														href="#" class="u_cbox_link_wrap"
														onclick="clickcr(this,'cmt.sticker', '', '', event)">스티커
														레이어 팝업</a>
												</div>

												<div class="line_stc_sec">
													<div class="se2_line_layer">
														<div class="se2_in_layer">
															<div class="se2_line_sticker">
																<button type="button" title="이전" class="se2_prev"
																	disabled="">
																	<span>이전</span>
																</button>
																<ul class="se2_line_sticker_set">
																</ul>
																<button type="button" title="다음" class="se2_next">
																	<span>다음</span>
																</button>
															</div>
														</div>

													</div>

												</div>
											</li>
											<li>
												<div class="u_cbox_btn_upload_photo">
													<div class="_imageBtn u_cbox_btn_file">
														<label for="attachImageBtn2"
															onclick="clickcr(this,'cmt.image', '', '', event);">업로드</label>
														<input type="file" id="attachImageBtn2" accept="Image/*">
													</div>
													<span class="u_cbox_ico_upload_photo"></span> <span
														class="m-tcol-c u_cbox_txt_upload_photo">사진</span>
												</div>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="m-tcol-c reply_error" style="display: none;">
							<strong>죄송합니다. 댓글 시스템 오류로 댓글을 읽거나 쓸 수 없습니다.</strong> 문제가 지속될 경우 <a
								href="http://help.naver.com/" target="_blank" class="m-tcol-c">고객센터</a>에
							알려주시면 친절하게 안내해 드리겠습니다.
						</div>
					</div>

					<%-- <div id="likeItMemberArea" class="box-reply3 bg-color" style="display:none;">
                        <div id="likeItMemberList" class="like_area">
                            <h3 class="tit m-tcol-c">이 글에 좋아요한 멤버</h3>
                            <div class="filter-30 board-box-line-dashed"></div>
                            <ul id="memberList" class="like_list"></ul>
                            <div class="board-box-line-dashed"></div>
                            <div style="display: block;" class="cc_paginate cmt" id="cmt_paginate"></div>
                        </div>
                        <div id="likeItEmptyList" class="like_empty" style="display: none;">이 글에 좋아요한 멤버가 없습니다. 가장먼저
                            좋아요를 눌러보세요.
                        </div>
                    </div>--%>
				</div>
			</div>

			<!-- 다음글 목록 태그 -->
			<div class="list-btn-nor2 upper-list">
				<div class="fl">

					<%--                    <div style="display:none;" class="btn2"></div>--%>

					<div class="btn2">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c"> <img
								src="https://cafe.pstatic.net/cafe4/ico-btn-net_.gif" width="6"
								height="5" alt="">다음글
							</a>
						</p>
					</div>

				</div>

				<div class="fr">
					<div class="btn2">
						<span></span>
						<p>
							<a href="#" class="m-tcol-c">목록</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 답글 -->
			<%--<div class="list-btn-nor">
                <div class="fr">

                    <div id="writeFormBtn" class="btn _rosRestrict"><span></span>
                        <p><strong><a href="#" class="m-tcol-c b">
                            <img
                                src="https://cafe.pstatic.net/cafe4/ico-btn-write.gif" width="10" height="10" alt="">글쓰기</a></strong>
                        </p></div>


                    <div id="replyFormBtn" class="btn _rosRestrict"><span></span>
                        <p><a href="#" class="m-tcol-c"><img src="https://cafe.pstatic.net/cafe4/ico-btn-check.gif"
                                                             width="9" height="8" alt="">답글</a></p></div>


                    <div id="modifyFormBtn" class="btn _rosRestrict"><span></span>
                        <p><a href="#" class="m-tcol-c" onclick="clickcr(this,'abt.edit', '', '', event);">수정</a></p>
                    </div>


                    <div class="btn _rosRestrict" onclick="checkLogin('move');"><span></span>
                        <p><a href="#" class="m-tcol-c">이동</a></p></div>


                    <div class="btn _rosRestrict" onclick="checkLogin('delete');"><span></span>
                        <p><a href="#" class="m-tcol-c">삭제</a></p></div>

                    <div class="btn" onclick="goList();"><span></span>
                        <p><a href="#" class="m-tcol-c">목록</a></p></div>
                </div>
            </div>--%>

			<div class="h-20"></div>

			<!-- top 버튼 -->
			<%--  <div class="btn-top"><a href="#" onclick="parent.setTopInIframe();"
                                    class="m-tcol-c filter-50 display-inblock"><span>▲</span> top</a></div>--%>
			<div class="h-35"></div>


			<div class="article-board article_prenet">
				<table cellspacing="0" cellpadding="0" border="0" width="100%">
					<colgroup>
						<col width="81">
						<col width="*">
						<col width="120">
						<col width="92">
					</colgroup>
					<tbody>
						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>
						<tr align="center">
							<td class="prev_btn"><a href="#"
								onclick="goNext();clickcr(this,'art.next','','',event);"
								class="m-tcol-c"><img
									src="https://cafe.pstatic.net/cafe4/ico-btn-net2_.gif" alt="">다음글</a></td>
							<td align="left" class="board-list"><span class="aaa">
									<a href="#"
									onclick="goNext();clickcr(this,'art.next','','',event);"
									class="m-tcol-c">유림회관 카페를 시작합니다.</a>
							</span></td>
							<td align="left">
								<div class="pers_nick_area">
									<table role="presentation" cellspacing="0">
										<tbody>
											<tr>
												<td class="p-nick"><a href="#" class="m-tcol-c"
													onclick="ui(event, 'ued_123',3,'이승헌','29995789','ma', 'true', 'false', 'yulimhall', 'true', '1'); return false;">이승헌</a><span
													class="mem-level"></span></td>
											</tr>
										</tbody>
									</table>
								</div>

							</td>
							<td class="view-count m-tcol-c">2020.02.01.</td>
						</tr>
						<tr>
							<td colspan="4" class="board-line"></td>
						</tr>


					</tbody>
				</table>
			</div>

			<span id="_noticeColor" class="m-tcol-p" style="display: none">font</span>
			<div class="power_ad">
				<div id="powerAd-div" style="display: block;"></div>
			</div>

			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<div id="sendPostLayer_2" class="introduction_list"
				style="top: 0; left: -999px; position: absolute">
				<ul id="sendPostLayerDiv_2">
				</ul>
				<a onclick="" href="#" class="layer_close"><img
					src="https://cafe.pstatic.net/editor/btn_layer_close2.gif"
					width="13" height="12" alt="레이어 닫기"></a>
			</div>
		</div>
	</div>


	<form name="frmModify" method="get" style="display: none"
		action="/ArticleWrite.nhn">

		<input type="hidden" name="boardtype" value="L"> <input
			type="hidden" name="articleid" value="2"> <input
			type="hidden" name="clubid" value="29995789"> <input
			type="hidden" name="referrerAllArticles" value="true"> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="m" value="modify">

	</form>


	<form name="frmDelete" method="post" action="/ArticleDelete.nhn"
		style="display: none">

		<input type="hidden" name="boardtype" value="L"> <input
			type="hidden" name="articleid" value="2"> <input
			type="hidden" name="clubid" value="29995789"> <input
			type="hidden" name="referrerAllArticles" value="true"> <input
			type="hidden" name="page" value="1">


	</form>


	<div id="divScrapForm" style="display: none"></div>
	<iframe name="frameArticleScrap" title="스크랩영역" id="frameArticleScrap"
		src="" width="0" height="0" frameborder="0" scrolling="no"
		style="display: inline"></iframe>
	<iframe name="frameArticleMain" title="대문등록영역" id="frameArticleMain"
		src="" width="0" height="0" frameborder="0" scrolling="no"
		style="display: none"></iframe>


	<div id="divSavedScrapClubId" style="display: none"></div>
	<div id="divSavedScrapArticleId" style="display: none"></div>
	<div id="divSavedScrapMenuId" style="display: none"></div>
	<div id="divSavedScrapReplyYn" style="display: none"></div>

	<form name="frmPrint" method="post" action="/ArticlePrint.nhn"
		style="display: none">
		<input type="hidden" name="clubid" value="29995789"> <input
			type="hidden" name="articleid" value="2">
	</form>


	<div
		style="display: none; width: 342px; position: absolute; left: 100px; top: 0px; overflow: hidden"
		id="emoticon">
		<table role="presentation" width="342" cellspacing="1" cellpadding="1"
			border="0" style="background-color: #C7C7C9;">
			<colgroup>
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
				<col width="9%">
			</colgroup>
			<tbody>
				<tr align="center" style="background-color: #FFFFFF;">
					<td><img id="emo11"
						src="https://cafe.pstatic.net/img/emot/emo11.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo13"
						src="https://cafe.pstatic.net/img/emot/emo13.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo15"
						src="https://cafe.pstatic.net/img/emot/emo15.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo17"
						src="https://cafe.pstatic.net/img/emot/emo17.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo19"
						src="https://cafe.pstatic.net/img/emot/emo19.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo21"
						src="https://cafe.pstatic.net/img/emot/emo21.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo23"
						src="https://cafe.pstatic.net/img/emot/emo23.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo25"
						src="https://cafe.pstatic.net/img/emot/emo25.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo30"
						src="https://cafe.pstatic.net/img/emot/emo30.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo32"
						src="https://cafe.pstatic.net/img/emot/emo32.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo27"
						src="https://cafe.pstatic.net/img/emot/emo27.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
				</tr>
				<tr align="center" style="background-color: #FFFFFF;">
					<td><img id="emo12"
						src="https://cafe.pstatic.net/img/emot/emo12.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo14"
						src="https://cafe.pstatic.net/img/emot/emo14.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo16"
						src="https://cafe.pstatic.net/img/emot/emo16.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo18"
						src="https://cafe.pstatic.net/img/emot/emo18.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo20"
						src="https://cafe.pstatic.net/img/emot/emo20.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo22"
						src="https://cafe.pstatic.net/img/emot/emo22.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo24"
						src="https://cafe.pstatic.net/img/emot/emo24.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo26"
						src="https://cafe.pstatic.net/img/emot/emo26.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo31"
						src="https://cafe.pstatic.net/img/emot/emo31.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo29"
						src="https://cafe.pstatic.net/img/emot/emo29.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
					<td><img id="emo28"
						src="https://cafe.pstatic.net/img/emot/emo28.gif"
						style="cursor: pointer;" width="16" height="17" alt="퍼스나콘"></td>
				</tr>
			</tbody>
		</table>
	</div>


	<form name="cafeCmtSubmit" method="POST" action="" target="">
		<input type="hidden" name="content" value=""> <input
			type="hidden" name="clubid" value="29995789"> <input
			type="hidden" name="menuid" value="1"> <input type="hidden"
			name="articleid" value=""> <input type="hidden" name="m"
			value="write"> <input type="hidden" name="commentid" value="">
		<input type="hidden" name="refcommentid" value=""> <input
			type="hidden" name="emotion" id="emotion" value="11"> <input
			type="hidden" name="orderby" value=""> <input type="hidden"
			name="replyToMemberId" value=""> <input type="hidden"
			name="replyToNick" value=""> <input type="hidden"
			name="csKey" value=""> <input type="hidden" name="csValue"
			value=""> <input type="hidden" name="branchCode"
			value="OqHQoT7gICe3mKXjGrp0J8S99mfJatFNHu1Ohp7egogWatYLRdvjyW3RxStAonNMJnVof5+jslfi4Qg8Wjx/2O9xyKJniQBOI6JDuHctoF0urTNsLnKBpGCMHV5zz9/W4+faqualM5/mM2sNMkpygQ==">
		<input type="hidden" name="stickerId" value=""> <input
			type="hidden" name="imagePath" value=""> <input type="hidden"
			name="imageFileName" value=""> <input type="hidden"
			name="imageWidth" value=""> <input type="hidden"
			name="imageHeight" value="">
	</form>
	<iframe name="hiddenIF" title="빈프레임"
		style="width: 0px; height: 0px; display: none;" border="0"
		id="hiddenIF"></iframe>

	<iframe name="hiddenIF" title="빈프레임"
		style="width: 0px; height: 0px; display: none;" border="0"
		id="hiddenIF"></iframe>


	<div id="authLayer" style="top: 86px; left: 58px; display: none;"
		class="experience_help_layer">
		<h4>본 게시글 작성자는 본인인증을 하지 않았습니다.</h4>
		<a class="btn_close" href="#"
			onclick="Element.hide('authLayer'); return false;" role="button"><img
			width="16" height="15" alt="닫기"
			src="https://cafe.pstatic.net/cafe4//btn_layer_close3.gif"></a>
		<p>
			상품등록게시판에 게시글을 작성할 때에는 온라인 아이디의 사용자가 본인임을 확인하는 '본인인증'을 거칩니다.<br>단,
			직접거래인 경우 본인인증을 나중에 할 수 있도록 제공하고 있습니다.
		</p>
		<div class="layer_position"></div>
	</div>

	<div id="oTnLayer" class="comm_layer"
		style="display: none; width: 355px; top: 110px; left: 130px;">
		<p class="safenum-box1">
			본 게시글의 작성자는 개인정보보호를 위하여 일회용 안심 전화번호<br> 기능을 이용하고 있습니다.
		</p>
		<div class="safenum-box2">
			<div>
				판매자 정보 <em id="oTnPhoneNo">0</em><img
					src="https://cafe.pstatic.net/cafe4/ico_indicator_hp.gif"
					id="mobileIcon" width="8" height="12" alt="휴대폰" class="vt"><br>
				연락 가능 기간 : <em id="oTnPeriod"></em>
			</div>
		</div>
		<ul class="safenum-box3">
			<li>일회용 안심 전화번호로 전화를 걸면 판매자의 실제 연락처로 연결되며,<br> 기존의 통화료 외
				부가이용료가 없습니다.<br> (판매자의 실제 연락처가 휴대폰 번호인 경우, 안심 전화번호 옆에<br>
				휴대폰 아이콘이 표시되며 문자 발신도 가능합니다.)
			</li>
			<li><strong>거래를 진행하실 경우 판매자의 실제 전화번호를 확인해두시는<br>
					것이 좋습니다.
			</strong><br> (안전결제 이용 시에는 실제 전화번호 확인이 가능합니다.)</li>
		</ul>
		<div class="btn_box">
			<a href="#" onclick="Element.hide('oTnLayer'); return false;"><img
				src="https://cafe.pstatic.net/cafe4/btn_confirm9.gif" alt="확인"></a>
		</div>
		<a href="#" onclick="Element.hide('oTnLayer'); return false;"
			class="closelayer"><img
			src="https://cafe.pstatic.net/cafe4/btn_close4.gif" width="19"
			height="19" alt="닫기"></a>
	</div>

	<div id="layer_msg">

		<div id="sellerInfoShowGuide" class="comm_layer2"
			style="width: 351px; top: 320px; right: 15px; display: none;">
			<div class="box01">
				<p class="safe_conatact" style="text-align: left;">
					판매완료 또는 글이 수정된 지 <strong style="color: #6fb543">한달이 지난 경우</strong><br>연락처,
					이메일이 노출되지 않습니다.
				</p>
				<div class="btns">
					<a href="#"
						onclick="Element.hide('sellerInfoShowGuide'); return false;"><img
						src="https://cafe.pstatic.net/editor/btn_confirm2.gif" alt="확인"
						height="28" width="48"></a>
				</div>
				<a href="#"
					onclick="Element.hide('sellerInfoShowGuide'); return false;"
					class="btn_close" role="button"><img
					src="https://cafe.pstatic.net/editor/btn_close3.gif" alt="닫기"
					height="19" width="19"></a>
			</div>
		</div>
		<div class="comm_layer2"
			style="width: 351px; top: 370px; right: 434px; display: none;"
			id="escrowLayer">
			<div class="box01">
				<p class="warning_message" style="text-align: left;">
					<strong>안전거래 안내</strong><br> 안전거래란 거래대금을 안전거래 업체가 맡아두었다가 <strong
						class="dc_1">구매자가 물품을 받은 것을 확인 후, 판매자에게 거래대금을 지불하는 방식</strong>으로
					사기를 예방할 수 있습니다.<br>
					<br>물품을 받지 못했거나, 반품할 경우에는 업체를 통해 즉시 환불 받을 수 있습니다.
				</p>
				<div class="btns">
					<a href="#" onclick="Element.hide('escrowLayer'); return false;"><img
						src="https://cafe.pstatic.net/editor/btn_confirm2.gif" alt="확인"
						height="28" width="48"></a>
				</div>
				<a href="#" onclick="Element.hide('escrowLayer'); return false;"
					class="btn_close" role="button"><img
					src="https://cafe.pstatic.net/editor/btn_close3.gif" alt="닫기"
					height="19" width="19"></a>
			</div>
			<iframe name="blank_t" title="빈프레임"
				style="width: 345px; height: 178px;" frameborder="0"></iframe>
		</div>

		<div id="malwareDetectingLayer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter">
				<h2>악성코드가 포함되어 있는 파일입니다.</h2>
				<p id="malwareFileName" class="file _ellipsis _param(200)">
					<br>
				</p>
				<p>
					백신 프로그램으로 치료하신 후 다시 첨부하시거나, 치료가 어려우시면<br> 파일을 삭제하시기 바랍니다
				</p>
				<a href="http://security.naver.com/index.nhn" target="_blank"
					class="vaccine_link">네이버 백신으로 치료하기</a>
				<p class="info_text">
					고객님의 PC가 악성코드에 감염될 경우 시스템성능 저하,<br> 개인정보 유출등의 피해를 입을 수 있으니
					주의하시기 바랍니다.
				</p>
				<div class="btns">
					<a href="#" id="malwareFileUrl"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 245px;"> </iframe>
		</div>

		<div id="copyrightDetectingLayer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter">
				<h2>저작권이 있는 파일입니다.</h2>
				<p id="copyrightFileName" class="file _ellipsis _param(200)">
					<br>
				</p>
				<p>본 파일은 저작권자의 요청에 의해 보호되고 있어 등록자 본인만 다운로드 가능합니다.</p>
				<!-- <a href="http://security.naver.com/index.nhn" target="_blank" class="vaccine_link">파일 제한 상세내용 보기</a> -->
				<p class="info_text">
					저작권이 있는 파일의 등록 및 공유로 인해 저작권자의 권리침해 등의<br> 피해가 발생하지 않도록 주의하시기
					바랍니다.
				</p>
				<div class="btns">
					<a href="#" id="copyrightFileUrl"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 245px;"> </iframe>
		</div>

		<div id="block_infringement_layer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter layer_filter2">
				<h2>고객님외에 다른 방문자에게는 이용이 제한되었습니다.</h2>
				<p>
					이 파일은 <em>저작권 침해의 우려가 있는 내용이 포함</em>되어 있어<br> 고객님외의 다른 방문자가
					다운로드 할 수 없도록<br> 이용이 제한되었습니다.
				</p>
				<p class="rst">
					<span id="block_infringement_name" class="_ellipsis _param(350)">이용제한
						파일 :</span>
				</p>
				<div class="btns">
					<a href="#" id="block_infringement_url"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 165px;"> </iframe>
		</div>

		<div id="block_common_layer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter layer_filter2">
				<h2>고객님외에 다른 방문자에게는 이용이 제한되었습니다.</h2>
				<p>
					이 파일은 <em>서비스 운영원칙에서 제한하는 내용이 포함</em>되어 있어<br> 고객님외의 다른 방문자가
					다운로드 할 수 없도록<br> 이용이 제한되었습니다.
				</p>
				<p class="rst">
					<span id="block_common_name" class="_ellipsis _param(350)">이용제한
						파일 :</span>
				</p>
				<div class="btns">
					<a href="#" id="block_common_url"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 165px;"> </iframe>
		</div>

		<div id="suspend_infringement_layer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter layer_filter2">
				<h2>고객님외에 다른 방문자에게는 이용이 제한되었습니다.</h2>
				<p>
					이 파일은 <em>저작권법 제103조(복제 전송의 중단)</em>에 따라<br> 저작권자의 요청에 의해
					고객님외의 다른 방문자가<br> 다운로드 할 수 없도록 이용이 제한되었습니다.
				</p>
				<p class="rst">
					<span id="suspend_infringement_name" class="_ellipsis _param(350)">이용제한
						파일 :</span>
				</p>
				<div class="btns">
					<a href="#" id="suspend_infringement_url"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 165px;"> </iframe>
		</div>

		<div id="suspend_defamation_layer" class="comm_layer2"
			style="display: none; width: 390px; top: 127px; right: 12px;">
			<div class="box01 layer_hashfilter layer_filter2">
				<h2>고객님외에 다른 방문자에게는 이용이 제한되었습니다.</h2>
				<p>
					이 파일은 정보통신망이용촉진및정보보호등에 관한<br> 법률 제44조의2에 따라 관련 당사자의 요청에 의해<br>
					<em>사생활침해/명예훼손의 사유</em>로 고객님외의 다른 방문자가<br> 다운로드 할 수 없도록 이용이
					제한되었습니다.
				</p>
				<p class="rst">
					<span id="suspend_defamation_name" class="_ellipsis _param(350)">이용제한
						파일 :</span>
				</p>
				<div class="btns">
					<a href="#" id="suspend_defamation_url"><img
						src="https://cafe.pstatic.net/img/malware/btn_download.gif"
						width="73" height="26" alt="다운로드"></a> <a href="#"
						onclick="oCL.hide(); return false;"><img
						src="https://cafe.pstatic.net/img/malware/btn_cancel.gif"
						width="45" height="26" alt="취소"></a>
				</div>
				<a href="#" onclick="oCL.hide(); return false;" class="close"><img
					src="https://cafe.pstatic.net/img/malware/btn_close3.gif"
					width="19" height="19" border="0" alt="닫기"></a>
			</div>
			<iframe name="blank_t" title="빈프레임" frameborder="0"
				style="width: 390px; height: 165px;"> </iframe>
		</div>


		<div id="fraudLayer1" class="comm_layer2"
			style="width: 385px; top: 300px; right: 20px; display: none;">
			<div id="fraudLayerBody" class="inquiry_commerce ask_none">
				<h3 class="commerce_fraud_title">사기정보조회</h3>
				<fieldset>
					<legend>전화번호 입력 영역</legend>

					<div class="form_commerce">
						<div class="input_commerce">
							<input id="fraudLayerInputbox" type="text" class="keyup_commerce"
								title="전화번호 또는 계좌번호 입력 영역" placeholder="전화번호 또는 계좌번호 입력"
								value="">
							<button
								onclick="FraudSearch(this,'29995789'); clickcr(this,'gdb.cheatsch','','',event); return false"
								type="submit" class="submit_commerce">조회</button>
						</div>
					</div>

					<div id="fraudLayerList" class="list_commerce">
						<p class="recent_text_commerce">최근 3개월 내 더치트에 등록된 사기 피해사례를
							조회합니다.</p>
					</div>

					<div class="harm_commerce">
						<p>피해사례가 등록된 시점에 따라 더치트와 일부 차이가 날 수 있습니다.</p>
						<a id="fraudLayerAddinfo" href="#" aria-label="추가정보조회"
							style="display: none;" target="_blank"
							onclick="clickcr(this,'gdb.cheatres','','',event);"><span
							class="sp_end btn_inquiry" role="img"></span></a>
					</div>


				</fieldset>
			</div>
			<a href="#" onclick="Element.hide('fraudLayer1'); return false;"
				class="btn_close"><img
				src="https://cafe.pstatic.net/editor/btn_close3.gif" alt="닫기"
				height="19" width="19"></a>
		</div>


		<!-- 구매자 안전거래 신청 + 구매자 안전거래 이용 방법 레이어 -->
		<div id="safetyPaymentGuideLayer" class="comm_layer3 safety_deal"
			style="width: 513px; top: 290px; right: 14px; margin-top: 4px; z-index: 10000; display: none;">
			<h3>구매자 안전거래 신청 안내</h3>
			<p class="safety_deal_text">
				안전거래란 안전거래 업체가 거래대금을 맡아두었다가 구매자가 물품을 받은 것을 확인 후, 판매자에게 거래대금을 지불하는
				방식으로 사기를 예방할 수 있습니다.<br>
				<br>구매자가 안전거래를 신청하면 안전하게 거래하실 수 있습니다.
			</p>

			<h3>구매자 안전거래 이용 방법</h3>

			<table cellpadding="0" cellspacing="0" class="deal_area v4">
				<caption>
					<span class="blind">구매자 안전거래 이용 안내</span>
				</caption>
				<colgroup>
					<col style="width: 110px;">
					<col style="width: 363px;">
				</colgroup>

				<tbody>
					<tr>
						<th scope="col" class="first"><em class="safety_deal_step">STEP1</em>
							구매자신청</th>
						<td>카페 게시글 내 구매자 안전거래 신청 버튼을 클릭하면 유니크로 페이지에서 신청에 필요한 정보를
							입력합니다.</td>
					</tr>
					<tr>
						<th scope="col" class="first"><em class="safety_deal_step">STEP2</em>
							판매자알림</th>
						<td>판매자에게 안전거래 신청을 받았다는 알림 메일과 문자 메시지가 발송됩니다.</td>
					</tr>
					<tr>
						<th scope="col" class="first"><em class="safety_deal_step">STEP3</em>
							판매자등록</th>
						<td>판매자는 메일에 기재된 인증번호로 유니크로에 상품을 등록합니다.</td>
					</tr>
					<tr>
						<th scope="col" class="first"><em class="safety_deal_step">STEP4</em>
							구매자알림</th>
						<td>구매자에게 상품이 등록되었다는 알림 메일과 문자 메시지가 발송됩니다.</td>
					</tr>
					<tr>
						<th scope="col" class="first"><em class="safety_deal_step">STEP5</em>
							구매자결제</th>
						<td>구매자는 상품을 결제합니다.</td>
					</tr>
				</tbody>
			</table>

			<div class="deal_list">
				<ul class="deal_list_info">
					<li>구매자 안전거래는 유니크로((주)다우기술)의 책임하에 운영됩니다.</li>
					<li>구매자 안전거래 문의 : <a href="http://www.unicro.co.kr"
						target="_blank">www.unicro.co.kr</a> (1588-6295)
					</li>
				</ul>
			</div>

			<div class="btns">
				<a href="#" onclick="showSafetyPaymentGuideLayer(); return false;"><img
					src="https://cafe.pstatic.net/editor/btn_confirm2.gif" alt="확인"
					height="28" width="48"></a>
			</div>
			<a href="#" onclick="showSafetyPaymentGuideLayer(); return false;"
				class="btn_close"><img
				src="https://cafe.pstatic.net/editor/btn_close3.gif" alt="닫기"
				height="19" width="19"></a>
		</div>
		<!-- // 구매자 안전거래 신청 + 구매자 안전거래 이용 방법 레이어 -->
	</div>

	<div style="display: none; top: 230px; right: 44px;"
		class="safety_trade_layer" id="buyEscrowGuideLayer">
		<h3>구매자 안전거래 신청 안내</h3>
		<a class="btn_close" href="#"
			onclick="Element.hide('buyEscrowGuideLayer'); return false;"
			role="button"><img width="19" height="19" alt="닫기"
			src="https://cafe.pstatic.net/cafe4/btn_close4.gif"></a>
		<p class="dc_1">
			전문업체의 에스크로 결제방식을 이용하여 판매자가 등록한 상품을 안심하고 <br>구매하실 수 있습니다.
		</p>
		<h4>구매자 안전거래 이용 방법</h4>
		<ol>
			<li>
				<h5>1. 구매자 신청</h5>
				<p>
					카페 게시글 내 구매자 안전거래 신청 버튼을 클릭하면<br>유니크로 페이지에서 신청에 필요한 정보를 입력합니다.
				</p>
			</li>
			<li>
				<h5>2. 판매자 알림</h5>
				<p>
					판매자에게 안전거래 신청을 받았다는 알림 메일과 문자<br>메시지가 발송됩니다.
				</p>
			</li>
			<li>
				<h5>3. 판매자 등록</h5>
				<p>
					판매자는 유니크로에 가입하여 메일에 기재된 인증번호로<br>상품을 등록합니다.
				</p>
			</li>
			<li>
				<h5>4. 구매자 알림</h5>
				<p>구매자에게 상품이 등록되었다는 알림 메일과 문자 메시지가 발송됩니다.</p>
			</li>
			<li>
				<h5>5. 구매자 결제</h5>
				<p>구매자는 상품을 결제합니다.</p>
			</li>
		</ol>
		<ul>
			<li>구매자 안전거래는 유니크로(㈜다우기술)의 책임하에 운영됩니다.</li>
			<li>구매자 안전거래 문의 : <span>www.unicro.co.kr (1588-6295)</span></li>
		</ul>
		<div class="btn_box">
			<a href="#"
				onclick="Element.hide('buyEscrowGuideLayer'); return false;"><img
				src="https://cafe.pstatic.net/editor/btn_confirm2.gif"></a>
		</div>
	</div>

	<div id="confirm_writenew_2" class="comm_layer"
		style="display: none; width: 326px;">
		<p class="dc_1">
			이 게시글을 현재 게시판의 새 글로 다시 등록하시겠습니까? <br> 현재글은 ‘판매완료’ 상태로 자동변경됩니다.<br>
			<span>일 1회, 총 3회 사용 가능</span>
		</p>
		<p class="dc_2">
			<strong>수락 하시겠습니까?</strong>
		</p>
		<div class="btn_box">
			<a href="#"
				onclick="doSubmitForSaleArticle_2('writenew'); clickcr(this,'gdb.newok','','',event); return false;"><img
				src="https://cafe.pstatic.net/cafe4/btn_confirm9.gif" alt="확인"></a>
			<a href="#"
				onclick="Element.hide('confirm_writenew_2'); return false;"><img
				src="https://cafe.pstatic.net/cafe4/btn_cancel2.gif" width="48"
				height="28" alt="취소"></a>
		</div>
		<a href="#"
			onclick="Element.hide('confirm_writenew_2'); return false;"
			class="closelayer"><img
			src="https://cafe.pstatic.net/cafe4/btn_close4.gif" width="19"
			height="19" alt="닫기"></a>
	</div>

	<div id="confirm_soldout_2" class="comm_layer"
		style="display: none; width: 214px;">
		<p class="dc_1">
			판매완료로 변경하시겠습니까?<br> 다시 판매중으로 되돌릴 수 없습니다.
		</p>
		<p class="dc_2">
			<strong>수락 하시겠습니까?</strong>
		</p>
		<div class="btn_box">
			<a href="#"
				onclick="doSubmitForSaleArticle_2('soldout'); clickcr(this,'gdb.soldoutok','','',event); return false;"><img
				src="https://cafe.pstatic.net/cafe4/btn_confirm9.gif" alt="확인"></a>
			<a href="#"
				onclick="Element.hide('confirm_soldout_2'); return false;"><img
				src="https://cafe.pstatic.net/cafe4/btn_cancel2.gif" width="48"
				height="28" alt="취소"></a>
		</div>
		<a href="#" onclick="Element.hide('confirm_soldout_2'); return false;"
			class="closelayer"><img
			src="https://cafe.pstatic.net/cafe4/btn_close4.gif" width="19"
			height="19" alt="닫기"></a>
	</div>
	<div id="delcalendar" class="cafe_calendar_layer"
		style="display: none; width: 279px; z-index: 2000; position: absolute;">
		<h3>카페 캘린더에서 제외</h3>
		<button type="button" class="close"
			onclick="Element.hide('delcalendar');"
			onmouseover="this.className='close close_over';"
			onmouseout="this.className='close';">
			<span><em>닫기</em></span>
		</button>
		<p>이 게시글을 카페 캘린더에서 제외하시겠습니까?</p>
		<div class="btn_area">
			<span class="btn_ok"><input type="image"
				src="https://cafe.pstatic.net/img/calendar/blank.gif" alt="확인"
				onclick="cancelCafeCalendar()" onmouseover="this.className='over'"
				onmouseout="this.className='release'"></span> <span
				class="btn_cancel"><a href="#"
				onclick="Element.hide('delcalendar'); return false;"
				onmouseover="this.className='over'"
				onmousedown="this.className='down'"
				onmouseout="this.className='release'"><em>취소</em></a></span>
		</div>
	</div>


	<div id="registcalendar" class="cafe_calendar_layer"
		style="display: none; width: 258px;">
		<h3>카페 캘린더에 등록</h3>
		<button type="button" class="close"
			onclick="Element.hide('registcalendar');"
			onmouseover="this.className='close close_over';"
			onmouseout="this.className='close';">
			<span><em>닫기</em></span>
		</button>
		<p>이 게시글을 카페 캘린더로 보내시겠습니까?</p>
		<div class="btn_area">
			<span class="btn_ok"><input type="image"
				src="https://cafe.pstatic.net/img/calendar/blank.gif" alt="확인"
				onclick="registCafeCalendar()" onmouseover="this.className='over'"
				onmouseout="this.className='release'"></span> <span
				class="btn_cancel"><a href="#"
				onclick="Element.hide('registcalendar'); return false;"
				onmouseover="this.className='over'"
				onmousedown="this.className='down'"
				onmouseout="this.className='release'"><em>취소</em></a></span>
		</div>
	</div>


	<div id="article_scraplayer"
		style="display: none; width: 193px; position: absolute; z-index: 500; top: 550px; left: 120px;"
		class="ly_spi_wrap">
		<ul>

			<li>블로그/카페 공유<span class="opt">본문</span></li>

			<li>외부 공유<span class="opt">허용</span></li>

			<li class="scrap">블로그/카페 공유수<span class="opt"><a
					class="_rosRestrict">0</a></span></li>


			<li class="line dep">
				<ul class="">
					<li><a href="#"
						onclick="showNoticeOptionLayer(false);return false;">공지로 등록</a></li>


				</ul>
			</li>


			<li style="padding-left: 0px;"><a href="#"
				onclick="boardPrint();">인쇄하기</a></li>
		</ul>

		<div class="layernotice" id="noticeOption" style="display: none;">
			<div class="inner_layer">
				<strong class="tit"> 공지로 등록 </strong>
				<p class="txt">전체 공지나 필독공지로 등록하면 멤버들에게 알림이 발송됩니다.</p>
				<ul class="list_notice">
					<li><input type="radio" id="notice01" name="type" class="inp"
						value="N" onchange="" checked=""><label for="notice01"
						class="lab"><span class="ico_chk"></span>전체 공지</label></li>
					<li><input type="radio" id="notice02" name="type" class="inp"
						value="M" onchange=""><label for="notice02" class="lab"><span
							class="ico_chk"></span>게시판 공지</label></li>

					<li><input type="radio" id="notice03" name="type" class="inp"
						value="R" onchange=""><label for="notice03" class="lab"><span
							class="ico_chk"></span>필독 공지</label></li>

				</ul>
				<div class="btns">
					<button type="button" class="link" onclick="">취소</button>
					<button type="submit" class="link link_confirm" id="confirm_notice"
						onclick="">확인</button>
				</div>
			</div>
		</div>

	</div>

	<div id="saveImageLayer" class="atch_img_save"
		style="display: none; top: 628px; left: 544px;">
		<a href="#" class="btn_save"><span class="blind">원본 저장하기</span></a>

		<div id="saveOptionLayer" class="save_opt" style="display: none">
			<a href="#" class="opt _saveToLocal"><span class="blind">내PC
					저장</span></a> <a href="#" class="opt2 _saveToNdrive"><span class="blind">네이버
					클라우드</span></a>
		</div>
	</div>

	<div id="board_info">
		<input type="hidden" name="boardUid"
			value="${post.userCafeBoardVO.boardUid}" />
	</div>



	<form name="frm" method="post" action="/board/d/update_post"
		type="hidden">
		<%--        <input type="hidden" name="boardUid" value="${post.boardUid}"/>--%>
		<%--        <input type="hidden"--%>
	</form>
</div>

