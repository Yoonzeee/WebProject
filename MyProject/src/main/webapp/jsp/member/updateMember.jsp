<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMember</title>
</head>
<body>
<h2>회원정보 수정</h2>

	<form name="frmUpdateMember" method="post" action="update" encType="utf-8">
	비밀번호:	<input type="password" id="pwd" name="pwd"><br>
	이름: <input type="text" id="uname" name="uname"><br>
	핸드폰 번호: <input type="text" id="phone" name="phone"><br>
	이메일: <input type="text" id="email" name="email"><br>
	<input type="button" value="회원가입" id="insertButton">
	</form>
	

</body>
</html>