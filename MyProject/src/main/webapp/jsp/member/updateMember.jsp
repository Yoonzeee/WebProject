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
<title>updateMember</title>
</head>
<body>
<h2>회원정보 수정</h2>

	<form name="frmUpdateMember" method="post" action="<c:url value='/update'/>" encType="utf-8">
	
	아이디: <input type="text" value="${uid}" id="uid" name="uid"><br>
	비밀번호:	<input type="password" id="pwd" name="pwd"><br>
	이름: <input type="text" id="name" name="name"><br>
	핸드폰 번호: <input type="text" id="phone" name="phone"><br>
	이메일: <input type="text" id="email" name="email"><br>
	<input type="submit" value="회원정보수정" id="insertButton">
	<input type="button" value="취소" onClick="location.href='<c:url value='index.jsp'/>'">

	</form>

</body>
</html>