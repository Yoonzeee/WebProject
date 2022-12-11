<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">

/* 넓이 높이 조절 */
.ck.ck-editor {
   	max-width: 1000px;
}
.ck-editor__editable {
    min-height: 300px;
}

</style>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/35.3.2/classic/translations/ko.js"></script>
</head>
<body>

<form name="frmPost" method="post" action="<c:url value='/postBoard'/>" encType="utf-8">
	<label>제목</label>
	<input type="text" name="title" id="title"><br/>
	<select id="category" name="category">
		<option value="일반">일반</option>
		<option value="공지">공지</option>
		<option value="Q&A">Q&A</option>
	</select>
	<label>작성자</label>
	<input type="text" id="uid" name="uid" class="text-field" value=<%= uid %> readonly><br/>
	<label>내용</label>
	<textarea name="content" id="editor"></textarea>
	
	<input type="submit" value="전송">
	<input type="button" value="목록으로" onClick="location.href='<c:url value='/Boardlist'/>'">
</form>
<script>
        ClassicEditor
            .create( document.querySelector( '#editor' ), {language : "ko"} )
            .catch( error => {
                console.error( error );
        } );
</script>
</body>
</html>