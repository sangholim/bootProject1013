<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<head>
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="Content-Type" content="text/html;charset=KSC5601">
    <meta http-equiv="X-UA-Compatible" content="requiresActiveX=true">
    <title>유림회관 : 네이버 카페</title>

    <meta name="referrer" content="always">
    <meta name="decorator" content="mycafe_main_for_wide">
    <meta name="myCafeIntro" content="true">
    <meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
    <%--
    <link rel="stylesheet" href="/css/board/board.css" type="text/css">
     --%>
     <link class="personal_css" rel="stylesheet" href="/css/board/board.css?${applicationScope.cachetype}" type="text/css">
	<style type="text/css">
    	div.autosourcing-stub {
        position: absolute;
        opacity: 0
    	}
    </style>
</head>

<div id="cafe-body-skin">
    <div id="cafe-body" style="width:860px">
        <div id="content-area">
            <div id="main-area" class="skin-1080">
                <div id="appDownload"
                     style="display:none;position:absolute;top:47px;left:447px;z-index:10;padding:10px 12px 12px;border:2px solid #24b728;background:#fff">
                    <div style="width:252px">
                        <p style="margin-left:-1px;line-height:16px;color:#333"><strong><span
                                style="color:#30b229">카페앱</span>을 설치해보세요!</strong></p>
                        <div style="overflow:hidden;padding-top:6px">
                            <div style="float:left;"><span
                                    style="display:inline-block;width:68px;height:84px;background:url(https://cafe.pstatic.net/img/ly_cafeapp_qrcode.gif) no-repeat 0 0"></span>
                            </div>
                            <div style="float:left;padding:0 15px 0 9px">
                                <a href="#" onclick="sendURL();"
                                   style="display:inline-block;overflow:hidden;width:107px;height:28px;background:url(https://cafe.pstatic.net/img/ly_cafeapp_qrcode.gif) no-repeat 0 -87px;line-height:100px;vertical-align:top">설치
                                    URL 문자 전송</a>
                                <p style="margin:0 0 8px -1px;padding-top:4px;font-size:11px;line-height:15px;color:#999;letter-spacing:-1px">
                                    입력하신 번호는 저장되지 않고, <br>전송은 무료입니다.</p>
                                <a href="http://mobile.naver.com/service/cafe" target="_blank"
                                   style="display:inline-block;margin-left:-2px;padding-right:7px;background:url(https://cafe.pstatic.net/img/ly_cafeapp_qrcode.gif) no-repeat 100% -123px;font-size:11px;line-height:15px;color:#333;letter-spacing:-1px;text-decoration:underline">모바일
                                    카페 소개</a>
                            </div>
                        </div>
                    </div>
                    <a href="#" onclick="hideAppDownloadLayer();"
                       style="display:inline-block;overflow:hidden;position:absolute;top:2px;right:2px;width:21px;height:21px;background:url(https://cafe.pstatic.net/img/ly_cafeapp_qrcode.gif) no-repeat 100% 0;line-height:100px;vertical-align:top">닫기</a>
                </div>

                <div id="cafe-intro">
                    <style>
                        table {
                            border-collapse: separate
                        }
                    </style>
                    <div class="gate-list border-sub" style="width:860px;float:left;" id="post_1">
                        <div class="gate-box" id="gate.content">
                            <span class="blind">카페 대문</span>
                            <table role="presentation" style="width:836px;table-layout:fixed;overflow:hidden"
                                   cellspacing="0" cellpadding="0" border="0">
                                <tbody>
                                <tr>
                                    <td height="12"></td>
                                </tr>
                                <tr>
                                    <td id="editorMainContent">
                                        <div class="img_tit_area">
                                            <div class="cafe_default_gate">
                                                <strong class="tit_default">카페에 오신것을 환영합니다.</strong>
                                                <p class="txt_default">혼자보단 둘이, 둘보단 셋이 더 재미있을 거예요.<br>함께 재미있는 이야기 나누며
                                                    행복한 카페를 만들어가요!</p>
                                                <a id="cafeGateModifiableBtn"
                                                   href="/ManageGateEditor.nhn?clubid=29995789" target="_parent"
                                                   class="link_default" style="visibility:hidden;">카페 대문 꾸미기</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="td02" height="12" style="display:none"></td>
                                </tr>
                                <tr>
                                    <td height="12"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <form name="frmGate" method="post" action="/Gate.nhn" onsubmit="return false;">
                        <input type="hidden" name="m" value="reinsertGate">
                        <input type="hidden" name="gate.clubid" value="29995789">
                        <input type="hidden" name="gate.gateid" value="8736266">
                        <input type="hidden" name="page" value="">
                    </form>
                </div>

                <div id="basisElement" class="layout-box">
                    <div id="cafe-data" class="fl ">
                        <div class="cb">
                            <div class="fl c-d-l22">
                                <div class="article-board">
                                    <div class="list-tit-box">
                                        <div class="list-tit">
                                            <h3>
                                                <a href="/ArticleList.nhn?search.clubid=29995789&amp;search.boardtype=L"
                                                   class="m-tcol-t" title="전체글보기">전체글보기</a></h3>
                                            <span><a onclick="clickcr(this, 'cfh.more','','',event);targetChangeForMacSafari('/ArticleList.nhn?search.clubid=29995789&amp;search.boardtype=L');return false;"
                                                    href="/ArticleList.nhn?search.clubid=29995789&amp;search.boardtype=L">더보기(TODO)</a></span>
                                        </div>
                                    </div>
                                    <table class="board-box">
                                        <caption><span class="blind">게시물 목록</span></caption>
                                        <colgroup>
                                            <col>
                                            <col width="120">
                                            <col width="100">
                                            <col width="80">
                                        </colgroup>
                                        <tbody>

                                        <%--<tr>
                                            <td class="td_article"></td>
                                            <td class="td_name"></td>
                                            <td class="td_date">2020.02.01.</td>
                                            <td class="td_view">0</td>
                                        </tr>--%>

                                        <c:forEach var="item" items="${postList}" varStatus="status">
                                            <tr>
                                                <td class="td_article"><a class="board_subject" href="/board/boardCenter/p/${item.boardUid}" />${item.subject}</td>
                                                <td class="td_name">${item.writer}</td>
                                                <td class="td_date">${item.createDateStr}</td>
                                                <td class="td_view">${item.viewCnt}</td>
                                            </tr>
                                        </c:forEach>


										<%--
										TODO: 먼지 모르겠지만 구현해야함
										<tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">(TODO)</td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="4" align="center">

                                            </td>
                                        </tr>
                                        --%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="main-widget-area">
                            <ul class="com">

                            </ul>
                        </div>
                    </div>


                </div>
                <script type="text/javascript">
                    LH.add('oEllipsis.ellipsisPage($("basisElement"))');
                </script>
            </div>
        </div>
    </div>
