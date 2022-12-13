<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<title>deleteMember</title>
<link rel="stylesheet" href="<c:url value='/jsp/member/css/styles.css'/>">
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

<h2 class="header"><%= uid %>님 안녕하세요~~~!!</h2>
<h2>회원 탈퇴</h2>

	<form name="frmDelete" method="post" action="<c:url value='/delete'/>" encType="utf-8">
	아이디: <input type="text" value="${uid}" id="uid" name="uid"><br>
	비밀번호: <input type="password" name="pwd"><br>
	비밀번호 확인:	<input type="password" name="pwd1"><br>
	<input type="submit" value="회원탈퇴">
    <input type="reset" value="다시입력">
	</form>
</body>
</html>