<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String uid = (String)session.getAttribute("uid");
String pwd = (String)session.getAttribute("pwd");
String name = (String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchPwdForm</title>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
        
<h2 class="head">비밀번호 찾기</h2>
	<div class="searchPwd-form">
		<form name="frmSearchPwdForm" method="post" action="<c:url value='/search'/>" encType="utf-8">
			<input type="text" id="uid" name="uid" class="text-field" placeholder="아이디">
			<input type="text" id="phone" name="phone" class="text-field" placeholder="휴대전화">
			<input type="submit" value="찾기" class="btn">
		</form>
	</div>
	<div class="links">
		<a href="loginForm.jsp">돌아가기</a>
	</div>
</body>
</html>