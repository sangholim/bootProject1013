<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<input type="text" id="post_subject" placeholder="제목" height="100px"/>

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

<input type="button" id="insertbtn" value="글쓰기" />