</div>

<div id="restrict_layer" class="restrict" style="left:200px; top:300px; display:none;">
    <p><strong>접근 제한중</strong>인 게시판의 게시글입니다.</p>
    <span class="shadow shadow1"></span><span class="shadow shadow2"></span><span class="shadow shadow3"></span>
</div>


<a href="#" class="blind"
   onfocus="var t=window.parent.document.getElementById('cafe-footer');t.tabIndex=-1;t.focus();return false"
   style="visibility:visible">콘텐츠 하단</a>

<form name="notifrm" method="post" action="">
    <input type="hidden" name="clubid" value="29995789">
    <input type="hidden" name="noticode" value="">
    <textarea name="comment" style="display: none;" title="댓글 팝업"></textarea>
</form>

<div id="denyNamelessLayer" class="cafetype_layer2" style="width:356px;top:0px;left:440px;margin:0;display:none;">
    <img src="https://cafe.pstatic.net/img/realname/ico_layer.gif" width="25" height="24" alt="">
    <h3><span>유림회관</span> 카페는<br>실명 확인 회원만 가입 받고 있습니다.</h3>
    <p class="layer_txt">카페에 가입 하시려면 실명 확인을 해주세요.</p>
    <div class="btn_box">
        <a href="#" onclick="hideDenyNamelessLayer(); return false;"><img
                src="https://cafe.pstatic.net/img/realname/btn_clse_lay.gif" width="47" height="26" alt="닫기"></a> <a
            href="#" onclick="redirectToCertPage();"><img src="https://cafe.pstatic.net/img/realname/btn_cfm_lay.gif"
                                                          width="105" height="26" alt="실명 확인 하기"></a>
    </div>
    <a href="#" onclick="hideDenyNamelessLayer(); return false;" class="btn_close" role="button"><img
            src="https://cafe.pstatic.net/img/btn_close_layer3.gif" width="19" height="19" alt="닫기"></a>
    <iframe frameborder="0" scrolling="no" style="width:400px;" title="빈프레임"></iframe>
</div>

</html>