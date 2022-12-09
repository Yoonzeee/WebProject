<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listMember</title>
</head>
<body>
	<h2 class="header"><%=uid%>님 안녕하세요~~~!!
	</h2>
	<h2>게시물 목록</h2>
	<form name="frmBoardList" method="get" action="<c:url value='Boardlist'/>"
		encType="utf-8">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="i" value="1" />
				<c:set var="i">1</c:set>

				<c:forEach var="boardBean" items="${listBoards}" varStatus="listBoardsStatus">
					<tr class="${listBoardsStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}">

						<td>${listBoardsStatus.count}</td>
						<td>${boardBean.category}</td>
						<td><a href="/MyProject/board/getPost?bno=${boardBean.bno}">${boardBean.title}</a></td>
						<td>${boardBean.uid}</td>
						<td>${boardBean.writeDate}</td>
						<td>${boardBean.viewCount}</td>
						<c:set var="i">${i+1}</c:set>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<input type="button" value="글쓰기" onClick="location.href='<c:url value='jsp/board/postForm.jsp'/>'">
			
		</div>
	</form>
</body>
</html>