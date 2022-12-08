<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<h2 class="head">로그인</h2>
	<div class="login-form">
		<form name="frmLogin" method="post" action="<c:url value='/login'/>" encType="utf-8">
			<input type="text" id="uid" name="uid" class="text-field" placeholder="아이디">
			<input type="password" id="pwd" name="pwd" class="text-field" placeholder="비밀번호">
			<input type="submit" value="로그인" class="btn">
<!-- 	    	<input type="reset" value="다시입력" class="btn"> -->
		</form>
	</div>
	
	<div class="links">
		<a href="searchPwdForm.jsp">비밀번호 찾을래??</a><br/>
		<a href="registerMember.jsp">회원가입 할래??</a>
	</div>
</body>
</html>