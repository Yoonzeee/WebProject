<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String uid = (String)session.getAttribute("uid");
String pwd = (String)session.getAttribute("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchPwdForm</title>
</head>
<body>
<h2 class="header"><%= uid %>님 안녕하세요~~~!!</h2>
<h2>비밀번호 찾기</h2>

	<form name="frmSearchPwdForm" method="post" action="<c:url value='/search'/>" encType="utf-8">
	아이디: <input type="text" id="uid" name="uid"><br>
	핸드폰번호: <input type="text" id="phone" name="phone"><br>
	<input type="submit" value="비밀번호 찾기">
    <input type="reset" value="다시입력">
	</form>
</body>
</html>