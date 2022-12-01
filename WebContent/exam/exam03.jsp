<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>exam03.jsp</h2>

<form name="account" method="post" action="exam03Proc.jsp">
<table border="0">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>		
	</tr>
	<tr>
		<td>주민번호</td>
		<td><input type="text" name="idNum"></td>		
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="contacts"></td>		
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>		
	</tr>
	<tr>
		<td colspan="2">
		<button tyle="submit">확인</button>
	</tr>
	
</table>
</form>
</body>
</html>