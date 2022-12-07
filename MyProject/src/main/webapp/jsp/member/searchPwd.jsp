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
<title>searchPwd</title>
</head>
<body>
<h2 class="header"><%=uid%>님 안녕하세요~~~!!
	</h2>
	<h2>비밀번호 찾기</h2>
	<form name="frmSearchPwd" method="get" action="<c:url value='list'/>" encType="utf-8">
		<table border="1">
	<thead>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
		</tr>
	</thead>
	<tbody>
	
	<c:set var="i" value="1"/>
	<c:set var="i">1</c:set>
	
	<c:forEach var="memberBean"	items="${searchPwd}" varStatus="searchPwdStatus">     
		<tr class="${listMembersStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}" >
	
			<td>${memberBean.uid}</td>
			<td>${memberBean.pwd}</td>
			<c:set var="i" >${i+1}</c:set>
		</tr>
	</c:forEach>
	</tbody>
</table>

	</form>
</body>
</html>