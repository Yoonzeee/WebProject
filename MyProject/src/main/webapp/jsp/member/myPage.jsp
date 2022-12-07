<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberManagement.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
</head>
<body>
<h2 class="header">${memberBean.uid}님 안녕하세요~~~!!
	</h2>
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

				<c:forEach var="memberBean" items="${myPage}"
					varStatus="listMembersStatus">
					<tr
						class="${listMembersStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}">

						<td>${memberBean.uid}</td>
						<td>${memberBean.name}</td>
						<td>${memberBean.phone}</td>
						<td>${memberBean.email}</td>
						<td>${memberBean.joinDate}</td>
						<c:set var="i">${i+1}</c:set>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form>
</body>
</html>