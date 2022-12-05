<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<form name="frmLogin" method="post" action="login" encType="utf-8">
	아이디: <input type="text" id= "uid" name=uid"><br/>
	비밀번호:	<input type="password" id="pwd" name="pwd"><br>
	<input type="submit" value="로그인">
    <input type="reset" value="다시입력">
	</form>
</body>
</html>