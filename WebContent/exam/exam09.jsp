<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="exam09Form">
<table border="1">
	<tr>
		<td>이름1</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>이름2</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>이름3</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
			<input type="radio" name="grade" value="최우수회원">최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원">우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원">일반회원
		</td> 
	</tr>		
	<tr>
	<td colspan="2">
	<button type="button" onClick="formSubmit();">확인</button>
	</tr>	
</table>
</form>
<script>
	function formSubmit() {
		document.exam09Form.action="exam09Proc.jsp";
		document.exam09Form.method="post";
		document.exam09Form.submit();
	}
</script>
</body>
</html>