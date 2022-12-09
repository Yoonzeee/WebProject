<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String bno = (String) session.getAttribute("bno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPost</title>
</head>
<body>
	<h1>게시물</h1>
	<h2>제목</h2>
		<div style="background-color: #eeeeee">내용</div>
	<h2>작성자</h2>
		<div style="background-color: #eeeeee">${getPost.uid}</div>
	<h2>작성날짜</h2>
		<div style="background-color: #eeeeee">${getPost.writeDate}</div>
	<h2>조회수</h2>
		<div style="background-color: #eeeeee">${getPost.viewCount}</div>
	<h2>게시물내용</h2>
		<div style="background-color: #eeeeee">${getPost.content}</div>
</body>
</html>