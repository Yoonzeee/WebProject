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
<title>Insert title here</title>
</head>
<body>
<form name="frmDeletePost" method="post" action="<c:url value='/board/deletePost'/>" encType="utf-8">
	게시물을 삭제하시겠습니까?
		<label></label>
		<input type="text" id="bno" name="bno" class="text-field" value=<%= bno %> readonly><br/>
	<div>
		<input type="submit" value="삭제">
		<input type="button" value="취소" onClick="location.href='<c:url value='/Boardlist'/>'">
	</div>		
</form>
</body>
</html>