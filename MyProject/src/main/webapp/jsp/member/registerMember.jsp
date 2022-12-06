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
	아이디: <input type="text" id="uid" name="uid"> <input type="button" value="중복확인" id="dupUidCheckButton"><br/>
	<div id="uid_valid_msg"></div>
	비밀번호:	<input type="password" id="pwd" name="pwd"><br>
	비밀번호 확인:	<input type="password" id="pwdConfirm" name="pwdConfirm"><br>
	이름: <input type="text" id="uname" name="uname"><br>
	핸드폰 번호: <input type="text" id="phone" name="phone"><br>
	이메일: <input type="text" id="email" name="email"><br>
	<input type="button" value="회원가입" id="insertButton">
	</form>
	
	
	<script type="text/javascript">
	let dupUidCheckButton = document.querySelector("#dupUidCheckButton");
	dupUidCheckButton.onclick = () => {
		dupUidCheck();
	}
	
	let uid = document.querySelector("#uid");
	uid.onblur = () => {
		dupUidCheck();
	}
	
	let insertButton = document.querySelector("#insertButton");
	insertButton.onclick = () => {
		jsInsert();
	}
	
	async function dupUidCheck() {
		let response = await fetch('/MyProject/member/dupUidCheck?uid=' + uid.value);
		let jsonResult = await response.json();
		if (jsonResult.status == false) {
			alert("[" + uid.value + "]" + jsonResult.message);
		}
		let uid_valid_msg = document.querySelector("#uid_valid_msg");
		uid_valid_msg.innerHTML =  "[" + uid.value + "]" + jsonResult.message;
	}
	
	function jsInsert () {
		//아이디 중복 확인
		fetch('/MyProject/member/dupUidCheck?uid=' + uid.value)
		.then(response => response.json())
		.then(jsonResult => {
			let uid_valid_msg = document.querySelector("#uid_valid_msg");
			uid_valid_msg.innerHTML =  "[" + uid.value + "]" + jsonResult.message;
			if (jsonResult.status == false) {
				alert("[" + uid.value + "]" + jsonResult.message);
			} else {
				alert("잠시 대기...");
				//uid=user10&pwd=123&name=홍길동
				fetch('/pro14/member/insert?uid=' + uid.value + "&pwd=" + pwd.value + "&" + "name=" + name.value)
				.then(response => response.json())
				.then(jsonResult => {
					//처리후 메시지 출력
					alert(jsonResult.message);
					if (jsonResult.status == true) {
						//성공시 이동할 페이지로 이동한다  
						location.href = jsonResult.url;
					}
				});
				
				let param = {
					"uid" : uid.value,
					"pwd" : pwd.value,
					"name1" : name1.value
				};
				
				fetch('/MyProject/member/insert', {
					//option
					method : 'POST',
					headers: {
					    'Content-Type': 'application/json;charset=utf-8'
					},
					body: JSON.stringify(param)//{"uid":"user10","pwd":"123", "name":"홍길동"}			
				})
				.then(response => response.json())
				.then(jsonResult => {
					//처리후 메시지 출력
					alert(jsonResult.message);
					if (jsonResult.status == true) {
						//성공시 이동할 페이지로 이동한다  
						location.href = jsonResult.url;
					}
				});
			}
		});
	}
	</script>
</body>
</html>