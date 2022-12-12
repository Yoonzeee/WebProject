<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberManagement.MemberBean"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("uid");
int admin = (int) session.getAttribute("admin");
int available = (int) session.getAttribute("available");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listMember</title>
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

	<h2 class="header"><%=uid%>님 안녕하세요~~~!!
	</h2>
	<h2>회원목록</h2>
	<form name="frmList" method="get" action="<c:url value='list'/>" encType="utf-8">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>핸드폰번호</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>로그인가능여부</th>
					<th>탈퇴관리</th>
					<th>로그인관리</th>
				</tr>
			</thead>
			<tbody>

				<c:set var="i" value="1" />
				<c:set var="i">1</c:set>

				<c:forEach var="memberBean" items="${listMembers}" varStatus="listMembersStatus">
					<tr class="${listMembersStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}">

						<td>${listMembersStatus.count}</td>
						<td>${memberBean.uid}</td>
						<td>${memberBean.pwd}</td>
						<td>${memberBean.name}</td>
						<td>${memberBean.phone}</td>
						<td>${memberBean.email}</td>
						<td>${memberBean.joinDate}</td>
						
						<c:if test="${memberBean.available eq 1}">
						<td>로그인 가능</td>
						</c:if>
						<c:if test="${memberBean.available eq 0}">
						<td>로그인 불가능</td>
						</c:if>
						<td><a href="/MyProject/member/adminDelete?uid=${memberBean.uid}">탈퇴</a></td>
						<td><a href="/MyProject/member/adminLogin?uid=${memberBean.uid}">관리</a></td>
						
						<c:set var="i">${i+1}</c:set>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form>
</body>
</html>