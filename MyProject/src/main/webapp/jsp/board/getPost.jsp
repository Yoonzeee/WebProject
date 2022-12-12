<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String bno = (String) session.getAttribute("bno");
String uid = (String) session.getAttribute("uid");
int admin = (int) session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPost</title>
<link rel="stylesheet" href="<c:url value='/jsp/board/css/styles.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

</head>
<body>

		<header>
            <div id="logo">
                <img src="#" alt="Logo">
            </div>
 
            <div id="top_menu">
                <a href="<c:url value='/myPage'/>">마이페이지</a> | 
                <a href="/MyProject/jsp/member/updateMember.jsp">정보수정</a> |
                <c:if test="${admin eq 1}">
               		<a href="<c:url value='/list'/>">회원검색</a> |
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

<form name="frmGetPost" method="post" action="<c:url value='/postBoard'/>" encType="utf-8">
	<h1>게시물</h1>
	<h2>제목</h2>
		<input type="text" id="bno" name="bno" value=<%= bno %>>
		<div style="background-color: #eeeeee">${getPost.title}</div>
	<h2>작성자</h2>
		<div style="background-color: #eeeeee">${getPost.uid}</div>
	<h2>작성날짜</h2>
		<div style="background-color: #eeeeee">${getPost.writeDate}</div>
	<h2>조회수</h2>
		<div style="background-color: #eeeeee">${getPost.viewCount}</div>
	<h2>분류</h2>
		<div style="background-color: #eeeeee">${getPost.category}</div>
	<h2>게시물내용</h2>
		<div style="background-color: #eeeeee">${getPost.content}</div>
	<div>
		<input type="button" value="목록" onClick="location.href='<c:url value='/Boardlist'/>'">
		<c:if test="${uid eq getPost.uid || admin eq 1}">
			<input type="button" value="수정" onClick="location.href='/MyProject/jsp/board/updatePost.jsp'">
			<input type="button" value="삭제" onClick="location.href='/MyProject/jsp/board/deletePost.jsp'">
		</c:if>
	</div>
</form>
</body>
</html>