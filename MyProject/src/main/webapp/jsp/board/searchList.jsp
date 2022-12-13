<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
String pwd = (String) session.getAttribute("pwd");
String name = (String) session.getAttribute("name");
int admin = (int) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/jsp/board/css/styles.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

</head>
<body>

	<header>
    	<div id="logo">
            	<a style="color: white;" href="/MyProject/jsp/member/index.jsp">WebProject</a>
        </div>
        <div id="top_menu">
            <a href="<c:url value='/myPage'/>">마이페이지</a> | 
            <a href="/MyProject/jsp/member/updateMember.jsp">정보수정</a> |
            <c:if test="${admin eq 1}">
           		<a href="<c:url value='/list'/>">회원관리</a> |
           	</c:if>
            <a href="/MyProject/jsp/member/deleteMember.jsp">회원탈퇴</a> |
            <a href="<c:url value='/logout'/>">로그아웃</a> 
        </div>
             
        <nav>
           <ul>
               <li><a href="<c:url value='/Boardlist'/>">BOARD</a></li>
               <li><a href="#">CHAT</a></li>
           </ul>
        </nav>
    </header>
	<h2 class="header"><%=uid%>님 안녕하세요~~~!!</h2>
	<h2>게시물 목록</h2>
	
	<form name="frmSearchList" method="get" action="<c:url value='SearchList'/>" encType="utf-8">
		<select id="category" name="category">
			<option value="title">제목</option>
			<option value="uid">작성자</option>
		</select>
			<input type="text" id="findPost" name="findPost">
			<input type="submit" value="찾기"><br/>
	</form>

	<form name="frmBoardList" method="get" action="<c:url value='SearchList'/>" encType="utf-8">
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

				<c:forEach var="boardBean" items="${searchList}" varStatus="searchListStatus">
					<tr class="${searchListStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}">

						<td>${searchListStatus.count}</td>
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