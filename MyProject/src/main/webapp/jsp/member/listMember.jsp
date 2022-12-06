<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listMember</title>
</head>
<body>
<h2>회원목록들</h2>
	<form name="frmList" method="get" action="list" encType="utf-8">
	<table border=1>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>나이</td>
		<td>핸드폰번호</td>
		<td>이메일</td>
		<td>가입일자</td>
	</tr>
	<c:forEach items="${members}" var="member">
		<tr>
			<td>${member.uid}</td>
			<td>${member.pwd}</td>
			<td>${member.name}</td>
			<td>${member.phone}</td>
			<td>${member.email}</td>
			<td>${member.joinDate}</td>
		</tr>
		</c:forEach>
</table>
	</form>
</body>
</html>