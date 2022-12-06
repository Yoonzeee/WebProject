<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember</title>
</head>
<body>
<h2>회원 탈퇴</h2>

	<form name="frmDelete" method="post" action="delete" encType="utf-8">
	비밀번호: <input type="password" name="pwd"><br>
	비밀번호 확인:	<input type="password" name="pwd2"><br>
	<input type="submit" value="로그인">
    <input type="reset" value="다시입력">
	</form>
</body>
</html>