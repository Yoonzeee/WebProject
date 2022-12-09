<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberManagement.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>
<h2 class="header">${myPage.name}님 안녕하세요~~~!!</h2>
	<h2>마이페이지</h2>
	<form name="frmList" method="get" action="<c:url value='list'/>"
		encType="utf-8">
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="1" />
				<c:set var="i">1</c:set>
					<tr>
						<td>${myPage.uid}</td>
						<td>${myPage.name}</td>
						<td>${myPage.phone}</td>
						<td>${myPage.email}</td>
						<td>${myPage.joinDate}</td>
					</tr>
			</tbody>
		</table>

	</form>
</body>
</html>