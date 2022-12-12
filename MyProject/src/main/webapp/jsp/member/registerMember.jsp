<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<%
String uid = (String)session.getAttribute("uid");
String name = (String)session.getAttribute("name");
int admin = (int)session.getAttribute("admin");
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMember</title>
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
<h2 class="header"><%= name %>님 안녕하세요~~~!!</h2>

<h2>회원 가입</h2>

	<form name="frmRegister" method="post" action="<c:url value='/register'/>" encType="utf-8">
	아이디: <input type="text" id= "uid" name="uid"><br/>
	비밀번호:	<input type="password" id="pwd" name="pwd"><br/>
	이름: <input type="text" id="name" name="name"><br/>
	핸드폰번호: <input type="text" id="phone" name="phone"><br/>
	이메일: <input type="text" id="email" name="email"><br/>
	<input type="submit" value="회원가입">
    <input type="reset" value="다시입력">
	</form>
	
</body>
</html>