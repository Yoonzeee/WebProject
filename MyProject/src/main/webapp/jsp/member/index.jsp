<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
String pwd = (String) session.getAttribute("pwd");
String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Project Page</title>
<link rel="stylesheet" href="<c:url value='/jsp/member/css/styles.css'/>">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

</head>
<body>

	<header>
            <div id="logo">
                <img src="#" alt="Logo">
            </div>
 
            <div id="top_menu">
                <a href="<c:url value='/myPage'/>">마이페이지</a> | 
                <a href="<c:url value='updateMember.jsp'/>">정보수정</a> |
                <a href="<c:url value='searchPwdForm.jsp'/>">회원검색</a> |
                <a href="<c:url value='deleteMember.jsp'/>">회원탈퇴</a> |
                <a href="#">로그아웃</a> 
            </div>
 
            <nav>
                <ul>
                    <li><a href="#">BOARD</a></li>
                    <li><a href="#">CHAT</a></li>
                </ul>
            </nav>
 
        </header>
 
        <article id="content">
            <section id="main">
                <img src="#" alt="main img">
            </section>
            <section>
                <ul id="banner">
                    <li><a href="#"><img src="#" alt="banner1"></a></li>
                    <li><a href="#"><img src="#" alt="banner2"></a></li>
                </ul>
 
            </section>
 
        </article>
 
        <footer>
            <img src="#" alt="address">
        </footer>
	
	</div>

</body>
</html>