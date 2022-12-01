<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입</h2>
<form name="account" method="post" action="exam04Proc.jsp">
<table border="0">
	<tr>
	<td>아이디</td>
	<td><input type="text" name="id"></td>
	</tr>
	<tr>
	<td>패스워드</td>
	<td><input type="password" name="pw"></td>
	</tr>
	<tr>
	<td>이름</td>
	<td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>닉네임</td>
	<td><input type="text" name="nickname"></td>
	</tr>
	<tr>
	<td>휴대폰</td>
	<td><input type="text" name="mobile"></td>
	</tr>
	<tr>
	<td>이메일</td>
	<td><input type="text" name="email"></td>
	</tr>
	<tr>
	<td>주민번호</td>
	<td><input type="text" name="idNum"></td>
	</tr>
	<tr>
	<td>주소</td>
	<td><input type="text" name="add"></td>
	</tr>
	<tr>
	<td colspan="2">
	<button type="submit">확인</button>
	</tr>	
</table>
</form>
<!-- <script>
	function moveToProc() {
		document.account.action="exam04Result.jsp";
		document.account.method="post";
		document.account.submit();
	}
</script> -->
</body>
</html>