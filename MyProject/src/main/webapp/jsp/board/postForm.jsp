<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
int admin = (int) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="<c:url value='/jsp/board/css/styles.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">


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

	<header>
            <div id="logo">
            	<a style="color: white;" href="/MyProject/jsp/member/index.jsp">WebProject</a>
            </div>
 
            <div id="top_menu">
                <a href="<c:url value='/myPage'/>">마이페이지</a> | 
                <a href="/MyProject/jsp/member/updateMember.jsp">정보수정</a> |
                <c:if test="${admin eq 1}">
               		<a href="<c:url value='/list'/>">회원관리</a> |
               	</c:if>
                <a href="/MyProject/jsp/member/deleteMember.jsp">회원탈퇴</a> |
                <a href="<c:url value='/logout'/>">로그아웃</a> 
            </div>
             
            <nav>
                <ul>
                    <li><a href="<c:url value='/Boardlist'/>">BOARD</a></li>
                    <li><a href="#">CHAT</a></li>
                </ul>
            </nav>
        </header>

<form name="frmPost" method="post" action="<c:url value='/postBoard'/>" encType="utf-8">
	<label>작성자</label>
	<input type="text" id="uid" name="uid" class="text-field" value=<%= uid %> readonly><br/>
	<select id="category" name="category">
		<option value="일반">일반</option>
		<option value="공지">공지</option>
		<option value="Q&A">Q&A</option>
	</select>
	<label>제목</label>
	<input type="text" name="title" id="title"><br/>
	<!-- <label>내용</label> -->
	<textarea name="content" id="editor"></textarea>
	
	<input type="submit" value="작성">
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