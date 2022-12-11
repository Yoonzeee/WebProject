<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String bno = (String) session.getAttribute("bno");
String uid = (String) session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPost</title>
</head>
<body>
<form name="frmGetPost" method="post" action="<c:url value='/postBoard'/>" encType="utf-8">
	<h1>게시물</h1>
	<h2>제목</h2>
		<input type="text" id="bno" name="bno" value=<%= bno %>>
		<div style="background-color: #eeeeee">${getPost.title}</div>
	<h2>작성자</h2>
		<div style="background-color: #eeeeee">${getPost.uid}</div>
	<h2>작성날짜</h2>
		<div style="background-color: #eeeeee">${getPost.writeDate}</div>
	<h2>조회수</h2>
		<div style="background-color: #eeeeee">${getPost.viewCount}</div>
	<h2>분류</h2>
		<div style="background-color: #eeeeee">${getPost.category}</div>
	<h2>게시물내용</h2>
		<div style="background-color: #eeeeee">${getPost.content}</div>
	<div>
		<input type="button" value="목록" onClick="location.href='<c:url value='/Boardlist'/>'">
		<c:if test="${uid eq getPost.uid }">
		<input type="button" value="수정" onClick="location.href='/MyProject/jsp/board/updatePost.jsp'">
		<input type="button" value="삭제" onClick="location.href='/MyProject/jsp/board/deletePost.jsp'">
	</c:if>
	</div>
</form>
</body>
</html>