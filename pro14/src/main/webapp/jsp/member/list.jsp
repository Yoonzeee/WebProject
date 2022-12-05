<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pro14.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
.trOdd {
	background-color: red;
}
.trEven {
	background-color: pink;
}

</style>
<script type="text/javascript">
async function jsDan(event, dan) {
	event.preventDefault();
	
	let danDiv = document.querySelector("#dan_" + dan);
	if (danDiv != null) {
		let response = await fetch('/pro14/dan?dan=' + dan);
		let json = await response.json();
		if (json.status) {
			let result = json.result;
			let text = "";
			for (i=0;i<result.length;i++) {
				text += dan + '*' + result[i].i + '=' + result[i].rst + "<br/>"; 
			}
			danDiv.innerHTML = text;
		} else {
			alert(json.message);
		}
	}
	return false;
}
</script>
</head>
<body>
<c:import url="top.jsp"></c:import>

 <form>
	  사용자명 : <input id="user" type="text" value="anonymous">
      <!-- 송신 메시지를 작성하는 텍스트 박스 -->
      <input id="textMessage" type="text">
      <!-- 메시지 송신을 하는 버튼 -->
      <input onclick="sendMessage()" value="전송" type="button">
      <!-- WebSocket 접속 종료하는 버튼 -->
      <input onclick="disconnect()" value="연결해제" type="button">
    </form>
    <!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
    <textarea id="messageTextArea" rows="10" cols="50"></textarea>
    <br/>

<script type="text/javascript">
		//주석 
      // 「WebSocketEx」는 프로젝트 명
      // 「websocket」는 호스트 명
      // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
      var webSocket = new WebSocket("ws://localhost:8880/pro14/websocket");
      
      // 콘솔 텍스트 에리어 오브젝트
      var messageTextArea = document.getElementById("messageTextArea");
      
      // WebSocket 서버와 접속이 되면 호출되는 함수
      webSocket.onopen = function(message) {
        // 콘솔 텍스트에 메시지를 출력한다.
        messageTextArea.value += "Server connect...\n";
      };
      // WebSocket 서버와 접속이 끊기면 호출되는 함수
      webSocket.onclose = function(message) {
        // 콘솔 텍스트에 메시지를 출력한다.
        messageTextArea.value += "Server Disconnect...\n";
      };
      // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
      webSocket.onerror = function(message) {
        // 콘솔 텍스트에 메시지를 출력한다.
        messageTextArea.value += "error...\n";
      };
      // WebSocket 서버로 부터 메시지가 오면 호출되는 함수
      webSocket.onmessage = function(message) {
        // 콘솔 텍스트에 메시지를 출력한다.
        messageTextArea.value += message.data+"\n";
      };
     // Send 버튼을 누르면 호출되는 함수
    function sendMessage() {
      // 유저명 텍스트 박스 오브젝트를 취득
      var user = document.getElementById("user");	 
    	 
      // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득한다.
      var message = document.getElementById("textMessage");
      // 콘솔 텍스트에 메시지를 출력한다.
      messageTextArea.value += "Send to Server => "+message.value+"\n";
      //json 객체를 생성한다
      let jsonObject = {
   		userName : user.value,
   		message : message.value
      };
      //WebSocket 서버에  json 문자열을 전송한다 
      webSocket.send(JSON.stringify(jsonObject));
      // 송신 메시지를 작성하는 텍스트 박스를 초기화한다.
      message.value = "";
    }
    // Disconnect 버튼을 누르면 호출되는 함수
    function disconnect() {
      // WebSocket 접속 해제
      webSocket.close();
    }
  </script>
	
	
아이디 : <input type="text" id="uid" name="uid"> <input type="button" value="중복확인" id="dupUidCheckButton"><br/>
<div id="uid_valid_msg"></div>
비밀번호 : <input type="password" id="pwd" name="pwd"><br/>
이름 : <input type="text" id="name1" name="name1"><br/>
<input type="button" value="회원가입" id="insertButton">

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

	let response = await fetch('/pro14/member/dupUidCheck?uid=' + uid.value);
	let jsonResult = await response.json();
	if (jsonResult.status == false) {
		alert("[" + uid.value + "]" + jsonResult.message);
	}
	let uid_valid_msg = document.querySelector("#uid_valid_msg");
	uid_valid_msg.innerHTML =  "[" + uid.value + "]" + jsonResult.message;
	
}

function jsInsert () {
	//아이디 중복 확인
	fetch('/pro14/member/dupUidCheck?uid=' + uid.value)
	.then(response => response.json())
	.then(jsonResult => {
		let uid_valid_msg = document.querySelector("#uid_valid_msg");
		uid_valid_msg.innerHTML =  "[" + uid.value + "]" + jsonResult.message;
		if (jsonResult.status == false) {
			alert("[" + uid.value + "]" + jsonResult.message);
		} else {
			alert("잠시 대기...");
			//uid=user10&pwd=123&name=홍길동
			/*
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
			*/
			let param = {
				"uid" : uid.value,
				"pwd" : pwd.value,
				"name1" : name1.value
			};
			
			fetch('/pro14/member/insert', {
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
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>email</th>
			<th>가입일</th>
		</tr>
	</thead>
	<tbody>
	
	<c:set var="i" value="1"/>
	<c:set var="i" >1</c:set>
	
	<c:forEach var="memberBean"	 items="${listMembers}" varStatus="listMembersStatus">
<%-- 	
		<tr class="<c:if test='${listMembersStatus.count % 2 == 0}'>trEven</c:if>
		           <c:if test='${listMembersStatus.count % 2 == 1}'>trOdd</c:if>">
		<tr class="<c:choose>
			<c:when test="${listMembersStatus.count % 2 == 0}">trEven</c:when>
			<c:otherwise>trOdd</c:otherwise>
		</c:choose>" >
--%>		           
		<tr class="${listMembersStatus.count % 2 == 0 ? 'trEven' : 'trOdd'}" >
		           
			<td>${listMembersStatus.count}, ${listMembersStatus.index}, ${listMembersStatus.current}, ${listMembersStatus.first}, ${listMembersStatus.last}</td>
			<td>${memberBean.id}</td>
			<td>${memberBean.pwd}</td>
			<td>${memberBean.name}</td>
			<td>${memberBean.email}</td>
			<td>${memberBean.joinDate}</td>
			<c:set var="i" >${i+1}</c:set>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:forEach var="dan" begin="2" end="9" >
<h1><a href='#' onClick='return jsDan(event, ${dan})'>${dan}단</a></h1>
<div id="dan_${dan}"></div>
</c:forEach>

<h1><a href='#' onClick='return jsDan(event, "")'>단</a></h1>
<div id="dan_"></div>

<%-- 
<table border=1>
	<c:forEach var="idx" begin="1" end="9" >
		<tr>
			<td>2</td>
			<td>*</td>
			<td>${idx}</td>
			<td>=</td>
			<td>${2 * idx}</td>
		</tr>
	</c:forEach>
</table>
--%>
<c:set var="str" >aaa,bbb,ccc,ddd</c:set>
<c:set var="str" value="aaa,bbb,ccc,ddd"/>

<table border=1>
	<c:forTokens var="idx" items="${str}" delims=",">
		<tr>
			<td>${idx}</td>
		</tr>
	</c:forTokens>
</table>

</body>
</html>