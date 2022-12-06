<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMember</title>
</head>
<body>
<h2>회원 가입</h2>

	<form name="frmRegister" method="post" action="register" encType="utf-8">
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