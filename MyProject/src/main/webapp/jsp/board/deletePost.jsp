<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardManagement.BoardBean"%>
<%@ page import="boardManagement.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String bno = (String)session.getAttribute("bno");
String uid = (String)session.getAttribute("uid");
String title = (String)session.getAttribute("title");
String content = (String)session.getAttribute("content");
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
                <img src="/MyProject/jsp/member/index.jsp" alt="Logo">
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

<form name="frmDeletePost" method="post" action="<c:url value='/board/deletePost'/>" encType="utf-8">
	게시물을 삭제하시겠습니까?
		<label></label>
		<input type="text" id="bno" name="bno" class="text-field" value=<%= bno %> readonly><br/>
	<div>
		<input type="submit" value="삭제">
		<input type="button" value="취소" onClick="location.href='<c:url value='/Boardlist'/>'">
	</div>		
</form>
</body>
</html>