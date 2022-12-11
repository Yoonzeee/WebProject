<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String bno = (String)session.getAttribute("bno");
String uid = (String)session.getAttribute("uid");
String title = (String)session.getAttribute("title");
String content = (String)session.getAttribute("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePost</title>
<style type="text/css">

/* 넓이 높이 조절 */
.ck.ck-content {
   	max-width: 1000px;
}
.ck-content__editable {
    min-height: 300px;
}

</style>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/translations/ko.js"></script>
</head>
<body>

<h2>게시물 수정</h2>

	<form name="frmUpdatePost" method="post" action="<c:url value='/board/updatePost'/>" encType="utf-8">
	
		<label>제목</label>
		<input type="text" id="bno" name="bno" class="text-field" value=<%= bno %> readonly><br/>
		<input type="text" name="title" id="title" class="text-field"  value=<%= title %>><br/>
		<select id="category" name="category"> 
			<option value="일반">일반</option>
			<option value="공지">공지</option>
			<option value="Q&A">Q&A</option>
		</select>
		<label>작성자</label> 
			<input type="text" id="uid" name="uid" class="text-field" value=<%= uid %> readonly><br/>
		<label>내용</label>
			<textarea name="content" id="content" class="text-field" value=<%= content %>></textarea>
	
	<input type="submit" value="수정">
	<input type="button" value="목록으로" onClick="location.href='<c:url value='/Boardlist'/>'">
	
	</form>
<script>
        ClassicEditor
            .create( document.querySelector( '#content' ), {language : "ko"} )
            .catch( error => {
                console.error( error );
        } );
</script>

</body>
</html>