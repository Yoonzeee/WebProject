<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String uid = (String)session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember</title>
</head>
<body>
<h2 class="header"><%= uid %>님 안녕하세요~~~!!</h2>
<h2>회원 탈퇴</h2>

	<form name="frmDelete" method="post" action="<c:url value='/delete'/>" encType="utf-8">
	아이디: <input type="text" value="${uid}" id="uid" name="uid"><br>
	비밀번호: <input type="password" name="pwd"><br>
	비밀번호 확인:	<input type="password" name="pwd1"><br>
	<input type="submit" value="회원탈퇴">
    <input type="reset" value="다시입력">
	</form>
</body>
</html>