<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>searchPwd</title>
<link rel="stylesheet" href="<c:url value='/jsp/member/css/styles.css'/>">
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
        
	<%-- <h2 class="header"><%=name%>님 안녕하세요~~~!!</h2> --%>
	<h2 class="head">비밀번호 찾기</h2>
	<div class="searchPwd-form">
		<form name="frmSearchPwd" method="get" action="<c:url value='list'/>" encType="utf-8">
			<table class="type03">
				<thead>
					<tr>
						<th scope="row">아이디</th>
						<th scope="row">비밀번호</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="1" />
					<c:set var="i">1</c:set>

					<c:forEach var="memberBean" items="${searchPwd}" varStatus="searchPwdStatus">
						<tr>
							<td>${memberBean.uid}</td>
							<td>${memberBean.pwd}</td>
							<c:set var="i">${i+1}</c:set>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>